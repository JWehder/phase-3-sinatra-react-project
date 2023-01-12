class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/customers" do
    Customer.all.to_json
  end

end
