class User < ActiveRecord::Base
	require_from_ce('models/user')
	attr_accessible :coyemail, :coyname, :fname, :lname, :mobile,:position, :mname

protected

	def password_required?
    end
end