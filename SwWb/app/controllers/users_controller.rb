class UsersController < ApplicationController

    def login
      @page_title = "Sign In"

      unless params["username"]
        render:login
        return
      end

      username = params["username"]
      password = params["password"]
      named_user = User.where({ :username => username }).first

      if named_user
        if named_user.authenticate(password)
          flash[:success]           = "Welcome #{username}, you have signed in!"
          session[:logged_in_user_id]= named_user.id
          redirect_to home_path
        else
          flash[:error] = "Invalid password, please try again"
          render :login
        end
      else
        flash[:error] = "Username not found, please try again"
        render :login
      end
    end

    def login_guest
      username = "guest"
      named_user = User.where({ :username => username }).first
      if named_user
        session[:logged_in_user_id] = named_user.id
        flash[:success]             = "Welcome #{username}, you have signed in!"
        redirect_to home_path
      else
        flash[:error] = "Username not found, please try again"
        render :login        
      end
    end

    def logout
###binding.pry
      reset_session
      @logged_in_user = nil
      flash[:success] = "You have successfully signed out!"
      redirect_to home_path
    end

end
