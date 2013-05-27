class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :token, :user_id
  belongs_to :user
end
