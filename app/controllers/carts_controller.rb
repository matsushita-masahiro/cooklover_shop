class CartsController < ApplicationController
  
  def new
    @products = Product.all
    @cart = Cart.new
  end
  
  def confirm
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
  
  
  def create
    if session[:id].present?
      @user_id = session[:id]
    else
      @user_id = 0
    end
    
    session[:arr].each do |product_id, number|
      logger.debug("==================== product_id = #{product_id} ---- number = #{number}")
    end    
    
    if !session[:id].present?
      @visitor = Visitor.new(user_id: @user_id,
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
      if @visitor.save
        flash[:notice] = "購入者情報が保存されました"
        redirect_to(carts_path)
      else
        flash[:notice] = "購入者情報が保存失敗しました"
        render("visitors/new")
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
