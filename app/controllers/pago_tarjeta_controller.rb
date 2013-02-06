#    Ruby on Rails Invoice and reporting system made by RosalilaDarkSacrifice
#    Copyright (C) 2013  RosalilaDarkSacrifice
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

class PagoTarjetaController < ApplicationController
  # GET /pago_tarjeta
  # GET /pago_tarjeta.json
  def index
    @pago_tarjeta = PagoTarjetum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pago_tarjeta }
    end
  end

  # GET /pago_tarjeta/1
  # GET /pago_tarjeta/1.json
  def show
    @pago_tarjetum = PagoTarjetum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pago_tarjetum }
    end
  end

  # GET /pago_tarjeta/new
  # GET /pago_tarjeta/new.json
  def new
    @pago_tarjetum = PagoTarjetum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pago_tarjetum }
    end
  end

  # GET /pago_tarjeta/1/edit
  def edit
    @pago_tarjetum = PagoTarjetum.find(params[:id])
  end

  # POST /pago_tarjeta
  # POST /pago_tarjeta.json
  def create
    @pago_tarjetum = PagoTarjetum.new(params[:pago_tarjetum])

    respond_to do |format|
      if @pago_tarjetum.save
        format.html { redirect_to @pago_tarjetum, notice: 'Pago tarjetum was successfully created.' }
        format.json { render json: @pago_tarjetum, status: :created, location: @pago_tarjetum }
      else
        format.html { render action: "new" }
        format.json { render json: @pago_tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pago_tarjeta/1
  # PUT /pago_tarjeta/1.json
  def update
    @pago_tarjetum = PagoTarjetum.find(params[:id])

    respond_to do |format|
      if @pago_tarjetum.update_attributes(params[:pago_tarjetum])
        format.html { redirect_to @pago_tarjetum, notice: 'Pago tarjetum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pago_tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_tarjeta/1
  # DELETE /pago_tarjeta/1.json
  def destroy
    @pago_tarjetum = PagoTarjetum.find(params[:id])
    @pago_tarjetum.destroy

    respond_to do |format|
      format.html { redirect_to pago_tarjeta_url }
      format.json { head :no_content }
    end
  end
end
