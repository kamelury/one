Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'oW024j3GyIqvBV37qVbRkQ', 'gF45LiqFY6hsusKwvA304qSYKjyKAy57b8nuzx1AcY'
  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, 'APP_ID', 'APP_SECRET'
end