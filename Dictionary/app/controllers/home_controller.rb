class HomeController < ApplicationController
  def index
      @src = Word.where(word: "pie").take
      if params[:src]
        @search = params[:src]
        @src = Word.where(word: @search).take
      end    
  end

  def loged

  end

  def show
  	
  end

  def new
  	
  end

  def create

  end
  
end
