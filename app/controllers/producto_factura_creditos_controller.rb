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

class ProductoFacturaCreditosController < ApplicationController
  # GET /producto_factura_creditos
  # GET /producto_factura_creditos.json
  def index
    @producto_factura_creditos = ProductoFacturaCredito.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @producto_factura_creditos }
    end
  end

  # GET /producto_factura_creditos/1
  # GET /producto_factura_creditos/1.json
  def show
    @producto_factura_credito = ProductoFacturaCredito.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @producto_factura_credito }
    end
  end

  # GET /producto_factura_creditos/new
  # GET /producto_factura_creditos/new.json
  def new
    @producto_factura_credito = ProductoFacturaCredito.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto_factura_credito }
    end
  end

  # GET /producto_factura_creditos/1/edit
  def edit
    @producto_factura_credito = ProductoFacturaCredito.find(params[:id])
  end

  # POST /producto_factura_creditos
  # POST /producto_factura_creditos.json
  def create
    @producto_factura_credito = ProductoFacturaCredito.new(params[:producto_factura_credito])

    respond_to do |format|
      if @producto_factura_credito.save
        format.html { redirect_to @producto_factura_credito, notice: 'Producto factura credito was successfully created.' }
        format.json { render json: @producto_factura_credito, status: :created, location: @producto_factura_credito }
      else
        format.html { render action: "new" }
        format.json { render json: @producto_factura_credito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /producto_factura_creditos/1
  # PUT /producto_factura_creditos/1.json
  def update
    @producto_factura_credito = ProductoFacturaCredito.find(params[:id])

    respond_to do |format|
      if @producto_factura_credito.update_attributes(params[:producto_factura_credito])
        format.html { redirect_to @producto_factura_credito, notice: 'Producto factura credito was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @producto_factura_credito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producto_factura_creditos/1
  # DELETE /producto_factura_creditos/1.json
  def destroy
    @producto_factura_credito = ProductoFacturaCredito.find(params[:id])
    @producto_factura_credito.destroy

    respond_to do |format|
      format.html { redirect_to producto_factura_creditos_url }
      format.json { head :no_content }
    end
  end
end
