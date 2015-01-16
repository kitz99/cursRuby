class ShowController < ActionController::Base
	def index
		@cbs = ProgrammingLanguage.all
	end

	def processs
		p params
		session["cb_id"] = params
			.keys
			.select {|k| k.start_with?('cb_prog_lang') }
			.map {|k| k.gsub(/^cb_prog_lang_/, '').to_i}
		redirect_to("/display_results")
	end

	def display
		@myArr = ProgrammingLanguage.find(session["cb_id"])
	end

end