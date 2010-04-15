class RdrcController < ApplicationController
  before_filter :load_comics
  before_filter :select_latest_comic, :only => :index
  before_filter :select_comic,        :only => :show
  before_filter :load_image_and_text
  
  def index
  end

  def show
    render :action => :index
  end
  
  private
  
  def load_comics
    @comics = Dir["#{Rails.root}/public/rdrc/*.png"].sort
  end
  
  def select_latest_comic
    @comic = @comics.last
    @first = @comics.first
    @prev  = @comics[-2]
    @next  = nil
    @last  = @comics.last
  end
  
  def select_comic
    unless params[:id] =~ /\A\d{8}\z/ and
           (@comic = @comics.find { |c| File.basename(c).starts_with?(params[:id]) })
      render :file   => "#{Rails.root}/public/404.html", 
             :status => "404 Not Found"
      return
    end
    i      = @comics.index(@comic)
    @first = @comics.first
    @prev  = i.zero? ? nil : @comics[i - 1]
    @next  = @comics[i + 1]
    @last  = @comics.last
  end
  
  def load_image_and_text
    @image = "/rdrc/#{File.basename(@comic)}"
    @alt   = File.basename(@comic, ".png").sub(/\A\d{8}_/, "").tr("_", " ")
    @title = File.read(@comic.sub(/\.png\z/, ".txt"))
  end
end
