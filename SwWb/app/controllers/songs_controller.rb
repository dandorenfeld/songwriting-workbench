class SongsController < ApplicationController

    # The update action has its own check for page validation
    before_filter(:except => ["index", "show", "update"]) {
      unless @logged_in_user
        flash[:error] = "You must sign in to create and alter songs"
        redirect_to("/login")
        return
      end
    }

    def index
###binding.pry
      @page_title = "List Songs"
      if @logged_in_user
        @songs = @logged_in_user.songs.order("final").order("created_at")
      else
        # @songs = Song.order("final").order("created_at")
        admin_user = User.where({ :username => "admin1357" }).first
        @songs     = admin_user.songs.order("final").order("created_at")
      end
      render :index
    end

    def create
      ### Note: Using a private method to be called by create and update may
      ###   be better, but there may be issues with using "return" in the method
      ### Note: Instead of a check here, I can use a before_filter
      if params["cancel"].present?
        flash[:success] = "Your action has been cancelled"
        redirect_to("/home")
        return
      end

      @page_title = "Add Song"

      # This song's priority will be set to 1 after the priority adjustment
      @song          = Song.new
      @song.date     = Date.today
      @song.title    = params["song-title"]
      @song.content  = params["song-content"]
      @song.priority = 0
      @song.final    = (params["final"] ? true : false)
      @song.user_id  = session[:logged_in_user_id]

      if @song.valid?

        # Adjust the priorities if necessary
        4.downto(1) do |n|
          priority_song = Song.where({ :user_id => @song.user_id,
                                       :priority => n }).first
          if priority_song
            priority_song.priority =
              (priority_song.priority == 4) ? 0 : priority_song.priority + 1
            priority_song.save
          end
        end

        @song.priority = 1
        @song.save
        flash[:success] = "Your song has been created"
        redirect_to("/home") 
      else
        flash[:error] = "Your song could not be created"
        render :new
      end
    end

    def new
      @page_title = "Add Song"
      @song       = Song.new
      render :new
    end

    def edit
      @page_title = "Edit Song"

      song_id = params["id"]
      @song   = @logged_in_user.songs.find(song_id)
      render :edit
    end

    def show
      @page_title = "Show Song"

      song_id = params["id"]
      @song   = Song.where({ :id => song_id }).first
      render :show
    end

    def update
      ### Note: Using a private method to be called by create and update may
      ###   be better, but there may be issues with using "return" in the method
      ### Note: Instead of a check here, I can use a before_filter
      if params["cancel"].present?
        flash[:success] = "Your action has been cancelled"
        redirect_to("/home")
        return
      end

      # Allow Set as Current Song to be done while not logged in
      unless params["make-current"].present?
        unless @logged_in_user
          flash[:error] = "You must sign in to create and alter songs"
          redirect_to("/login")
          return
        end
      end

      @page_title = "Edit Song"

      song_id = params["id"]
      @song   = Song.where({ :id => song_id }).first

      # If we are here from the Edit Complete button, update the fields 
      # Otherwise we are here from the Set as Current button
      if params.has_key?("edit")
        @song.title    = params["song-title"]
        @song.content  = params["song-content"]
        @song.final    = (params["final"] ? true : false)
        @song.user_id  = session[:logged_in_user_id]
      end

      if @song.valid?

        # Adjust the priorities if necessary
        #   If the updated song is 1 then it will still be 1 =>
        #     Only update the priorities if this song is not 1
        #   If the updated song was not on the list (0), bump entire list
        #   Otherwise update the songs with a higher priority than this song
        if @song.priority != 1
          if @song.priority == 0
            start = 4        
          else
            start = @song.priority - 1
          end
          start.downto(1) do |n|
            priority_song = Song.where({ :user_id => @song.user_id,
                                         :priority => n }).first
            if priority_song
              priority_song.priority =
                (priority_song.priority == 4) ? 0 : priority_song.priority + 1
              priority_song.save
            end
          end
        end

        @song.priority = 1
        @song.save
        if params.has_key?("edit")
          flash[:success] = "Your song has been updated"
        else
          flash[:success] = "Selected song is now the current song"
        end
        redirect_to("/home") 
      else
        flash[:error] = "Your song could not be updated"
        render :edit
      end
    end

    def destroy
      song_id = params["id"]
      @song   = @logged_in_user.songs.find(song_id)

      # Adjust the priorities if necessary
      #   We only want to adjust if this song was a priority song, less than 4
      #   Only adjust the priority for songs with a larger priority
      if @song.priority > 0 && @song.priority < 4
        (@song.priority + 1).upto(4) do |n|
          priority_song = Song.where({ :user_id => @song.user_id,
                                       :priority => n }).first
          if priority_song
            priority_song.priority -= 1
            priority_song.save
          end
        end
      end

      @song.destroy
      flash[:success] = "Your song has been deleted"
      redirect_to("/home") 
    end

end
