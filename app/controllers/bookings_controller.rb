# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_customer, except: :index
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all.with_attached_images
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show; end

  # GET /bookings/new
  def new
    @booking = @customer.bookings.build
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = @customer.bookings.build(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to [@customer, @booking], notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to [@customer, @booking], notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to @customer, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = @customer.bookings.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:name, :category, :rooms, :wifi, :phone, :address, :description, :available, :check_in, :check_out, :customer_id, images: [])
  end
end
