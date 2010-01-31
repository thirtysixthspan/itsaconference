class ProposalController < ApplicationController

  def submit
    @presentation = Presentation.new

  end

  def create
    @presentation = Presentation.new(params[:presentation])

    if @presentation.save
      flash[:notice] = 'Presentation was successfully created.'
      redirect_to :action=>:completed  
    else
      render :action => "submit"
    end
  end

  def completed
    
  end  

end
