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

class ProveedorsController < ApplicationController
  # GET /proveedors
  # GET /proveedors.json
  def index
    @proveedors = Proveedor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proveedors }
    end
  end

  # GET /proveedors/1
  # GET /proveedors/1.json
  def show
    @proveedor = Proveedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proveedor }
    end
  end

  # GET /proveedors/new
  # GET /proveedors/new.json
  def new
    @proveedor = Proveedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proveedor }
    end
  end

  # GET /proveedors/1/edit
  def edit
    @proveedor = Proveedor.find(params[:id])
  end

  # POST /proveedors
  # POST /proveedors.json
  def create
    @proveedor = Proveedor.new(params[:proveedor])

    respond_to do |format|
      if @proveedor.save
        format.html { redirect_to @proveedor, notice: 'Proveedor was successfully created.' }
        format.json { render json: @proveedor, status: :created, location: @proveedor }
      else
        format.html { render action: "new" }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proveedors/1
  # PUT /proveedors/1.json
  def update
    @proveedor = Proveedor.find(params[:id])

    respond_to do |format|
      if @proveedor.update_attributes(params[:proveedor])
        format.html { redirect_to @proveedor, notice: 'Proveedor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedors/1
  # DELETE /proveedors/1.json
  def destroy
    @proveedor = Proveedor.find(params[:id])
    @proveedor.destroy

    respond_to do |format|
      format.html { redirect_to proveedors_url }
      format.json { head :no_content }
    end
  end
end
