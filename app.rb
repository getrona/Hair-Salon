require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end

get('/new/stylist') do
  erb(:stylist_form)
end

post('/stylist') do
  name = params.fetch('style_input')
  Stylist.new({:id => nil, :name => name}).save()
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end

get('/new/client') do
  erb(:client_form)
end

post('/client') do
  name = params.fetch('client_input')
  Client.new({:id => nil, :name => name, :stylist_id => nil}).save()
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end
