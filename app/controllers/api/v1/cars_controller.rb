class Api::V1::CarsController < Api::V1::ApiController
  def show
    @car = Car.find(params[:id])
    render json: @car
  
  end

  def index
    @cars = Car.all
    render json: @cars
  end

  def create
    @car = Car.new(params.permit(%i[car_model_id subsidiary_id car_km color license_plate]))
    if @car.valid?
      @car.save!
      render json: @car, status: 201
    else 
      render json: 'error', status: 412 
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(params.permit(%i[car_model_id subsidiary_id car_km color license_plate]))
      render json: @car, status: 200
    else 
      render json: 'error', status: 412 
    end
  end
  
end