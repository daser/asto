class PasswordResetsController < BaseController
layout :resolve_layout
  before_filter :require_no_user
  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]


  uses_tiny_mce do
    {:only => [:show], :options => configatron.default_mce_options}
  end    

  def index
  	      render :action => :new
  end
  def new
  end

  def edit
  end

  def create
  	@user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!

      flash[:info] = :your_password_reset_instructions_have_been_emailed_to_you.l      

      redirect_to login_path
    else
      flash[:info] = :sorry_we_dont_recognize_that_email_address.l      

      render :action => :new
    end

  end

  def show
  	  	      render :action => :edit
  end

  def update
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      flash[:notice] = :your_changes_were_saved.l

      redirect_to dashboard_user_path(@user)
    else
      flash[:info] = @user.errors.full_messages.to_sentence
      render :action => :edit
    end
  end





private 
def resolve_layout
    "unauth"
end

def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = :an_error_occurred.l
      redirect_to login_path
    end
end

end
