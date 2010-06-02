class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password
  
  before_filter :add_stylesheets

  def initialize
    @stylesheets = []
    @website_title = "Red Dirt Ruby Conference"
    @website_video = false
  end

  def add_stylesheets
    ["#{controller_name}/_controller", "#{controller_name}/#{action_name}"].each do |stylesheet|
      @stylesheets << stylesheet if File.exists? "#{RAILS_ROOT}/public/stylesheets/#{stylesheet}.css"
    end
  end
  
#  unless  ActionController::Base.consider_all_requests_local
#    rescue_from Exception, :with => :render_404
#  end

  private

  def render_404
    render :template => 'error/error_404', :status => :not_found
  end
  
  
end
