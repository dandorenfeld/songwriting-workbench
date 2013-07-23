class TitlesController < ApplicationController

    before_filter(:except => ["index"]) {
###binding.pry
      unless @logged_in_user
        flash[:error] = "You must sign in to create and alter titles"
        redirect_to("/login")
        return
      end
    }

    ### Todo: Make use of the void field with ERb checkbox
    def index
      @page_title = "Song Titles"

      # @titles = Title.order("void").order("title")
      if @logged_in_user
        @titles = @logged_in_user.titles.order("void").order("title")
      else  
        admin_user = User.where({ :username => "admin1357" }).first
        @titles    = admin_user.titles.order("void").order("title")
      end
      render :index
    end

    def create
      ### Note: Using a private method to be called by create and update may
      ###   be better, but there may be issues with using "return" in the method
      ### Note: Instead of a check here, I can use a before_filter
      if params["cancel"].present?
        flash[:success] = "Your action has been cancelled"
        redirect_to("/titles")
        return
      end

      @page_title = "Add Song Title"

      @title         = Title.new
      @title.title   = params["song-title"]
      @title.void    = false
      @title.user_id = session[:logged_in_user_id]

      if @title.save
        flash[:success] = "Your song title has been created"
        redirect_to("/titles") 
      else
        flash[:error] = "Your song title could not be created"
        render :new
      end
    end

    def new
      @page_title = "Add Song Title"
      @title = Title.new
      render :new
    end

    def edit
      @page_title = "Edit Song Title"

      title_id = params["id"]
      @title   = @logged_in_user.titles.find(title_id)
      render :edit
    end

    def update
      if params["cancel"].present?
        flash[:success] = "Your action has been cancelled"
        redirect_to("/titles")
        return
      end

      @page_title = "Edit Song Title"

      title_id = params["id"]
      @title   = @logged_in_user.titles.find(title_id)

      @title.title   = params["song-title"]
      @title.void    = false
      @title.user_id = session[:logged_in_user_id]

      if @title.save
        flash[:success] = "Your song title has been updated"
        redirect_to("/titles") 
      else
        flash[:error] = "Your song title could not be updated"
        render :edit
      end
    end

    def delete
      title_id = params["id"]
      @title   = @logged_in_user.titles.find(title_id)

      @title.destroy
      flash[:success] = "Your title has been deleted"
      redirect_to("/titles")
    end

end
