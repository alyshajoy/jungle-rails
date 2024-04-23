require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is valid when all fields are included, and passwords match' do
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

end


# create_table "users", force: :cascade do |t|
#   t.string "first_name"
#   t.string "last_name"
#   t.string "email"
#   t.string "password_digest"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
# end