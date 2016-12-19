require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows the user to add a new stylist') do
    visit('/')
    click_link('Add Stylist')
    fill_in('name', :with => 'Getro')
    click_button('Submit!')
    expect(page).to have_content('Hair Cuttery Management System')
  end
end

describe('viewing all of the stylists', {:type => :feature}) do
  it('allows the user to view all of the stylist') do
    stylist = Stylist.new({:name => 'Getron', :id => nil})
    stylist.save()
    visit('/')
    click_link('View Stylist')
    expect(page).to have_content('I want to:')
  end
end

describe('Deleting a stylist', {:type => :feature}) do
  it('allows the user to delete a stylist') do
    stylist = Stylist.new({:name => 'Getron', :id => nil})
    stylist.save()
    visit('/')
    click_link(stylist.name())
    click_button('Delete Stylist')
    expect(page).to have_content('List is Empty.')
  end
end

describe('update stylist', {:type => :feature}) do
  it('allows the user to update the name of the stylist') do
    stylist = Stylist.new({:name => 'Getron', :id => nil})
    stylist.save()
    visit('/')
    click_link(stylist.name())
    fill_in('name', :with => 'Getro')
    click_button('Update')
    expect(page).to have_content('Getro')
  end
end


describe('seeing details for a single stylist', {:type => :feature}) do
  it('allows a user to click a stylist and see the clients assigned to the stylist') do
    test_stylist = Stylist.new({:name => 'Getrona', :id => nil})
    test_stylist.save()
    visit('/')
    click_link(test_stylist.name())
    fill_in('client_input', :with => 'Getro')
    click_button('Submit!')
    expect(page).to have_content('Getro')
  end
end

describe('assigning a stylist to a client', {:type => :feature}) do
  it('allows a user to assign a stylist to a client') do
    test_stylist = Stylist.new({:name => 'Getrona', :id => nil})
    test_stylist.save()
    visit('/')
    fill_in('client_input', :with => 'Getronono')
    click_button('Add Client')
    expect(page).to have_content('Getronono')
  end
end

describe('update client', {:type => :feature}) do
  it('allows a user to click on a client and update the name') do
    test_stylist = Stylist.new({:name => 'Getrona', :id => nil})
    test_stylist.save()
    test_client = Client.new({:name => "Getro", :id => nil, :stylist_id => test_stylist.id() })
    test_client.save()
    visit('/')
    click_link(test_client.name())
    fill_in('name', :with => 'yoyoyo')
    click_button('Update')
    expect(page).to have_content('yoyoyo')
  end
end

describe('delete client', {:type => :feature}) do
  it('allows a user to click on a client and delete') do
    test_stylist = Stylist.new({:name => 'Getrona', :id => nil})
    test_stylist.save()
    test_client = Client.new({:name => "Getro", :id => nil, :stylist_id => test_stylist.id() })
    test_client.save()
    visit('/')
    click_link(test_client.name())
    click_button('Delete client')
    expect(page).to have_content('List is Empty.')
  end
end
