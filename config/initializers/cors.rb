Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client', 'Link', 'X-Page', 'X-Per-Page', 'X-Total'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
