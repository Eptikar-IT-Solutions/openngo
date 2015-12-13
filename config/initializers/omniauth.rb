Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '556781227805453', 'e318ae8fb04e43965347d808d3c3d28a'
end