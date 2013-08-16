class StoreController < ApplicationController
  
  skip_before_filter :authorize
  
  def index
    @products = Product.order(:title)
    @cart = current_cart
    
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    
    @count = session[:counter]
  end
end
