class Client

  attr_reader(:name, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clientele =[]
    returned_clients.each do |client|
      name = client.fetch('name')
      stylist_id = client.fetch('id').to_i
      clientele.push(Client.new(:name => name, :stylist_id => stylist_id))
    end
    clientele
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id});")
  end

  define_method(:==) do |other_object|
    self.name() == other_object.name() && self.stylist_id() == other_object.stylist_id()
  end

end
