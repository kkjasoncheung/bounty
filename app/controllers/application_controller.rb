class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def check_search(search)
      if !search.blank?
        redirect_to(:action=>"search", :search=>params[:search])
      end    
    end
end
