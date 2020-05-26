Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'mysterious-refuge-67427.herokuapp.com'
    resource '*', 
      headers: :any, 
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end


Rails.application.config.hosts << "mysterious-refuge-67427.herokuapp.com"
Rails.application.config.hosts << "lit-everglades-04601.herokuapp.com"
  