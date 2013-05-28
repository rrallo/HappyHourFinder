Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FB_AUTH_ID, FB_AUTH_SECRET, {:scope => 'email'}#, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end