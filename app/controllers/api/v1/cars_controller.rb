class Api::V1::CarsController < Api::V1::ApiController
  def show
    @car = Car.find(params[:id])
    render json: @car
  
  end

  def index
    @cars = Car.all
    render json: @cars
  end
end