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
    it('will update the stylist') do
      test_stylist = Stylist.new({:id => nil, :name => "bowl"})
      test_stylist.save()
      test_stylist.update({:name => "Ben"})
      expect(test_stylist.name()).to(eq("Ben"))
    end
  end
end
