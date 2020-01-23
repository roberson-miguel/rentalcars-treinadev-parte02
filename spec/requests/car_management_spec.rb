require 'rails_helper'

describe 'Car Management' do
  context 'show' do
    it 'render car correctly' do
      car = create(:car)

      get api_v1_car_path(car)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:car_model_id]).to eq(car.car_model_id)
      expect(json[:car_km]).to eq(car.car_km)
      expect(json[:license_plate]).to eq(car.license_plate)
      expect(json[:color]).to eq(car.color)
      expect(json[:status]).to eq(car.status)
      expect(json[:subsidiary_id]).to eq(car.subsidiary_id)

    end

    it 'car not found' do
      get api_v1_car_path(id: 999)
      

      expect(response).to have_http_status(:not_found)
    end
  end

  context 'index' do
    it 'render cars correctly' do
      cars = create_list(:car, 2)

      get api_v1_cars_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[0][:car_model_id]).to eq(cars[0].car_model_id)
      expect(json[1][:car_model_id]).to eq(cars[1].car_model_id)
      expect(json.first[:car_km]).to eq(cars.first.car_km)
      expect(json.second[:car_km]).to eq(cars.second.car_km)
      expect(json[0][:license_plate]).to eq(cars[0].license_plate)
      expect(json[1][:license_plate]).to eq(cars[1].license_plate)
      expect(json[0][:color]).to eq(cars[0].color)
      expect(json[1][:color]).to eq(cars[1].color)
      expect(json[0][:status]).to eq(cars[0].status)
      expect(json[1][:status]).to eq(cars[1].status)
      expect(json[0][:subsidiary_id]).to eq(cars[0].subsidiary_id)
      expect(json[1][:subsidiary_id]).to eq(cars[1].subsidiary_id)
    end
  end

  context 'create' do
    it 'create a car correctly' do
      subsidiary = create(:subsidiary)
      car_model = create(:car_model)
      
      post api_v1_cars_path, params: {car_model_id: car_model.id, subsidiary_id: subsidiary.id, 
                                      car_km: 123, license_plate: 'abs-1223', color: 'azul'}
      
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(json[:car_model_id]).to eq(car_model.id)
      expect(json[:subsidiary_id]).to eq(subsidiary.id)
      expect(json[:car_km]).to eq(123)
      expect(json[:license_plate]).to eq('abs-1223')
      expect(json[:color]).to eq('azul')

      car = Car.last
      expect(car.license_plate).to eq('abs-1223')

    end

    it 'car without all validations' do
      subsidiary = create(:subsidiary)
      car_model = create(:car_model)
      
      post api_v1_cars_path, params: {}
      
      expect(response).to have_http_status(412)

    end

    it 'car update' do
      car = create(:car)
      put api_v1_car_path(car), params: {car_model_id: car.car_model_id, subsidiary_id: car.subsidiary_id, 
                                      car_km: 123, license_plate: 'xxx-1223', color: 'azul'}

      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to have_http_status(200)
      expect(json[:car_model_id]).to eq(car.car_model_id)
      expect(json[:subsidiary_id]).to eq(car.subsidiary_id)
      expect(json[:car_km]).to eq(123)
      expect(json[:license_plate]).to eq('xxx-1223')
      expect(json[:color]).to eq('azul')

    end

  end
end