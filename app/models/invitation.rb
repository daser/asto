class Invitation < ActiveRecord::Base
    require_from_ce('models/invitation')
  attr_accessible :email_addresses,:message

end
