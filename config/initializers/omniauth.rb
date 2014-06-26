Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['771887046166094'], ENV['b3a1f49c3d6620e3e89432f25f04f8bb']
end

