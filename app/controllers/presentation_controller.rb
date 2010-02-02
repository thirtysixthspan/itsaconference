class PresentationController < ApplicationController

  def index 
    @presentations = Presentation.find(:all, :conditions => ['status = "approved"'])    
  end

  def talks
    @presentations = Presentation.find(:all, :conditions => ['format = "keynote" or format = "proposed"'])    
    render :action=>:index
  end

  def training
    @presentations = Presentation.find(:all,:conditions => ['format = "training"'])    
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
