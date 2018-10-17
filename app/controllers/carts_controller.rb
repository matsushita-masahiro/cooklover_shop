class CartsController < ApplicationController
  
  def new
    @products = Product.all
    @cart = Cart.new
  end
  
  def confirm
      logger.debug("")
         @last_name = params[:last_name]
         @first_name = params[:first_name]
         @last_kana = params[:last_kana]
         @first_kana = params[:first_kana]
         @phone = params[:phone]
         @email = params[:email]
         @zip1 = params[:zip1]
         @zip2 = params[:zip2]
         @pref = params[:pref]
         @city = params[:city]
         @addr1 = params[:addr1]
         @addr2 = params[:addr2]
  end
  
  
  def saveorder
    if user_signed_in?
      logger.debug("-----------------login  user.id = #{current_user.id}")
      @user_id = current_user.id
      @user_type = "v"    #visitor
    else
      @user_id = 0
      @user_type = "m"    #member
    end
    
    # 合計金額計算
    @total_price = 0
    
    session[:order_quantity].each do |product_id, order_q|
     @product_price = Product.find(product_id).price
     @total_price = @total_price + @product_price*order_q.to_i
     logger.debug("==================== session[:order_quantity] = #{session[:order_quantity].present?}")
     logger.debug("==================== product_id = #{product_id} ---- quantity = #{order_q}")
    end    
    
    if !session[:id].present? && session[:order_quantity].present?
      @customer = Customer.new(user_id: @user_id,
                             last_name: params[:last_name],
                             first_name: params[:first_name],
                             last_kana: params[:last_kana],
                             first_kana: params[:first_kana],
                             phone: params[:phone],
                             email: params[:email],
                             zip1: params[:zip1],
                             zip2: params[:zip2],
                             pref: params[:pref],
                             city: params[:city],
                             addr1: params[:addr1],
                             addr2: params[:addr2]
                            )
                          
      logger.debug("-------------------- params[:last_name] = #{params[:last_name]}")
      if @customer.save
        flash[:notice] = "購入者情報が保存されました"

      
          @cart = Cart.create(user_type: @user_type,
                           user_id: @user_id,
                           total_price: @total_price,
                           )
                      
          @cart = Cart.last       
          session[:order_quantity].each do |product_id, order_q|
            
            @cart_detail = CartDetail.create(cart_id: @cart.id,
                                             product_id: product_id,
                                             quantity: order_q,
                                             subtotal: Product.find(product_id).price*order_q.to_i
                                             )
          end
        
        redirect_to(carts_path)
      else
        flash[:notice] = "購入者情報が保存失敗しました"
        render("customers/new")
      end
    else ## !session[:id].present?のelse
      redirect_to(carts_path)
    
    end
  end
  
  # def create1
  #   @cart = Cart.new(visitor_id: params[:id])
    
  #   if @cart.save
  #     flash[:notice] = "カートに保存しました"
  #     redirect_to(cart_path)
  #   else
  #     flash[:notice] = "カートに保存失敗しました"
  #     render(new_cart)
  #   end    

  # end
  
  def show
    @cart = Cart.find_by(id: params[:id])
    @cart_details = CartDetail.where(cart_id: @cart.id)
  end
  
  def index
    @cart_details = CartDetail.where(cart_id: params[:cart_id])
  end
  
  def destroy
  end
  
  def updated
  end
  
  def edit
  end
  
  
end
