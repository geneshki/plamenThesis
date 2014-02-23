#require "Statistics2"

class Word < ActiveRecord::Base
	class << self
		def inc_votes(word)
			@word = Word.where(word: word).take!
			@word.votes = @word.votes+1
		end

		def search_by_prefix (prefix)
    		self.where("lower(word) LIKE '#{prefix}%'")
  		end

		def ci_lower_bound(pos, n)
		    if n == 0
		        return 0
		    end
		    z = Statistics2.pnormaldist(1-(1-0.975)/2)
		    phat = 1.0*pos/n
		    (phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)
		end
	end
end
