require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    before do
      @category = Category.create(name: "Electronics")
    end

    it 'saves successfully when all required fields are included' do
      product = Product.new(name: 'Laptop', description: 'High-performance gaming laptop', image: 'laptop.png', price_cents: 100000, quantity: 20, category: @category)
      expect(product.save).to be true
    end

    it 'is not valid without a name' do
      product = Product.new(description: 'High-performance gaming laptop', image: 'laptop.png', price_cents: 100000, quantity: 20, category: @category)
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      product = Product.new(name: 'Laptop', description: 'High-performance gaming laptop', image: 'laptop.png', quantity: 20, category: @category)
      product.valid?
      expect(product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'is not valid without a quantity' do
      product = Product.new(name: 'Laptop', description: 'High-performance gaming laptop', image: 'laptop.png', price_cents: 100000, category: @category)
      product.valid?
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(name: 'Laptop', description: 'High-performance gaming laptop', image: 'laptop.png', price_cents: 100000, quantity: 20)
      product.valid?
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
