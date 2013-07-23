class SwwbController < ApplicationController

    ### See ./application_controller.rb for before_filter to retrieve
    ###   @logged_in_user

    def home
      # Get the priority songs for this user, default are the admin songs
      if @logged_in_user
        priority_songs =
          @logged_in_user.songs.where({ :priority => [1,2,3,4] }).sort_by \
            { |song| song.priority }
      else
        admin_user = User.where({ :username => "admin1357" }).first
        priority_songs =
          admin_user.songs.where({ :priority => [1,2,3,4] }).sort_by \
            { |song| song.priority }
      end

      @song1 = priority_songs[0]
      @song2 = priority_songs[1]
      @song3 = priority_songs[2]
      @song4 = priority_songs[3]

      render :action => "home"
    end

    def resources
      @page_title = "Resources"
      render :action => "resources"
    end

    def about
      @page_title = "About SWWB"
      render :action => "about"
    end

    def contact
      @page_title   = "Contact SWWB"
      @errors       = []
      render :action => "contact"
    end

    def contact_send
      if params["cancel"].present?
        flash[:success] = "Your action has been cancelled"
        redirect_to("/home")
        return
      end

      @page_title   = "Contact SWWB"
      @errors       = []
      @name         = params["name"]
      @email        = params["email"]
      @phone        = params["phone"]
      @message      = params["message"]

      ### Using attr_accessor w/ validations for these fields might work instead
      if @name.empty?
        @errors += ["Your name is a required field"]
      end
      if @email.empty?
        @errors += ["Your email is a required field"]
      end
      if @message.empty?
        @errors += ["Your message is a required field"]
      end

      if @errors.size == 0
        subject  = ""
        subject +=
          "Message from SWWB - #{Date.today.strftime("%B %d, %Y - %A")}"
        body  = ""
        body += "From:       #{@name}\n"
        body += "Email:      #{@email}\n"
        body += "Phone:      #{@phone}\n\n"
        body += "Message:\n\n#{@message}"

        ### Todo: Add exception handling for the case of a failure
        Pony.mail({
          :to      => "#{Pony.options[:via_options][:user_name]}",
          :subject => "#{subject}",
          :body    => "#{body}",
        })

        flash[:success] = "Your message has been sent!"
        redirect_to("/home")
      else
        flash[:error] = "Your form is incomplete"
        render :action => "contact"
      end
    end

end
