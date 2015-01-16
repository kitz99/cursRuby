class ListController < ActionController::Base
	def todo 
		case session[:whatToShow]
			when 'active'
			  @items = ToDoItem.where(:done => false)
			  @showing = 'Active'
			when 'completed'
			  @items = ToDoItem.where(:done => true)
			  @showing = 'Completed'
			else
			  @items = ToDoItem.all
			  @showing = 'ALL'
		end
	end

	def doaddnewitem
		ToDoItem.create({:description => params[:itemtoadd], :done => false})
		redirect_to "/todo"
	end

	def withitem
		id = params[:id]
		item = ToDoItem.find_by(:id => id)
		item.update({:done =>(not item.done)})
		redirect_to '/todo'
	end

	def showeditformfor
		@item = ToDoItem.find_by(:id => params[:id])
	end

	def savechangesfor
		id = params[:id]
		description = params[:newdescription]

		item = ToDoItem.find_by(:id => id)
		item.update({:description => description})

		redirect_to '/todo'
	end

	def buttonsatbottom
		if params.has_key?('buttontoshowall')
			session[:whatToShow] = 'all'
		end
		if params.has_key?('buttontoshowactive')
			session[:whatToShow] = 'active'
		end
		if params.has_key?('buttontoshowcompleted')
			session[:whatToShow] = 'completed'
		end
		if params.has_key?('buttontoclearcompleted')
			ToDoItem.where(:done => true).delete_all
		end
		redirect_to '/todo'
	end
end