# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Functional Requirements implemented during the project:

### Feature: Sold Out Badge
* When a product has 0 quantity, a sold out badge should be displayed on the product list page

### Feature: Admin Categories
* Admin users can list and create new categories
* Admins can add new products using the new category

### Feature: User Authentication
* As a Visitor I can go to the registration page from any page in order to create an account
* As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
* As a Visitor I can sign in using my e-mail and password
* As a User I can log out from any page
* As a User I cannot sign up with an existing e-mail address (uniqueness validation)
* Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User model, leveraging the bcrypt gem

### Enhancement: Order Details Page
* The order page contains items, their image, name, description, quantities and line item totals
* The final amount for the order is displayed
* The email that was used to place the order is displayed

### Feature: Email Receipt
* The e-mail content should be formatted with HTML
* It should list the total as well as each line item in the order
* The Order ID should be in the subject line

### Admin Security
* User must enter HTTP auth login/password to access admin functionality

### Checking Out with Empty Cart
* When the cart is empty and the user goes to the carts#show page, display a friendly message about how it is empty and link to the home page

### Feature: Product Rating
* As a visitor I can view the overall rating of products as I browse the catalog
* As a visitor I can view the list of ratings and reviews when viewing the product detail
* As a logged in user I can rate & review a product in a single step
* As a logged in user I can delete a rating or review that I previously created

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

- Main Page
!["Main page"](https://github.com/egomatsushita/jungle-rails/blob/master/docs/main_page.png?raw=true)
- Sold out product
!["Sold out product"](https://github.com/egomatsushita/jungle-rails/blob/master/docs/sold_out_badge.png?raw=true)
- Sign up
!["Sign up"](https://github.com/egomatsushita/jungle-rails/blob/master/docs/signup.png?raw=true)
- Signed in user
!["Signed in user"](https://github.com/egomatsushita/jungle-rails/blob/master/docs/signed_in.png?raw=true)
- Show product
!["Show product"](https://github.com/egomatsushita/jungle-rails/blob/master/docs/show_product.png?raw=true)
- Trash can for comment made by logged in user
!["Comment with logged in user"](https://github.com/egomatsushita/jungle-rails/blob/master/docs/comment_logged_in_user.png?raw=true)
- Comments without trash can
!["Comment without user"](https://github.com/egomatsushita/jungle-rails/blob/master/docs/comment_logged_out_user.png?raw=true)
- Order page
!["Order"](https://github.com/egomatsushita/jungle-rails/blob/master/docs/order.png?raw=true)
