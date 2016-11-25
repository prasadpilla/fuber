require 'rails_helper'

RSpec.describe Cab, type: :model do

	describe '.find_cabs_around' do
				context "location with in 1000 meters" do
					let(:cab_type) {create(:cab_type)}
					subject{create(:cab, :cab_type => cab_type)}
					it "should return valid distance" do
						expect(described_class.find_cabs_around([47.858205,2.294359],cab_type.cab_type).first).to eq(:cab)
					end
				end

				context "location beyond 1000 meters" do
					let(:cab_type) {create(:cab_type)}
					subject{create(:cab, :cab_type => cab_type)}
					it "should not return valid distance" do
						expect(described_class.find_cabs_around([5567.858205,68.294359],cab_type.cab_type).first).to eq(:cab)
					end
				end
		end

end