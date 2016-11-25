FactoryGirl.define do
	factory :cab_type do
		cab_type "hipster"
		base_fare 100
		per_mile_fare 10
		per_minute_fare 3
		miles_with_in_base_fare 10
	end
end