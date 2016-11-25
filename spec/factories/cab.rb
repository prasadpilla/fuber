FactoryGirl.define do
	factory :cab do
		association :cab_type, :factory => :cab_type
		cab_model "Audi A10"
		reg_no "NS100"
		available false
		color "White"
		lat 47.858205
		lng 2.294359
	end
end