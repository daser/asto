class SessionsController < BaseController
	 uses_tiny_mce do
            {:only => [:show], :options => configatron.default_mce_options}
       end   
  def new
  	redirect_to '/login'
  end

  def create
  	    #redirect_to '/login'
  	    @user_session = UserSession.new(:login => params[:email], :password => params[:password], :remember_me => params[:remember_me])

    if @user_session.save

      current_user = @user_session.record #if current_user has been called before this, it will ne nil, so we have to make to reset it
      
      flash[:notice] = :thanks_youre_now_logged_in.l
      redirect_back_or_default(dashboard_user_path(current_user))
    else
      flash[:notice] = :uh_oh_we_couldnt_log_you_in_with_the_username_and_password_you_entered_try_again.l
  	    redirect_to '/login'
    end  	
  end

  def index
  	  	    redirect_to '/login'
  end

  def destroy
  	current_user_session.destroy
    reset_session
    flash[:notice] = :youve_been_logged_out_hope_you_come_back_soon.l
    redirect_to new_session_path
  end
end
