require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end

get('/stylist/new') do
  erb(:stylist_form)
end

post('/stylist') do
  name = params.fetch('name')
  Stylist.new({:id => nil, :name => name}).save()
  redirect '/'
end

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

get('/client/:id') do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client)
end

patch('/client/:id') do
  name = params.fetch('name')
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  redirect "/client/#{@client.id()}"
end

patch('/stylist/:id') do
  name = params.fetch('name')
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  redirect "/stylist/#{@stylist.id()}"
end

post('/clients') do
  name = params.fetch('client_input')
  stylist_id = params.fetch('stylist_id').to_i()
  Client.new({:id => nil, :name => name, :stylist_id => stylist_id}).save()
  redirect "/stylist/#{stylist_id}"
end

delete("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  redirect "/"
end

delete("/client/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  redirect "/"
end
