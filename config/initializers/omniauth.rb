Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  scope: 'public_profile,email', info_fields: 'id,name,link,first_name,last_name,email'

end

OmniAuth.config.logger = Rails.logger
