require 'sinatra'
require 'stripe'
require 'pry'
require 'pg'

####################
## API Keys
####################

set :publishable_key, ENV['PUBLISHABLE_KEY']
set :secret_key, ENV['SECRET_KEY']
Stripe.api_key = settings.secret_key
#PUBLISHABLE_KEY=pk_test_qoPnFfgcvMUlGoE7212eMRVR SECRET_KEY=sk_test_PTVRgvgpatfQZVMkHSVlTqLs ruby app.rb

####################
# DBConnection
####################

def server_connect
  begin
    connection = PG.connect(dbname: "stripe_data")
    yield(connection)
  ensure
    connection.close
  end
end

###################
# App logic
###################

def create_customer(description, email)

  client = Stripe::Customer.create(
  :description => description,
  :email => email,
  )

  #store client["id"]
end

####################
# Home
####################

get '/' do
  erb :index
end

get '/charge_client' do
  erb :charge_client
end

######################
# Billing and Charges
######################

post '/charge' do
  # Amount in cents
  @amount = 500

  Stripe.api_key = "sk_test_PTVRgvgpatfQZVMkHSVlTqLs"

  charge = Stripe::Charge.create(
    :amount      => @amount,
    :description => 'Sinatra Charge',
    :currency    => 'usd',
    :customer    => customer.id
  )

  redirect("/charges")
end

get '/charges' do

  charges = Stripe::Charge.all
  erb :charges, locals: {charges: charges["data"]}
end

get '/charges.json' do
  # Stripe::Charge.all
  #How do I draw data out of the api in a json format?
  #Should this happen right from the front end?
  content_type :json
end

########################
## Client Management ###
########################

get "/stripe_clients" do

  customers = Stripe::Customer.all

  customers.each do |customer|
    customer["email"]
  end

  erb :stripe_clients, locals: { customers: customers }
end

get '/clients' do

  client_data = nil
  server_connect do |conn|
    client_data = conn.exec_params("SELECT * from clients;")
  end

  @clients = client_data.to_a
  erb :clients
end

get "/clients/new" do
  erb :new
end

# user_id = 1

post "/clients" do

name = params["name"]
email = params["email"]
description = params["description"]

create_customer(description,email)

# client_id = nil
#   server_connect do |conn|
#     client_id = conn.exec_params("INSERT INTO clients (name, project) VALUES ($1, $2) RETURNING id;", [params["name"], params["project"]])
#     client_id = client_id.to_a.first["id"].to_i
#     conn.exec_params("INSERT INTO retainers (amount, client_id) VALUES ($1,$2);", [params["retainer"], client_id])
#   end
  redirect('/clients')
end

#############################
# Plan Creation
#############################

get "/plans" do

  Stripe.api_key = "sk_test_PTVRgvgpatfQZVMkHSVlTqLs"
  plans = Stripe::Plan.all

  @plans = plans.each do |plan|
        plan["created"] = Time.at(plan["created"])
  end

  erb :plans
end

get "/plans/new" do

erb :plans_new

end

post "/plans" do

Stripe.api_key = "sk_test_PTVRgvgpatfQZVMkHSVlTqLs"

amount = params["amount"].to_i

plan = Stripe::Plan.create(
    :amount => amount,
    :interval => params["interval"],
    :name => params["name"],
    :currency => 'usd',
    :id => params["id"]
  )

end

######################################

## Bill A Client ##

######################################

get "/bill" do

  Stripe.api_key = "sk_test_PTVRgvgpatfQZVMkHSVlTqLs"
  customer = Stripe::Customer.retrieve("cus_5qDZgUbaTSt8TC")
  customer.subscriptions.create(:plan => "auburn")

  erb :bill
end

post "/bill" do





  redirect('/')
end
