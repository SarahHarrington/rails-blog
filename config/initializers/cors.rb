Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://mysterious-refuge-67427.herokuapp.com/', 'https://lit-everglades-04601.herokuapp.com/'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    end
  end


  Rails.application.config.hosts << "mysterious-refuge-67427.herokuapp.com"
  Rails.application.config.hosts << "lit-everglades-04601.herokuapp.com"