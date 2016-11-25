require 'rails_helper'

RSpec.describe Api::V1::BookingsController, :type => :request do

	describe "cabs around API" do
		context "positive case" do
			it "it could return cabs around" do
				let(:cab){create(:cab)}
				let(:cabs_around_params) {{"cabs_around": {"lat": "47.858205","lng": "2.294359","cab_type": "hipster"}}} 
				post '/api/v1/bookings/cabs_around', cabs_around_params.as_json
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(200)
			end
		end

		context "negative csse" do
			it "It should return no cabs message" do
				let(:cab){create(:cab)}
				let(:cabs_around_params) {"cabs_around": {"lat": "1,32.9166","lng": "-96.9828","cab_type": "hipster"}} 
				post '/api/v1/bookings/cabs_around', {}
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(404)
			end
		end
	end

	describe "create API" do
		context "positive case" do
			it "should return success respose" do
				let(:cab_type){create(:cab_type)}
				let(:cab){create(:cab, cab_type:cab_type)}
				let(:user){create(:user)}
				let(:create_params) {create: {source_lat:47.858205,source_lng:2.294359,destination_lat:47.558456,destination_lng:2.294359,cab_type:cab.cab_type,user_id:user.id)
				post '/api/v1/bookings/create', create_params.as_json
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(200)
			end
		end
		context "negative case" do
			it "shouldn return error" do
				let(:create_params) {create: {source_lat:47.858205,source_lng:2.294359,destination_lat:47.558456,destination_lng:2.294359,cab_type:cab.cab_type,user_id:user.id)
				post '/api/v1/bookings/create', {}
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(422)
			end
		end
	end

	describe "list API" do
		context "positive case" do
			it "It should return success respose" do
				let(:user){create(:user)}
				let(:list_params) {list: {user_id: user.id}}
				post '/api/v1/bookings/list', list_params.as_json
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(200)
			end
		end
		context "negative case" do
			it "should return error" do
				post '/api/v1/bookings/list', {}
				response_body = JSON.parse response.body
	 			expect(response_body[:bookings].length).to eq(0)
			end
		end
	end


	describe "cancel API" do
		context "positive case" do
			let(:booking){create(:booking)}
			let(:user){create(:user)}
			let(:cancel_params) {cancel: {user_id: user.id,booking_id:booking.id}}
			it "It should return success respose" do
				post '/api/v1/bookings/cancel', cancel_params.as_json
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(200)
			end
		end
		context "negative case" do
			it "should return error" do
				post '/api/v1/bookings/cancel', {}
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(422)
			end
		end
	end

	describe "complete API" do
		context "positive case" do
			let(:booking){create(:booking)}
			let(:user){create(:user)}
			let(:complete_params) {complete: {user_id: user.id,booking_id:booking.id}}
			it "It should return success respose" do
				post '/api/v1/bookings/complete', booking_params.as_json
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(200)
			end
		end
		context "negative case" do
			it "should return error" do
				post '/api/v1/bookings/complete', {}
				response_body = JSON.parse response.body
	 			expect(response_body[:status]).to eq(422)
			end
		end
	end

end
