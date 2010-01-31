class ErrorController < ApplicationController

def index
  redirect_to :action=>:error_404
end

end
