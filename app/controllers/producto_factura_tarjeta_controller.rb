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

class ProductoFacturaTarjetaController < ApplicationController
  # GET /producto_factura_tarjeta
  # GET /producto_factura_tarjeta.json
  def index
    @producto_factura_tarjeta = ProductoFacturaTarjetum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @producto_factura_tarjeta }
    end
  end

  # GET /producto_factura_tarjeta/1
  # GET /producto_factura_tarjeta/1.json
  def show
    @producto_factura_tarjetum = ProductoFacturaTarjetum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @producto_factura_tarjetum }
    end
  end

  # GET /producto_factura_tarjeta/new
  # GET /producto_factura_tarjeta/new.json
  def new
    @producto_factura_tarjetum = ProductoFacturaTarjetum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto_factura_tarjetum }
    end
  end

  # GET /producto_factura_tarjeta/1/edit
  def edit
    @producto_factura_tarjetum = ProductoFacturaTarjetum.find(params[:id])
  end

  # POST /producto_factura_tarjeta
  # POST /producto_factura_tarjeta.json
  def create
    @producto_factura_tarjetum = ProductoFacturaTarjetum.new(params[:producto_factura_tarjetum])

    respond_to do |format|
      if @producto_factura_tarjetum.save
        format.html { redirect_to @producto_factura_tarjetum, notice: 'Producto factura tarjetum was successfully created.' }
        format.json { render json: @producto_factura_tarjetum, status: :created, location: @producto_factura_tarjetum }
      else
        format.html { render action: "new" }
        format.json { render json: @producto_factura_tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /producto_factura_tarjeta/1
  # PUT /producto_factura_tarjeta/1.json
  def update
    @producto_factura_tarjetum = ProductoFacturaTarjetum.find(params[:id])

    respond_to do |format|
      if @producto_factura_tarjetum.update_attributes(params[:producto_factura_tarjetum])
        format.html { redirect_to @producto_factura_tarjetum, notice: 'Producto factura tarjetum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @producto_factura_tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producto_factura_tarjeta/1
  # DELETE /producto_factura_tarjeta/1.json
  def destroy
    @producto_factura_tarjetum = ProductoFacturaTarjetum.find(params[:id])
    @producto_factura_tarjetum.destroy

    respond_to do |format|
      format.html { redirect_to producto_factura_tarjeta_url }
      format.json { head :no_content }
    end
  end
end
