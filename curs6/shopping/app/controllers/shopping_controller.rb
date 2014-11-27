class ShoppingController < ActionController::Base
	def shopping
		@products = Product.all
		@cartItems = ShoppingCartItem.all
	    render 'show'
	end

	def add
		id = params[:product_id].to_i
		quantity = params[:quantity].to_i

		item = ShoppingCartItem.find_by(:product_id => id)

		if item
			item.quantity += quantity
			item.save
			session[:suma] += item.acquisition_price * quantity
		else
			produs = Product.find_by(:id => id)
			session[:descriere] = produs.description
			attrs = {:product_id => id, :acquisition_price => produs.price, :quantity => quantity }
			session[:suma] += produs.price * quantity
			item = ShoppingCartItem.new(attrs)
			item.save
		end

		redirect_to('/shopping')
	end

	def reset
		ShoppingCartItem.delete_all
		session[:suma] = 0
		redirect_to('/shopping')
	end
end
