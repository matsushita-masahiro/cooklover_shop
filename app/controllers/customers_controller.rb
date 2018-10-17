class CustomersController < ApplicationController
  def new
    params[:item].each do |f|
        # 注文された　商品idと注文数を sessionにハッシュで保持
        session[:order_quantity] = f
        logger.debug("====================== session = #{session[:order_quantity]}")
    end
  end
  
  def create
  end
end
