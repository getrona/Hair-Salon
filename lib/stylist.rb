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

define_method(:update) do |attributes|
  @name = attributes.fetch(:name)
  @id = self.id()
  DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id= #{@id};")
end


end
