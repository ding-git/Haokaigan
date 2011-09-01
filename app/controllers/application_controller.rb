class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include SessionsHelper
  
  before_filter :switch
  
  private
  
  def switch
    @zhihu = true
  end
  
end
