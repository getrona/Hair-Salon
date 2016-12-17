class Stylist

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylis = []
    returned_stylists.each() do |styl|
      id = styl.fetch('id').to_i
      name = styl.fetch('name')
      stylis.push(Stylist.new({:id => id, :name => name}))
    end
    stylis
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_method(:==) do |other|
    self.name() == other.name() && self.id() == other.id()
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().to_i() == id.to_i()
        found_stylist = stylist
      end
    end
    found_stylist
  end

define_method(:update) do |attributes|
  @name = attributes.fetch(:name)
  @id = self.id()
  DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id= #{@id};")
end

define_method(:delete) do
  DB.exec("DELETE FROM clients WHERE id = #{self.id()}; ")
  DB.exec("DELETE FROM stylists WHERE id = #{self.id()}; ")
end

define_method(:clients) do
  stylist_clients = []
  clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
  clients.each() do |client|
    name = client.fetch('name')
    stylist_id = client.fetch('stylist_id').to_i
    id = client.fetch('id').to_i
    stylist_clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
  end
  stylist_clients
end

end
