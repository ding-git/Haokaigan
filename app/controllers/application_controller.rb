class ApplicationController < ActionController::Base
  protect_from_forgery

  
  include SessionsHelper


  before_filter :switch
  
  private
  
  def verification
    if !signed_in? 
     render 'sessions/new'
    end      
  end
  
  def switch
    @zhihu = true
  end
  
  
  
end
