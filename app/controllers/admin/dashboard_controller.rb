class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['HTTP_AUTH_USERNAME'], password: ENV['HTTP_AUTH_PASS']

  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end
