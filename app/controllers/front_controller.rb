class FrontController < ApplicationController

  def index
   @news = News.find(:all, :limit=>3, :order=> 'post_date DESC') 
  end


  def news
   @news = News.find(:all, :order=> 'post_date DESC') 
  end
  
end
