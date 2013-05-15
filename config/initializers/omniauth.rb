Rails.application.config.middleware.use OmniAuth::Builder do
  id = '142423825944639'
  secret = '1dc8170c3e2fea65c479ec58b0beb870'
  provider :facebook, id, secret, {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end