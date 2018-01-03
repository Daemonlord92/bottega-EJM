class ApplicationController < ActionController::Base
  before_action :set_source
  protect_from_forgery with: :exception
  
  include DeviseWhitelist
  
  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
