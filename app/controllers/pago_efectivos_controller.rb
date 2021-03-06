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

class PagoEfectivosController < ApplicationController
  # GET /pago_efectivos
  # GET /pago_efectivos.json
  def index
    @pago_efectivos = PagoEfectivo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pago_efectivos }
    end
  end

  # GET /pago_efectivos/1
  # GET /pago_efectivos/1.json
  def show
    @pago_efectivo = PagoEfectivo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pago_efectivo }
    end
  end

  # GET /pago_efectivos/new
  # GET /pago_efectivos/new.json
  def new
    @pago_efectivo = PagoEfectivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pago_efectivo }
    end
  end

  # GET /pago_efectivos/1/edit
  def edit
    @pago_efectivo = PagoEfectivo.find(params[:id])
  end

  # POST /pago_efectivos
  # POST /pago_efectivos.json
  def create
    @pago_efectivo = PagoEfectivo.new(params[:pago_efectivo])

    respond_to do |format|
      if @pago_efectivo.save
        format.html { redirect_to @pago_efectivo, notice: 'Pago efectivo was successfully created.' }
        format.json { render json: @pago_efectivo, status: :created, location: @pago_efectivo }
      else
        format.html { render action: "new" }
        format.json { render json: @pago_efectivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pago_efectivos/1
  # PUT /pago_efectivos/1.json
  def update
    @pago_efectivo = PagoEfectivo.find(params[:id])

    respond_to do |format|
      if @pago_efectivo.update_attributes(params[:pago_efectivo])
        format.html { redirect_to @pago_efectivo, notice: 'Pago efectivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pago_efectivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_efectivos/1
  # DELETE /pago_efectivos/1.json
  def destroy
    @pago_efectivo = PagoEfectivo.find(params[:id])
    @pago_efectivo.destroy

    respond_to do |format|
      format.html { redirect_to pago_efectivos_url }
      format.json { head :no_content }
    end
  end
end
