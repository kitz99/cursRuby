class ShoppingController < ActionController::Base
   def show
     @products = Product.all
     @shoppingCart = ShoppingCartItem.all
     @suma = 0
    @shoppingCart.each do |item|
      @suma += item.subtotal
    end
     render ('show')
   end

   def add
	id = params[:id].to_i
        quantity = params[:quantity].to_i
        item = ShoppingCartItem.find_by(:product_id => id)
        if item
           item.quantity += quantity
           item.save
        else
           product = Product.find_by(:id => id)
           attrs = {:product_id => product.id, :acquisition_price => product.price, :quantity => quantity}
           item = ShoppingCartItem.new(attrs)
           item.save
        end
        redirect_to ('/shoppingCart')
           
   end

   def reset
     ShoppingCartItem.delete_all
     redirect_to ('/shoppingCart')
   end

   def addProduct
     description = params[:description]
     price = params[:price].to_i
     attrs = {:description => description, :price => price}
     Product.create(attrs)
     redirect_to('/shoppingCart')
     
   end

end
