Rails.application.routes.draw do
	namespace "api" do
		namespace "v1" do
      		post 'bookings/cabs_around', :to => "bookings#cabs_around"
      		post 'bookings/create', :to => "bookings#create"
      		post 'bookings/list', :to => "bookings#list"
      		post 'bookings/cancel', :to => "bookings#cancel"
      		post 'bookings/complete', :to => "bookings#complete"
      	end
    end
end