class PresentationController < ApplicationController

  def index 
    @presentations = Presentation.find(:all, :conditions => ['status = "approved"'], :order => 'start_time ASC')    
  end

  def talks
    @presentations = Presentation.find(:all, :conditions => ['(format = "keynote" or format = "talk") and (status = "approved" or status = "confirmed")'], :order => 'start_time ASC')    
    render :action=>:index
  end

  def training
    @presentations = Presentation.find(:all,:conditions => ['format = "training"'], :order => 'start_time ASC')    
    render :action=>:index
  end
  
  def detail
    @presentations = Presentation.find(:all,:conditions=>['id = ?', params[:id]])    
    render :action=>:index
  end  

  def keynote
    redirect_to :action=>:keynote
  end

  def keynotes
    @presentations = Presentation.find(:all,:conditions => ['format = "keynote"'])    
    render :action=>:index
  end





end
