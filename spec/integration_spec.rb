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

describe('seeing details for a single stylist', {:type => :feature}) do
  it('allows a user to click a stylist and see the clients assigned to the stylist') do
    test_stylist = Stylist.new({:name => 'Getrona', :id => nil})
    test_stylist.save()
    test_client = Client.new({:name => "bosh", :stylist_id => 1, :id => nil})
    test_client.save()
    visit('/stylist')
    click_link(test_stylist.name())
    expect(page).to have_content(test_client.name())
  end
end
