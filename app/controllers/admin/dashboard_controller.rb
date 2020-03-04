class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["name"], password: ENV["password"]
  def show
    @product_count = Product.count(:all)
    @category_count = Category.count(:all)
  end
end
