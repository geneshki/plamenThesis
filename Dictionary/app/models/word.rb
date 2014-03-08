class Word < ActiveRecord::Base
	has_many :check
	class << self
		def search_by_prefix (prefix)
    		self.where("lower(word) LIKE '#{prefix}%'")
  		end

	end
end
