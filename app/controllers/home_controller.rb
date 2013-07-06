class HomeController < BaseController
	layout :resolve_layout

      uses_tiny_mce do
            {:only => [:show], :options => configatron.default_mce_options}
       end    
      
  def index
  end

  def login
  	   redirect_to user_path(current_user) and return if current_user
        @user_session = UserSession.new
  end

  def activate
      @token = [params[:token]]
      ifexist = User.find_by_activation_token(@token)
      if ifexist
      @user = ifexist
      if request.post?
        password = params[:password]
        password_confirmation = params[:password_confirmation]
        if password != password_confirmation
          flash[:notice] = "***** password doesn't match confirmation"
          flash[:color] = "invalid"
        else
         # @user.updating_password = true
          @user.password = password
          @user.activation_token = nil
          if @user.save
            UserMailer.successful_registration(@user).deliver
            redirect_to root_url, :notice => "Account Activated! You can now login"
          #redirect_to profile_path(@get_user.username)
          else
            logger.info('hashed password 2: '+ @user.password)
            flash[:alert] = 'Your password could not be changed. Please try again'
          end    
        end
      end
  else
    flash[:notice] = "Invalid token"
    redirect_to :action=>"index"
  end
    
  end


  private 
def resolve_layout
    "unauth"
end

end
