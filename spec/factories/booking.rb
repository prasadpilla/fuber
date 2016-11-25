FactoryGirl.define do
	factory :booking do
		association :cab, :factory => :cab
		association :user, :factory => :user
		source_lat 47.858205
		source_lng 2.294359
		destination_lat 47.558456
		destination_lng 2.294359
		start_time Time.now
		end_time Time.now+1.hour
	end
end