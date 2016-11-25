require 'rails_helper'

RSpec.describe Booking, type: :model do
	
	describe '#calculate_distance' do
			context "Positive case" do
				subject{create(:booking)}
				it "should return valid distance" do
					expect(subject.calculate_distance).to eq(20.71)
				end
			end

			context "negitive case: when source and destination is the same" do
				subject{create(:booking, destination_lat:47.858205,destination_lng:2.294359)}
				it "should return 0.0" do
					expect(subject.calculate_distance).to eq(0.0)
				end
			end
	end


	describe '#calculate_fare' do
		context "positive values" do
			let(:cab_type) {create(:cab_type)}
			let(:cab) { create(:cab, :cab_type => cab_type) }
			let(:booking) { build(:booking,:cab => cab) }
			it "should calculate correct price" do
				expect(booking.calculate_fare).to eq(387.1)
			end
		end

		context "negitive values" do
			let(:cab_type) {create(:cab_type, base_fare:-200)}
			let(:cab) { create(:cab, :cab_type => cab_type) }
			let(:booking) { build(:booking,:cab => cab) }
			it "should calculate correct price" do
				expect(booking.calculate_fare).to eq(87.1)
			end
		end

	end
end