### I commented out the protect_from_forgery line
class ApplicationController < ActionController::Base
  ### protect_from_forgery

  ### @logged_in_user used to display "Sign In" or "Sign Out" and to access
  ###   the users songs, verses, and titles
  before_filter {
    @logged_in_user = User.where(:id => session[:logged_in_user_id]).first
  }
end
