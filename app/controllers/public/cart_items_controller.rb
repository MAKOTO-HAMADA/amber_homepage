class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!
  
  def index
    @cart_items = CartItem.all
    @total_price = 0
  end
  # @total_priceは、ビュー内で += で値を足していく為初期値を0にしている
  
  def create
    cart_item = CartItem.find_by(item_id: cart_item_params[:item_id])
    if cart_item.nil?
      cart_item = CartItem.new(cart_item_params)
      cart_item.save
      redirect_to cart_items_path
    else 
      add_quantity_by_type = cart_item.quantity_by_type + cart_item_params[:quantity_by_type].to_i
      if add_quantity_by_type > 10
        flash[:notice] = "ご注文数量の上限は＜１０個まで＞になります"
        redirect_to controller: :items, action: :show, id: cart_item.item_id
      else
        cart_item.update(quantity_by_type: add_quantity_by_type)
        redirect_to cart_items_path
      end
    end
  end
  # .find_by：CartItem内レコードのitem_idがカートに入れる商品(item_id)と一致するものを１つ拾ってくる
  # .nil？：存在しない場合、CartItemのレコードを新規作成してセーブする
  # 存在する場合、その拾ってきたレコードのquantity〇〇の既存の値と
  # indexページで入力されたqyantity〇〇の新規の値を合算し、add〇〇変数に入れる
  # 10個以上の場合は item/showへ返し、
  # 10個以下の場合は 拾ってきたレコードのquantity〇〇だけをadd〇〇の値に更新する
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(quantity_by_type: cart_item_params[:quantity_by_type])
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    cart_items = CartItem.where(customer_id: current_customer.id)
    cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity_by_type)
  end
  
end
