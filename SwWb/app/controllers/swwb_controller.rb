class SwwbController < ApplicationController

    # Note: Constants cannot be assigned inside of a method
    ONE_SECOND = 1
    ONE_MINUTE = 60 * ONE_SECOND   #     60 seconds
    ONE_HOUR   = 60 * ONE_MINUTE   #  3,600 seconds
    ONE_DAY    = 24 * ONE_HOUR     # 86,400 seconds
    FIVE_PM    = 17 * ONE_HOUR     # 61,200 seconds (since midnight)


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
        subject += "Message from SWWB - #{Date.today.readable_inspect}"
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

    def countdown
      # Calculate the days
      ### Todo: Use MST, MDT to ensure the proper day
      @days_gross = (DateTime.new(2014,9,30) - Date.today).to_i
      @days_left = @days_gross - (@days_gross / 7 * 2) 
      @days_left = @days_left - 10   # Assume 10 holidays for now

=begin
      ### Note: time_now.utc? returned false when running from Heroku
      ###   irb(main):004:0> Time.now.zone
      ###     => "UTC"
      ###   irb(main):005:0> Time.now.utc?
      ###     => false
      ###
      # Calculate the the partial day
      #   If we are at Coordinated Universal Time (UTC) then adjust the time
      time_now = Time.now
      if time_now.utc?
        # This works also:
        #   time_zone = TZInfo::Timezone.get('America/Denver')
        #   current_period = time_zone.current_period
        #   time_now += current_period.utc_total_offset
        time_now +=
          TZInfo::Timezone.get('America/Denver').current_period.utc_total_offset
      end
=end
      # Calculate the the partial day
      time_now = Time.now.in_time_zone("Mountain Time (US & Canada)")
      @time_now_formatted = time_now.strftime("%A - %B %d, %Y; %I:%M%p %Z")
      @hours_left   = 0
      @minutes_left = 0
      @seconds_left = 0
      unless time_now.saturday? || time_now.sunday?
        # The end of the day is 5:00 PM today
        partial_day = FIVE_PM - time_now.seconds_since_midnight
        if partial_day > 0
          # Since we are using Time, we need to truncate (remove) the decimal
          @hours_left   =  (partial_day / ONE_HOUR).truncate
          @minutes_left = ((partial_day % ONE_HOUR) / ONE_MINUTE).truncate
          @seconds_left = ((partial_day % ONE_HOUR) % ONE_MINUTE).truncate
        end
      end

      render :action => "countdown"
    end

end
