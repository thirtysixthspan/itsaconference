class FrontController < ApplicationController

  def index
   @news = News.find(:all, :limit=>3, :order=> 'post_date DESC') 
  end


  def news
   @news = News.find(:all, :order=> 'post_date DESC') 
  end
  
  
  def video
    @website_video = true
    @resolution = params[:resolution] || "480p"
    @bit_rate = params[:bit_rate] || "hbr"  
  end

  def pv
    @website_video = true
    @title = params[:title] || "conference_intro"
    @resolution = params[:resolution] || "480p"
    @bit_rate = params[:bit_rate] || "hbr"  
    @code = params[:code]
    @credential = Credential::authenticate(@code)
    redirect_to :action=>'index' and return unless @credential  
    @access = @credential.access
  end

  def source
    @title = params[:title] || "conference_intro"
    @resolution = params[:resolution] || "480p"
    @bit_rate = params[:bit_rate] || "hbr"  
    @code = params[:code]
    @credential = Credential::authenticate(@code)
    render "access denied" and return unless @credential  
    send_file("#{{RAILS_ROOT}/videos")
  
end
