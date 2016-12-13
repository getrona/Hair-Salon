require('capyara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('adding a new stylist', {:type => :feature}) do
#   it('allows the user to add a new stylist') do
#     visit('/')
#     click_link('Add Stylist')
#     fill_in('name', :with => '')
#   end
# end
