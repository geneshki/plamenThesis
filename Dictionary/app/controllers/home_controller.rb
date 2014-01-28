class HomeController < ApplicationController
  def index
      #params[:src] = "pie"
      if params[:src]
        #debugger
        @search = params[:src]
        @src = Word.where(word: @search).to_a
        #@a ="asdf"
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
