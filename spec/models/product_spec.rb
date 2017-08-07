require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before :each do
      @category = Category.create(name: 'Kitchen')
      @product = @category.products.create(
        name: 'Devhub mug',
        description: 'A special black mug',
        price: 19.99,
        quantity: 10)
    end

    context 'Name:' do
      it "Product should have a name" do
        expect(@product.name.present?).to eq(true)
      end

      it "Should log an error if product does not have a name" do
        @category = Category.create(name: 'Kitchen')
        @product = @category.products.create(
          name: nil,
          description: 'A special black mug',
          price: 19.99,
          quantity: 10)

        expect(@product.errors.full_messages.present?).to eq(true)
      end
    end

    context 'Price:' do
      it "Product should have a price" do
        expect(@product.price.present?).to eq(true)
      end

      it "Should log an error if product does not have a price" do
        @category = Category.create(name: 'Kitchen')
        @product = @category.products.create(
          name: 'Devhub mug',
          description: 'A special black mug',
          price: nil,
          quantity: 10)

        expect(@product.errors.full_messages.present?).to eq(true)
      end
    end

    context 'Quantity:' do
      it "Product should have a quantity" do
        expect(@product.quantity.present?).to eq(true)
      end

      it "Should log an error if product does not have a quantity" do
        @category = Category.create(name: 'Kitchen')
        @product = @category.products.create(
          name: 'Devhub mug',
          description: 'A special black mug',
          price: 19.99,
          quantity: nil)

        expect(@product.errors.full_messages.present?).to eq(true)
      end
    end

    context 'Category:' do
      it "Product should have a category" do
        expect(@product.category.present?).to eq(true)
      end

      it "Should log an error if product does not have a category" do
        @product = Product.create(
          name: 'Devhub mug',
          description: 'A special black mug',
          price: 19.99,
          quantity: 10,
          category_id: nil)

        expect(@product.errors.full_messages.present?).to eq(true)
      end
    end
  end
end

