class HomeController < ApplicationController
  def index
      
      if params[:letter]
        @src = Word.search_by_prefix(params[:letter]).order('word ASC').to_a
      end

      if params[:usr]
        @search = params[:usr]
        @src = Word.where(author: @search).order('factor DESC')
        if @src.empty?
          $error = "User doesn't exist. Sorry."
          redirect_to(:controller => 'home', :action => 'index')
        end
      end
      if params[:lang]
        @search = params[:lang]
        @src = Word.where(language: @search).order('factor DESC')
        if @src.empty?
          $error = "No words added with that language."
          redirect_to(:controller => 'home', :action => 'index')
        end
      end
      if params[:src]
        @search = params[:src]
        @src = Word.where(word: @search).order('factor DESC')
        if @src.empty?
          $error = "Word doesn't exist."
          redirect_to(:controller => 'home', :action => 'index')
        end
      end
  end

  def random
    @q = rand(5..30)
    @rand = Word.limit(1).order("RAND()").take
  end
end
