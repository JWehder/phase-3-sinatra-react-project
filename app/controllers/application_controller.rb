class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/salespeople" do
    salespeople = Salesperson.all.order(:first_name)
    salespeople.to_json(include: { customers: { include: :salesperson } })
  end

  # get "/customers" do
    # customers = Customer.all.order(revenue: :desc)
    # customers.to_json(include: :salesperson)
  # end

  get "/salespeople/:id" do
    salesperson = Salesperson.find(params[:id])
    salesperson.to_json(include: { customers: { include: :salesperson } })
  end

  post '/customers' do 
    salesperson = Salesperson.find_by(id: params[:salesperson_id])
    new_customer = salesperson.customers.create(
      customer_first_name: params[:customer_first_name],
      customer_last_name: params[:customer_last_name],
      units_sold: params[:units_sold],
      revenue: params[:revenue]
    )
    salesperson.to_json
  end

  get '/customers/:id' do
    customer = Customer.find(params[:id])
    customer.to_json(include: :salesperson)
  end

  patch '/customers/:id' do 
    # should I use a similar method as my post or just find customer by ID?
    customer = Customer.find(params[:id])
    edited_customer = customer.update(
      salesperson_id: params[:salesperson_id],
      customer_first_name: params[:customer_first_name],
      customer_last_name: params[:customer_last_name],
      units_sold: params[:units_sold],
      revenue: params[:revenue]
    )
    # all_customers = Customer.all.order(revenue: :desc)
    # all_customers.to_json(include: :salesperson)
    edited_customer.salesperson.to_json
  end

  delete '/customers/:id' do
    customer = Customer.find(params[:id])
    customer.destroy
    # old code:
    # all_customers = Customer.all.order(revenue: :desc)
    # all_customers.to_json(include: :salesperson)
    customer.salesperson.to_json
  end

  post '/salespeople' do 
    new_salesperson = Salesperson.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      quota: params[:quota]
    )
    new_salesperson.to_json(include: :customers)
  end


end
