Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '556781227805453', 'e318ae8fb04e43965347d808d3c3d28a'
  provider :twitter, "WLX51hXkYUfpGpCnYZ2FZqfZL", "rL7OlkFn4GPU3gIyxDWPiWgvQdKfwzszw7HCQT0XTb0YfMbkbU"
end