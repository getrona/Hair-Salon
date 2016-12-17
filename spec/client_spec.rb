require('spec_helper')

describe(Client) do

  describe('.all') do
    it('will return an empty array') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the newly created object in the table') do
      test_client = Client.new({:id => nil, :name => 'Getro', :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#name') do
    it('will return the name of the client') do
      test_client = Client.new({:id => nil, :name => "bosh", :stylist_id => 1 })
      expect(test_client.name()).to(eq("bosh"))
    end
  end

  describe("#list_id") do
    it('lets you read the list ID out') do
      test_client = Client.new({:name => "bosh", :stylist_id => 1, :id => nil})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe('#==') do
    it('it is the same client if it has the same name and stylist_id') do
      test_client = Client.new({:name => "bosh", :stylist_id => 1, :id => nil})
      test_client2 = Client.new({:name => "bosh", :stylist_id => 1, :id => nil})
      expect(test_client).to(eq(test_client2))
    end
  end

  describe('#delete') do
    it('will delete a client from the table') do
      test_client = Client.new({:name => "bosh", :stylist_id => 1, :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "bosh", :stylist_id => 1, :id => nil})
      test_client2.save()
      test_client.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end



end
