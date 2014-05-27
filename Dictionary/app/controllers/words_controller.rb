class WordsController < ApplicationController
before_filter :authenticte_reg
	def new
		@word = Word.new
	end

	def show
		
	end

	def create
		@word = Word.new
		@word_params = word_params
		if @word_params[:word].blank? || @word_params[:description].blank? || @word_params[:language].blank?
			$error = "Fill in all the fields!"
			redirect_to(:controller => "words", :action =>"new")
		else	
			@author = Registration.where(id: session[:reg_id]).take!
			@author = @author.username
			@word = Word.new(@word_params)
			@word.author = @author
			@word.factor = 0
			@word.votes = 0
			@word.downvotes = 0
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
    	redirect_to :back
	end

	def decreace_votes
		
		@relation = Vote.new
		@word_id = params[:id]
		@word = Word.where(id: @word_id).take!
		
		@relation.user_id = session[:reg_id]
		@relation.word_id = @word_id
		@relation.vote_value = 0
		@new_votes = @word.downvotes+1
		@all = @new_votes + @word.downvotes

		@new_factor = find_factor(@word.votes, @all)
		

		@word.update_attributes(:downvotes => @new_votes,:factor => @new_factor)
		@relation.save
		redirect_to :back
	end

	def inc_votes
		@relation = Vote.new
		@word_id = params[:id]
		@word = Word.where(id: @word_id).take!

		@relation.user_id = session[:reg_id]
		@relation.word_id = @word_id
		@relation.vote_value = 1
		@new_votes = @word.votes+1
		@all = @new_votes + @word.downvotes

		@new_factor = find_factor(@word.votes, @all)
		

		@word.update_attributes(:votes => @new_votes,:factor => @new_factor)
		@relation.save
		redirect_to :back
	end

	
	def dec_votes
		
		@word = Word.where(id: params[:word_id]).take!
		@vote = Vote.where(word_id: params[:word_id]).take
		if @vote.vote_value == 0 && @vote.user_id == params[:reg_id].to_i
			@new_votes = @word.downvotes - 1
			@all = @new_votes + @word.votes
			@new_factor =find_factor(@new_votes, @all)
			@word.update_attributes(:downvotes => @new_votes,:factor => @new_factor)
		end
		if @vote.vote_value == 1 && @vote.user_id == params[:reg_id].to_i
			@new_votes = @word.votes - 1
			@all = @new_votes + @word.downvotes
			@new_factor =find_factor(@new_votes, @all)
			@word.update_attributes(:votes => @new_votes,:factor => @new_factor)
		end
		@vote.destroy
		
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
