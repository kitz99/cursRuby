require 'securerandom'
class TodoController < ActionController::Base
	def additems
		session[:item] ||= [] 
		render("additems")
	end

	def doadditem
		todoitem = params[:todoitem]
		key = SecureRandom.hex[0..5]
		hash_to_append = {'id' => key, 'description' => todoitem, 'done' => false}
		session[:item] ||= [] 
		session[:item] << hash_to_append
		redirect_to('/additems')
	end

	def markasdone
		randkey = params[:randkey]
		session[:item].each do |currentitem|
			if currentitem['id'] == randkey
				currentitem['done'] = true 
				break
			end
		end
		redirect_to('/additems')
	end
end