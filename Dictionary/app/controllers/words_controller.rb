class WordsController < ApplicationController

	def new
		@word = Word.new
	end

	def show
		
	end

	def create
	
		@word_params = word_params
		if @word_params[:word].blank? || @word_params[:description].blank? || @word_params[:language].blank?
			$error = "Fill in all the fields!"
			redirect_to(:controller => "words", :action =>"new")
		else	
			@author = Registration.where(id: session[:reg_id]).take!
			@author = @author.username
			@word = Word.new(@word_params)
			@word.author = @author
			@word.votes = 2;
			@word.downvotes = 3;
			if @word.save
				redirect_to(:controller => "home", :action => "index")
			else
				render "new"
			end
		end
	end

	def edit
		@word =  Word.find(params[:id])
	end

	def update
		@word =  Word.find(params[:id])

		if @word.update_attributes(word_params)
			redirect_to(:controller => 'home', :action =>'index')
		end
	end

	def destroy
		@word = Word.find(params[:id])
		@word.destroy
    	redirect_to(:controller => 'home', :action =>'index')
	end

	def inc_votes
		@word = Word.find(params[:id])
		@word.votes = @word.votes+1
		redirect_to(:controller => 'home', :action =>'index')
	end

	def dec_votes
		@word = Word.find(params[:id])
	end

	private

	def word_params
	  params.require(:word).permit(:word, :description, :language)
	end

	


end
