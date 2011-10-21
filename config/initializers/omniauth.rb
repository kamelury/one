if Rails.env.production? #jeden
  
  Twitter.configure do |config|
    config.consumer_key = 'W024j3GyIqvBV37qVbRkQ'
    config.consumer_secret = 'gF45LiqFY6hsusKwvA304qSYKjyKAy57b8nuzx1AcY'
    config.oauth_token = '111110860-8L2utRZ67w5johezNX8HesCp5FOrZUuSKiEPupNf'
    config.oauth_token_secret = 'xwzZ6xQ5bdljlV0gdybzCWph0RKVLu7oOVGzHswlnVU'
  end
  
  Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'oW024j3GyIqvBV37qVbRkQ', 'gF45LiqFY6hsusKwvA304qSYKjyKAy57b8nuzx1AcY'
  provider :facebook, '287666267919319', '3d3e2366853b1947ed9f8d0d7e8ac5bf', :scope => 'publish_stream,offline_access,email'
end
elsif Rails.env.development? # one
 Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'jPD7W2H0mTOf22I5rQlKnw', 'SVycrKS5ivFl6LQsC3X3UETVgpISDtPAxWAosFrlBdE'
  provider :facebook, '273493032682753', 'bea8e589bf04007ffaa340c7ea72e0fd', :scope => 'publish_stream,offline_access,email'
  

end
end





      # :scope => 'email, user_about_me,user_activities,user_birthday,user_education_history,
                      # user_events,user_groups,user_hometown,user_interests,user_likes, user_location,
                      # user_religion_politics,
                      # user_status,user_work_history,
                      # publish_stream, offline_access,
                      # friends_about_me'
                      # friends_activities,friends_birthday,friends_education_history,friends_events,
                      # friends_groups,friends_hometown,friends_interests,friends_likes,friends_location,
                      # friends_photo_video_tags,friends_photos,friends_relationships,
                      # friends_relationship_details,friends_religion_politics,friends_status,
                      # friends_work_history
                      
                      # user_relationships, user_relationship_details,
                      # user_photo_video_tags,user_photos,
                      # publish_checkins,manage_pages,
                      # create_event,rsvp_event,sms,read_friendlists,read_insights,read_mailbox,
                      # read_requests,read_stream,xmpp_login,ads_management,
                      # user_checkins,user_videos,user_website, user_notes,user_online_presence,user_address,user_mobile_phone
                      # friends_notes,friends_online_presence, friends_videos,friends_website, manage_friendlists,friends_checkins
                      
                      #Adding, :iframe => true allows a Facebook App to redirect out of Facebook for authentication