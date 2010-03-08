class OrderController < ApplicationController

  def form
    @purchase = Purchase.new
  end

  def submit
    @purchase = Purchase.new(params[:purchase])
    @purchase.save
    
    items = params.keys.map { |key| (key=~/item/ && params[key]=='1') ? 1 : 0 } 
    if !items || items.sum == 0
      @purchase.errors.add_to_base("You must select an item to purchase") 
    end
      
    if @purchase.errors.empty?
      redirect_to :action=>:finalized  
    else
      render :action => "form"
    end
  end

  def finalize

  end

end
