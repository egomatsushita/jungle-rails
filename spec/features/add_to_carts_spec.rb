require 'rails_helper'

RSpec.feature "Visitor clicks on to add cart button", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The cart increases by one when user clicks on to add cart button" do
    # ACT
    visit root_path

    page.find('.products article:first-child footer').find_link('Add').click

    # DEBUG / VERIFY
    save_screenshot

    # VERIFY
    within('nav') { expect(page).to have_content('1') }
  end

end

