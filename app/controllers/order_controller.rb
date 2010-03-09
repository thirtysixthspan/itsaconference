class OrderController < ApplicationController

  def form
    @purchase = Purchase.new
  end

  def submit
    @purchase = Purchase.new(params[:purchase])
    @purchase.save
    
    items = params[:item].values.map { |value| value=="1" ? 1 : 0 }
    if !items || items.sum == 0
      @purchase.errors.add_to_base("You must select an item to purchase") 
    end
      
    if @purchase.errors.empty?
      
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

end
