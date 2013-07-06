class DaserController < BaseController
	  layout :resolve_layout

      uses_tiny_mce do
            {:only => [:show], :options => configatron.default_mce_options}
       end    
        
  def sunday

  end

private 
def resolve_layout
    "unauth"
end

end
