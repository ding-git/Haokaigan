class HomeController < ApplicationController
  
  def index
    if !signed_in?
      render 'welcome'
    else
          @establishes = Establish.all
          @note = Note.last
      render 'index'
    end  

  end
  
end
