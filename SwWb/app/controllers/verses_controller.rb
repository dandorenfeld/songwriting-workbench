class VersesController < ApplicationController

    before_filter(:except => ["index", "show"]) {
      unless @logged_in_user
        flash[:error] = "You must sign in to create and alter verses"
        redirect_to("/login") 
        return
      end
    }

    ### Note: Using a private method to be called by create and update may
    ###   be better, but there may be issues with using "return" in the method
    ### Note: Instead of a before_filter, I can do the actual check in the
    ###   action below and it would require a return statement after
    ###   the redirect_to()
    before_filter(:only => ["create", "update"]) {
###binding.pry
      unless params[:cancel].blank?
        flash[:success] = "Your action has been cancelled"
        redirect_to("/home") 
      end
    }

    def index
      @page_title = "List Verses"
      if @logged_in_user
        @verses = @logged_in_user.verses.order("created_at")
      else
        # @verses = Verse.order("created_at")
        admin_user = User.where({ :username => "admin1357" }).first
        @verses    = admin_user.verses.order("created_at")
      end
      render :index
    end
 
    def create
      @page_title = "Add Song Verse"
 
      @verse         = Verse.new
      @verse.date    = Date.today
      @verse.tag     = params["verse-tag"]
      @verse.content = params["verse-content"]
      @verse.user_id = session[:logged_in_user_id]

      if @verse.save
        flash[:success] = "Your verse has been created"
        redirect_to("/home") 
      else
        flash[:error] = "Your verse could not be created"
        render :new
      end
    end

    def new
      @page_title = "Add Song Verse"
      @verse      = Verse.new
      render :new
    end

    def edit
      @page_title = "Edit Verse"

      verse_id = params["id"]
      @verse   = @logged_in_user.verses.find(verse_id)
      render :edit
    end

    def show
      @page_title = "Show Verse"

      verse_id = params["id"]
      @verse   = Verse.where({ :id => verse_id }).first
      render :show
    end

    def update
      @page_title = "Edit Verse"

      verse_id       = params["id"]
      @verse         = @logged_in_user.verses.find(verse_id)

      @verse.tag     = params["verse-tag"]
      @verse.content = params["verse-content"]
      @verse.user_id = session[:logged_in_user_id]

      if @verse.save
        flash[:success] = "Your verse has been updated"
        redirect_to("/home") 
      else
        flash[:error] = "Your verse could not be updated"
        render :edit
      end
    end

    def destroy
      verse_id = params["id"]
      @verse   = @logged_in_user.verses.find(verse_id)

      @verse.destroy
      flash[:success] = "Your verse has been deleted"
      redirect_to("/home")
    end

end
