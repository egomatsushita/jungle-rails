require 'rails_helper'

RSpec.feature "Visitor can login, and automatically redirected to main page", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create! name: 'John Doe', email: 'jDoe@example.com', password: '1234', password_confirmation: '1234'

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

  scenario "User is redirected to main page after login" do
    # ACT
    visit root_path

    save_screenshot

    page.find('div.login').find_link('Login').click
    fill_in 'email', with: 'jDoe@example.com'
    fill_in 'password', with: '1234'
    click_on 'Submit'

    # DEBUG / VERIFY
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product', count: 10
  end

end