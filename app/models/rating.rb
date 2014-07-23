class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :reading
	#validates_inclusion_of :score01, :in => 1..5
	validates_inclusion_of :score02, :in => 1..5
	validates_inclusion_of :score03, :in => 1..5
	validates_inclusion_of :score04, :in => 1..5
	validates_inclusion_of :score05, :in => 1..5
end
