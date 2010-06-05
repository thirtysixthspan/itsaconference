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
    conference_titles = ['conference_intro', 'jim_weirich_keynote', 'ruby_conf_sessions', 'rails3_conf_sessions', 'nosql_conf_sessions', 'server_conf_sessions', 'dave_thomas_keynote'] 
    redirect_to :action=>'index' and return if @access=="Conference Pass" && !conference_titles.include?(@title)
    training_titles = ['conference_intro','nosql_training', 'ruby_training', 'servers_training', 'rails3_training']
    redirect_to :action=>'index' and return if @access=="Training Pass" && !training_titles.include?(@title)
  
  end

  def source
    title = params[:title] || "conference_intro"
    resolution = params[:resolution] || "480p"
    bit_rate = params[:bit_rate] || "hbr"  
    code = params[:code]
    credential = Credential::authenticate(code)
    render "access denied" and return unless credential  
    if resolution=="ipod"
      send_file("#{RAILS_ROOT}/videos/#{title}/#{title}.#{resolution}.#{bit_rate}.mp4")
    else
      send_file("#{RAILS_ROOT}/videos/#{title}/#{title}.#{resolution}.#{bit_rate}.flv")
    end
  end
end
