require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'is valid when all fields are included, email is unique, and passwords match' do
      user = User.new(first_name: "Alysha", last_name: "Huot", email: "alyshajhuot@gmail.com", password: 'password123', password_confirmation: 'password123')
      expect(user).to be_valid
    end

    it 'is not valid when passwords do not match' do
      user = User.new(first_name: "Alysha", last_name: "Huot", email: "alyshajhuot@gmail.com", password: 'password123', password_confirmation: 'password1234')
      expect(user).not_to be_valid
    end

    it 'is not valid without a first name' do
      user = User.new(last_name: "Huot", email: "alyshajhuot@gmail.com", password: 'password123', password_confirmation: 'password123')
      expect(user).not_to be_valid
    end

    it 'is not valid without a last name' do
      user = User.new(first_name: "Alysha", email: "alyshajhuot@gmail.com", password: 'password123', password_confirmation: 'password123')
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(first_name: "Alysha", last_name: "Huot", password: 'password123', password_confirmation: 'password123')
      expect(user).not_to be_valid
    end

    it 'is not valid if email is not unique' do
      user = User.create(first_name: "Alysha", last_name: "Huot", email: "alyshajhuot@gmail.com", password: 'password123', password_confirmation: 'password123')
      expect(user).to be_valid

      user2 = User.new(first_name: "Alysha", last_name: "Huot", email: "alyshajhuot@gmail.com", password: 'password123', password_confirmation: 'password123')
      user2.valid?
      expect(user2).not_to be_valid
      expect(user2.errors[:email]).to include("has already been taken")
    end

    it 'is not valid if email is not unique, but has different case' do
      user = User.create(first_name: "Alysha", last_name: "Huot", email: "alyshajhuot@gmail.com", password: 'password123', password_confirmation: 'password123')
      expect(user).to be_valid

      user2 = User.new(first_name: "Alysha", last_name: "Huot", email: "ALYSHAJHUOT@gmail.com", password: 'password123', password_confirmation: 'password123')
      user2.valid?
      expect(user2).not_to be_valid
      expect(user2.errors[:email]).to include("has already been taken")
    end

    it 'is not valid if the password is shorter than 8 characters' do
      user = User.new(first_name: "Alysha", last_name: "Huot", email: "alyshajhuot@gmail.com", password: '1234', password_confirmation: '1234')
      expect(user).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    before do
      User.create!(first_name: "Test", last_name: "User", email: "example@example.com", password: "password123", password_confirmation: "password123")
    end

    it 'authenticates correctly with valid credentials' do
      user = User.authenticate_with_credentials('example@example.com', 'password123')
      expect(user).not_to be_nil
    end

    it 'does not authenticate with incorrect password' do
      user = User.authenticate_with_credentials('example@example.com', '234')
      expect(user).to be_nil
    end
    
    it 'authenticates correctly if extra spaces are included around email' do
      user = User.authenticate_with_credentials('    example@example.com ', 'password123')
      expect(user).not_to be_nil
    end

    it 'authenticates correctly if email is typed in a different case' do
      user = User.authenticate_with_credentials('EXAMPLE@example.com', 'password123')
      expect(user).not_to be_nil
    end
    
  end

end