require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "is valid  the attributes are exsist" do
      @category = Category.new(name: "test")
      @category.save!
      @product = Product.new(
        name: "test",
        category_id: @category.id,
        description: "electrical",
        price_cents: 100,
        quantity: 20,
      )
      @product.save!
      expect(@product).to be_valid
    end
    it "is not valid when name is not exist" do
      @category = Category.new(name: "test")
      @product = Product.create(
        name: nil,
        category_id: nil,
        price_cents: 20,
        quantity: 30,
      )
      expect(@product.errors.full_messages.first).to eq("Name can't be blank")
    end
    it "is not valid when category is not exist" do
      @product = Product.create(
        name: "tesr",
        category_id: nil,
        price_cents: 20,
        quantity: 30,
      )
      expect(@product.errors.full_messages.first).to eq("Category can't be blank")
    end
    it "is not valid when price is not exist" do
        @category = Category.new(name: 'tests')
      @product = Product.create(
        name: 'test',
        price_cents: nil,
        quantity: 30,
        category_id: @category.id
      )
      expect(@product.errors.full_messages.first).to eq("Price cents is not a number")
    end
    it "is not valid when Quantity is not exist" do
        @category = Category.new(name: 'tests')
      @product = Product.create(
        name: 'test',
        price_cents: 20,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product.errors.full_messages.first).to eq("Quantity can't be blank")
    end
  end
end