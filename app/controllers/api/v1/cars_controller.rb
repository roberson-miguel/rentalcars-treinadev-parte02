class Api::V1::CarsController < Api::V1::ApiController
  def show
    if @car = Car.find_by(params[:id])
    render json: @car
    else 
    head 404
    end
  end

  def index
    @cars = Car.all
    render json: @cars
  end
end