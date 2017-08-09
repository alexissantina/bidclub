class Art < ActiveRecord::Base
	belongs_to(:auction)

	scope(:not_purchased, -> do
		where({:purchased => false})
	end)

	validates(:name, {:presence => true, :length => { :maximum => 50}, unless: :skip_name_validation})
    attr_accessor :skip_name_validation
end
