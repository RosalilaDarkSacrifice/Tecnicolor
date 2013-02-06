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

class CategoriaController < ApplicationController
  # GET /categoria
  # GET /categoria.json
  def index
    @categoria = Categorium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categoria }
    end
  end

  # GET /categoria/1
  # GET /categoria/1.json
  def show
    @categorium = Categorium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categorium }
    end
  end

  # GET /categoria/new
  # GET /categoria/new.json
  def new
    @categorium = Categorium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categorium }
    end
  end

  # GET /categoria/1/edit
  def edit
    @categorium = Categorium.find(params[:id])
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @categorium = Categorium.new(params[:categorium])

		@categorium.entradas=0
		@categorium.salidas=0
		@categorium.ventas=0

    respond_to do |format|
      if @categorium.save
        format.html { redirect_to @categorium, notice: 'Categorium was successfully created.' }
        format.json { render json: @categorium, status: :created, location: @categorium }
      else
        format.html { render action: "new" }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categoria/1
  # PUT /categoria/1.json
  def update
    @categorium = Categorium.find(params[:id])

    respond_to do |format|
      if @categorium.update_attributes(params[:categorium])
        format.html { redirect_to @categorium, notice: 'Categorium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.json
  def destroy
    @categorium = Categorium.find(params[:id])
    @categorium.destroy

    respond_to do |format|
      format.html { redirect_to categoria_url }
      format.json { head :no_content }
    end
  end
end
