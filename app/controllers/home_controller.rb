class HomeController < ApplicationController
  def index
  	search_query = params['query']
  	if search_query
  		@hotels = Hotel.where("name like '%#{search_query}%' OR location like '%#{search_query}%'" )
  	else
  		@hotels = Hotel.all
  	end
  	
  	render :json => @hotels
  end

  def bookings
  	@bookings = Booking.all
  	render :json => @bookings
  end

  def book_hotel
  	#{hotel_id, start_date, end_date}
  	@user = User.first
  	@hotel = Hotel.find(params['id'].to_i)
  	start_date = Date.strptime(params['start_date'], '%d/%m/%Y') rescue nil
  	end_date = Date.strptime(params['end_date'], '%d/%m/%Y') rescue nil

  	if @hotel.present?  && start_date.present? && end_date.present? && end_date > start_date
  		Booking.create(:hotel_id => @hotel.id, :user_id => @user.id, :start_date => start_date, :end_date => end_date )
  		render :json => {:message => 'Successfully created'}
  	else
  		render :json => {:message => 'Please send the valid hotel or valid dates'}
  	end
  end
end
