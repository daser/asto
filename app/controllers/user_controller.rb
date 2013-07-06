class UserController < BaseController
	layout :resolve_layout

  uses_tiny_mce do
    {:only => [:show], :options => configatron.default_mce_options}
  end    
  def new
  	@user         = User.new( {:birthday => Date.parse((Time.now - 25.years).to_s) }.merge(params[:user] || {}) )
    @inviter_id   = params[:id]
    @inviter_code = params[:code]
  end


private 
def resolve_layout
    "unauth"
end
end
