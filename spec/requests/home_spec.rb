require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET home/index" do
    it "returns a list of hotels" do
      get '/home/index'
      expect(response).to have_http_status(200)

      hotels = JSON.parse(response.body)
      expect(hotels.size).to eq(5)
    end
  end

  describe "GET home/bookings" do
    it "returns a list of hotel bookings" do
      get '/home/bookings'
      expect(response).to have_http_status(200)
      bookings = JSON.parse(response.body)
      expect(bookings.class).to be Array
    end
  end

  describe "GET home/book_hotel" do
    it "This is hotel Book API, But pass the Wrong parameters in this" do
      get '/home/book_hotel', :params => { :id => 1 }
      
      res =  JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(res['message']).to eq 'Please send the valid hotel or valid dates'
    end

    it "This is hotel Book API, But pass the Correct parameters in this" do
      #date is DD/MM/YYYY format
      
      get '/home/book_hotel' , :params => { :id => 1 , :start_date => '01/01/2024', :end_date => '10/01/2024'}
      res =  JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(res['message']).to eq 'Successfully created'
    end

    it "This is hotel Book API, 'End Date' should be greater then 'Start Date' " do
      #date is DD/MM/YYYY format
      
      get '/home/book_hotel' , :params => { :id => 1 , :start_date => '09/01/2024', :end_date => '10/01/2024'}
      
      res =  JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(res['message']).to eq 'Successfully created'
    end

    it "This is hotel Book API, 'End Date' should be less then 'Start Date' " do
      #date is DD/MM/YYYY format
      get '/home/book_hotel' , :params => { :id => 1 , :start_date => '11/01/2024', :end_date => '10/01/2024'}
      
      res =  JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(res['message']).to eq 'Please send the valid hotel or valid dates'
      
    end
  end
end
