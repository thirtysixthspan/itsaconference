class RdrcController < ApplicationController
  def index
    @comics = Dir["#{Rails.root}/public/rdrc/*.png"].
              sort_by { |f| -File.mtime(f).to_i }
    @image  = "/rdrc/#{File.basename(@comics.first)}"
    @alt    = File.basename(@comics.first, ".png").tr("_", " ")
    @title  = File.read(@comics.first.sub(/\.png\z/, ".txt"))
  end
end
