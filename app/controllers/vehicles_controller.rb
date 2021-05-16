class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
    @popular = Vote.popular
    @cars = Vehicle.where(category_id: 3).order(created_at: :desc).limit(1)
    @suvs = Vehicle.where(category_id: 4).order(created_at: :desc).limit(1)
    @bus = Vehicle.where(category_id: 5).order(created_at: :desc).limit(1)
    @trucks = Vehicle.where(category_id: 6).order(created_at: :desc).limit(1)
    @equipment = Vehicle.where(category_id: 7).order(created_at: :desc).limit(1)
    @parts = Vehicle.where(category_id: 8).order(created_at: :desc).limit(1)
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = current_user.vehicles.build
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  # GET /vehicles/1/edit
  def edit
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = current_user.vehicles.new(vehicle_params)
    @vehicle.category_id = params[:category_id]
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    @vehicle.category_id = params[:category_id]
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def vote
    @vehicle = Vehicle.all.find(params[:id])
    Vote.create(user_id: current_user.id, vehicle_id: @vehicle.id)
    redirect_to vehicle_path(@vehicle)
  end

  def unvote
    @vehicle = Vehicle.all.find(params[:id])
    Vote.destroy(current_user.id)
    redirect_to vehicles_path(@vehicle)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vehicle_params
    params.require(:vehicle).permit(:name, :price, :category_id, :make, :model, :fuel_type, :vehicle_conditions, :avatar)
  end
end
