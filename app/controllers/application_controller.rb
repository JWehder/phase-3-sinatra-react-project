class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/salespeople" do
    salespeople = Salesperson.all.order(:first_name)
    salespeople.to_json(include: :customers)
  end

  get "/customers" do
    customers = Customer.all.order(revenue: :desc)
    customers.to_json(include: :salesperson)
  end

  get "/salespeople/:id" do
    salesperson = Salesperson.find(params[:id])
    salesperson.to_json(include: { customers: { include: :salesperson } })
  end

  post '/customers' do 
    new_customer = Customer.create(

    )
  end

end
