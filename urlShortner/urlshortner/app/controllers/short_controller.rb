require 'uri'
require 'securerandom'

class ShortController < ActionController::Base
	def index
		@urls = Pointer.all
		render 'index.html.erb'
	end

	def eroare
		render 'eroare.html.erb'
	end

	def scurteaza
		de_scurtat = params[:urlPentruScurtat]
		if test_url_lung(de_scurtat)
			db_result = Pointer.find_by(:long => de_scurtat)
			if db_result != nil
				session[:scurt] = db_result.short
				session[:lung] = db_result.long
				redirect_to '/'
			else
				scurt = SecureRandom.hex[0..5]
    			session[:scurt] = scurt
				session[:lung] = de_scurtat
    			Pointer.create({:short => scurt, :long => de_scurtat})
				redirect_to '/'
			end
		else
			redirect_to '/eroare'
		end
	end

	def goto
		url_scurt = params[:urlscurt]
		if test_url_scurt(url_scurt)
			url_db = Pointer.find_by(:short => url_scurt)
			if url_db != nil
				redirect_to url_db.long
			else
				redirect_to '/eroare'
			end
		else
			redirect_to '/eroare'
		end
	end

	private
		def test_url_scurt(url_scurt)
			if url_scurt.length != 6
				return false
			end
			if not url_scurt.match(/^[[:alnum:]]+$/)
				return false
			end
			return true
		end

		def test_url_lung(de_scurtat)
			if de_scurtat =~ /\A#{URI::regexp(['http', 'https'])}\z/
				return true
			end
			return false
		end
end