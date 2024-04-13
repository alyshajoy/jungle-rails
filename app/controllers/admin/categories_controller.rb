class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['HTTP_AUTH_USERNAME'], password: ENV['HTTP_AUTH_PASS']

  def index
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end
end
