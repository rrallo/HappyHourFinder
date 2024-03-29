Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FB_AUTH_ID, FB_AUTH_SECRET, {:scope => 'email'}
  #, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  
  
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
		  :provider => 'facebook',
		  :uid => '1234567',
		  :info => {
		    :nickname => 'jbloggs',
		    :email => 'joe@bloggs.com',
		    :name => 'Joe Bloggs',
		    :first_name => 'Joe',
		    :last_name => 'Bloggs',
		    :image => 'http://graph.facebook.com/1234567/picture?type=square',
		    :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
		    :location => 'Palo Alto, California',
		    :verified => true
		  },
		  :credentials => {
		    :token => 'ABCDEF', # OAuth 2.0 access_token, which you may wish to store
		    :expires_at => 1321747205, # when the access token expires (it always will)
		    :expires => true # this will always be true
		  },
		  :extra => {
		    :raw_info => {
		      :id => '1234567',
		      :name => 'Joe Bloggs',
		      :first_name => 'Joe',
		      :last_name => 'Bloggs',
		      :link => 'http://www.facebook.com/jbloggs',
		      :username => 'jbloggs',
		      :location => { :id => '123456789', :name => 'Palo Alto, California' },
		      :gender => 'male',
		      :email => 'joe@bloggs.com',
		      :timezone => -8,
		      :locale => 'en_US',
		      :verified => true,
		      :updated_time => '2011-11-11T06:21:03+0000'
		    }
		  }
		})

		OmniAuth.config.mock_auth[:facebook2] = OmniAuth::AuthHash.new({
		  :provider => 'SomeProvider',
		  :uid => '1',
		  :info => {
		    :nickname => 'jbloggs',
		    :email => 'joe@bloggs.com',
		    :name => 'Joe Bloggs',
		    :first_name => 'Joe',
		    :last_name => 'Bloggs',
		    :image => 'http://graph.facebook.com/1234567/picture?type=square',
		    :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
		    :location => 'Palo Alto, California',
		    :verified => true
		  },
		  :credentials => {
		    :token => 'none', # OAuth 2.0 access_token, which you may wish to store
		    :expires_at => 1321747205, # when the access token expires (it always will)
		    :expires => true # this will always be true
		  },
		  :extra => {
		    :raw_info => {
		      :id => '1234567',
		      :name => 'Joe Bloggs',
		      :first_name => 'Joe',
		      :last_name => 'Bloggs',
		      :link => 'http://www.facebook.com/jbloggs',
		      :username => 'jbloggs',
		      :location => { :id => '123456789', :name => 'Palo Alto, California' },
		      :gender => 'male',
		      :email => 'joe@bloggs.com',
		      :timezone => -8,
		      :locale => 'en_US',
		      :verified => true,
		      :updated_time => '2011-11-11T06:21:03+0000'
		    }
		  }
		})





end