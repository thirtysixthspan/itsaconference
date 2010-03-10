require 'rubygems'
require 'simplepay/rails'

class OrderController < ApplicationController

  def form
    @purchase = Purchase.new
  end

  def item
    @item = Item.find_by_id(params[:id]) 
  end

  def submit
    @purchase = Purchase.new(params[:purchase])
    @purchase.save
    
    items = params[:item].values.map { |value| value=="1" ? 1 : 0 }
    if !items || items.sum == 0
      @purchase.errors.add_to_base("You must select an item to purchase") 
    end
      
    if @purchase.errors.empty?
      
      @purchase.payment_code = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join )
      @purchase.payment_status = "unpaid"
      @purchase.save
      
      params[:item].each do |key,value|
        if value=='1' 
          @item = Item.find(:first,:conditions=>['id = ?',key])
          if @item
            @purchased_item = PurchasedItem.new
            @purchased_item.purchase_id = @purchase.id
            @purchased_item.item_id = @item.id
            @purchased_item.value = @item.current_price
            @purchased_item.save
          end
        end
      end

      params[:response].each do |key,value|
        @response = Response.new
        @response.purchase_id = @purchase.id
        @response.question_id = key
        @response.response = value
        @response.save
      end
            
      session[:id] = @purchase.id
      redirect_to :action=>:finalize
    else
      render :action => "form"
    end
  end

  def finalize
    @purchase = Purchase.find(:first, :conditions=>['id = ?', session[:id]])
  end

  def recall
    @purchase = Purchase.find_by_payment_code(params[:id])
    redirect_to :action=>:not_found and return unless @purchase
  end
  
  def not_found
  end

  def payment_initiated
    code = params['referenceId']

    if params['status'] != 'PS' && params['status'] == 'PI'
      redirect_to url_for (:action => "payment_failure", :referenceId=>code) 
    end
    
    @purchase = Purchase.find_by_payment_code(code)
    return if !@purchase
    @purchase.payment_status="processing"
    @purchase.payment_amount=params['transactionAmount']
    @purchase.save
    PurchaseMailer.deliver_notice(@purchase) if @purchase  
  end
 
  def payment_failure
    @code = params['referenceId']
    @purchase = Purchase.find_by_payment_code(code)
    return if !@purchase
    @purchase.payment_status="failed"
    @purchase.save
  end

  def purchase_receipt
    @purchase = Purchase.find(:first, :conditions=>['code = ?', params[:id]])
    render :text => "Your bill was not found. Please contact support@okccoco.com.", :status => 500 unless @purchase
  end

  protect_from_forgery :except => [ :amazon_ipn ]

  def amazon_ipn
    params.delete('controller')
    params.delete('action')
    if valid_simplepay_request?(params)

      if (params['status'] == 'PS')
        purchase=Purchase.find_by_code(params[:referenceId])
        render :nothing=>true, :status=>200 and return unless purchase
        render :nothing=>true, :status=>200 and return unless purchase.paid==false
        purchase.payment_transaction=params['transactionId']
        purchase.payment_status="paid"
        purchase.payment_date=Time.now
        purchase.save
        PurchaseMailer.deliver_purchase_confirmed(purchase)
      end

      if (params['status'] == 'PF')
        purchase=Purchase.find_by_code(params[:referenceId])
        render :nothing=>true, :status=>200 and return unless purchase
        purchase.payment_status="failed"
        purchase.payment_date=Time.now
        purchase.save
        PurchaseMailer.deliver_payment_failed(payment)
      end

    end
    render :nothing=>true, :status=>200
  end  
  
end
