require('spec_helper')

describe(Stylist) do

  describe('.all') do
    it('will return an empty array at first because we have not saved anything') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('will return the id of the stylist once it is saved') do
      test_stylist = Stylist.new({:id => nil, :name => 'james'})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it('will return the name of the stylist') do
      test_stylist = Stylist.new({:id => nil, :name => "josh"})
      expect(test_stylist.name()).to(eq('josh'))
    end
  end

  describe('#save') do
    it('will save the new instance of the stylist class into the table') do
      test_stylist = Stylist.new({:id => nil, :name => "Getro"})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it('will overide the == method') do
      test_stylist = Stylist.new({:id => nil, :name => "bryan"})
      test_stylist2 = Stylist.new({:id => nil, :name => "bryan"})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe('#update') do
    it('will update the stylist in the database') do
      test_stylist = Stylist.new({:id => nil, :name => "bowl"})
      test_stylist.save()
      test_stylist.update({:name => "Ben"})
      expect(test_stylist.name()).to(eq("Ben"))
    end
  end

  describe('#delete') do
    it('will delete a stylist from the table') do
      test_stylist = Stylist.new({:id => nil, :name => "Jean"})
      test_stylist.save()
      test_stylist2 = Stylist.new({:id => nil, :name => "Jack"})
      test_stylist2.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

  describe('.find') do
    it('returns a stylist by its id') do
      test_stylist = Stylist.new({:id => nil, :name => "Jack"})
      test_stylist.save()
      test_stylist2 = Stylist.new({:id => nil, :name => "Jacek"})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#clients') do
    it('returns an array of the clients for that stylist') do
      test_stylist = Stylist.new({:name => "Jack", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "bosh", :stylist_id => test_stylist.id(), :id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "boshoot", :stylist_id => test_stylist.id(), :id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end
end
