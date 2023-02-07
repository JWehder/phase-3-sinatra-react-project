class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/salespeople" do
    salespeople = Salesperson.order(:first_name)
    salespeople.to_json(include: :customers)
  end

  get "/salespeople/summary_stats" do
    quota = Saleperson.total_quota
    revenue = Salesperson.overall_revenue
    summary_stats = {
      revenue: revenue,
      quota: quota
    }
    summary_stats.to_json
  end

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
    new_customer.to_json
  end

  get '/customers/:id' do
    customer = Customer.find(params[:id])
    customer.to_json(include: :salesperson)
  end

  patch '/customers/:id' do 
    # should I use a similar method as my post or just find customer by ID?
    customer = Customer.find(params[:id])
    salesperson = customer.salesperson
    edited_customer = customer.update(
      salesperson_id: params[:salesperson_id],
      customer_first_name: params[:customer_first_name],
      customer_last_name: params[:customer_last_name],
      units_sold: params[:units_sold],
      revenue: params[:revenue]
    )
    salesperson.customers.to_json
  end

  delete '/customers/:id' do
    customer = Customer.find(params[:id])
    salesperson = customer.salesperson
    customer.destroy
    salesperson.customers.to_json
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
