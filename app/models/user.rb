class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :name, :first_name, :last_name, :link, :username,
                  :location, :gender, :email, :timezone, :locale,
                  :password, :password_confirmation, :remember_me

  has_many :ratings
  has_many :authentications, :dependent => :delete_all

  def update_fields(auth)
    self.uid           = auth['uid']
    self.name         = auth['extra']['raw_info']['name']
    self.first_name   = auth['extra']['raw_info']['first_name']
    self.last_name    = auth['extra']['raw_info']['last_name']
    self.link         = auth['extra']['raw_info']['link']
    self.username     = auth['extra']['raw_info']['username']
    self.gender       = auth['extra']['raw_info']['gender']
    self.email        = auth['extra']['raw_info']['email']
    self.timezone     = auth['extra']['raw_info']['timezone']
    self.locale       = auth['extra']['raw_info']['locale']
    self.updated_time = auth['extra']['raw_info']['updated_time']

    # Again, saving token is optional.
    # If you haven't created the column in authentications table,
    # this will fail
    authentications.build(:provider => auth['provider'],
                          :uid => auth['uid'],
                          :token => auth['credentials']['token'])
  end
end
