Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ID, SECRET, {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end