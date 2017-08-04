class Art < ActiveRecord::Base
	belongs_to(:auction)

	scope(:not_purchased, -> do
		where({:purchased => false})
	end)

	validates(:name, {:presence => true, :length => { :maximum => 50}})
end
