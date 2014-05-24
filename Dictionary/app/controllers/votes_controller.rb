class VotesController < ApplicationController
	def new
		@votes = Vote.new
	end
end
