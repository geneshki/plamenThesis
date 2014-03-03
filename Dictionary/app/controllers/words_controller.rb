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
			@word.factor = 0;
			@word.votes = 0;
			@word.downvotes = 0;
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
		@rel = @word.word
		@word.destroy
    	redirect_to :back
	end

	def dec_votes
		@word_id = params[:id]
		@word = Word.where(id: @word_id).take!

		@all = @word.votes + @word.downvotes

		@new_factor = find_factor(@word.votes, @all)
		@new_votes = @word.downvotes+1

		@word.update_attributes(:downvotes => @new_votes,:factor => @new_factor)
		redirect_to :back
	end

	def inc_votes
		@word_id = params[:id]
		@word = Word.where(id: @word_id).take!

		@all = @word.votes + @word.downvotes

		@new_factor = find_factor(@word.votes, @all)
		@new_votes = @word.votes+1

		@word.update_attributes(:votes => @new_votes,:factor => @new_factor)
		redirect_to :back
	end

	private

	def word_params
	  params.require(:word).permit(:word, :description, :language)
	end

	def find_factor(upvotes, allvotes)
 		z = Statistics2.pnormaldist(1-(1-0.975)/2)
 		phat = 1.0*upvotes/allvotes
 		factor =  (phat + z*z/(2*allvotes) - z * Math.sqrt((phat*(1-phat)+z*z/(4*allvotes))/allvotes))/(1+z*z/allvotes)
 		return factor
	end

	


end
