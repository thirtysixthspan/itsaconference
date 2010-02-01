class ProposalController < ApplicationController

  def submit
    @presentation = Presentation.new

  end

  def create

    @presentation = Presentation.new(params[:presentation])

    @presentation.errors.add(:photo) if (params[:presentation][:photo] == "")  

    @presentation.save
        
    if @presentation.errors.empty? {    
      /(\.\w+$)/.match(params[:presentation][:photo].original_filename)
      filename = "#{@presentation.id}#{$1}"

      file = File.open("#{RAILS_ROOT}/public/speaker_photos/"+filename, "wb")
      file.write(params[:presentation][:photo].read)
      file.close()
      @presentation.photo = "/speaker_photos/#{filename}"
      @presentation.save
    }
    
    if @presentation.errors.empty?
      redirect_to :action=>:completed  
    else
      render :action => "submit"
    end
  end

  def completed
    
  end  

end
