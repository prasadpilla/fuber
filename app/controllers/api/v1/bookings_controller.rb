class Api::V1::BookingsController < ActionController::API

	def cabs_around
		point = [cabs_around_params[:lat].to_f, cabs_around_params[:lng].to_f]
		cab_type_id = CabType.where(cab_type:cabs_around_params[:cab_type])
		@cabs_around = Cab.find_cabs_around(point,cab_type_id)
		if @cabs_around.present?
			render json: @cabs_around, status: 200
		else
			render json: {error:"Sorry No cabs available at the moment"}, status: 404
		end
	end


	def create
		point = [create_params[:lat].to_f, create_params[:lng].to_f]
		cab_type_id = CabType.where(cab_type:cabs_around_params[:cab_type])
		@nearest_cab = Cab.find_cabs_around(point,cab_type_id).first
		if @nearest_cab.present?
			@nearest_cab.update! available:false
			@booking = Booking.new(create_params,start_time:Time.now,status:0)
			if @booking.save
				render json: {message:"Booking successful!"}, status: 201
			else
				render json: {error:"There was an error booking your cab."}, status: 422
			end
		else
			render json: {error:"Sorry No cabs available at the moment"}, status: 404
		end
	end

	def list
		@bookings = Booking.where(user_id:list_params[:user_id],status:0)
		render json: @bookings
	end

	def cancel
		@booking = Booking.find(cancel_params)
		if @booking.update(status: 2)
			@booking.cab.update! available:true
			render json: {messge:"Booking cancelled!"},status: 200
		else
			respond_with_errors(@booking)
		end
	end

	def complete
		@booking = Booking.find(complete_params)
		total_fare = @booking.calculate_fare
		@booking.cab.update! available:true
		if @booking.update(status: 1,end_time:Time.now)
			render json: {messge:"Ride completed!",total_fare:total_fare},status: 200
		else
			respond_with_errors(@booking)
		end
	end

	private

	def cancel_params
		params.require(:list).permit(:user_id)
	end

	def cancel_params
		params.require(:cancel).permit(:user_id,:booking_id)
	end

	def complete_params
		params.require(:complete).permit(:user_id,:booking_id)
	end

	def cabs_around_params
		params.require(:cabs_around).permit(:lat,:lng,:cab_type)
	end

	def create_params
		params.require(:create).permit(:source_lat,:source_lng,:destination_lat,:destination_lng,:cab_type,:user_id)
	end
end