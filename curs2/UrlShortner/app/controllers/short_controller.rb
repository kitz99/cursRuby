require 'csv'

class ShortController < ActionController::Base
  def index
  	render 'index'
  end

  def shorturl
    urlString = params[:aici]
    urldata = CSV.read('/home/bogdan/urldata.txt')
    hash = urldata.to_h
    gasit = false
    hash.each do |key, value|
    	if value == urlString
    		session['shorturl'] = key
    		puts key
    		gasit = true;	
    	end 
    end
    if gasit == false
    	require 'securerandom'
    	urls = SecureRandom.hex[0..5]
    	session['shorturl'] = urls
    	CSV.open("/home/bogdan/urldata.txt", "ab") do |csv|
		  csv << [urls, urlString]
		end
    end
    redirect_to '/short'
  end

  def goto
    hashlink = params[:linkhash]
    urldata = CSV.read('/home/bogdan/urldata.txt')
    hash = urldata.to_h

    link = hash[hashlink]
    redirect_to(link)
  end

end
