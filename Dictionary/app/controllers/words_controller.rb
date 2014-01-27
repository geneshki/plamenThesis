class WordsController < ApplicationController

	def new
		@word = Word.new
	end

	def create
		@word_params = word_params

		@word = Word.new(@word_params)

		if @word.save
			redirect_to(:controller => "home", :action => "index")
		else
			render "new"
		end

	end

	private

	def word_params
	  params.require(:word).permit(:word, :description, :language)
	end

end
