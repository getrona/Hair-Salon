require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('will return the name of the client') do
      test_stylist = Stylist.new({:name => "josh", :id => nil})
      expect(test_stylist.name()).to(eq("josh"))
    end
  end

  # describe('#id') do
  #   it('will return the id of the client') do
  #     test_stylist = Stylist.new({:name => "james", :id => nil })
  #     expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
  #   end
  # end

  describe('.all') do
    it('will return an empty array at first because we have not saved anything') do
      test_stylist = Stylist.new({:name => "josh", :id => nil})
      expect(Stylist.all()).to(eq([]))
    end
  end
end
