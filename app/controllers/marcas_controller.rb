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

class MarcasController < ApplicationController
  # GET /marcas
  # GET /marcas.json
  def index
    @marcas = Marca.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marcas }
    end
  end

  # GET /marcas/1
  # GET /marcas/1.json
  def show
    @marca = Marca.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marca }
    end
  end

  # GET /marcas/new
  # GET /marcas/new.json
  def new
    @marca = Marca.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marca }
    end
  end

  # GET /marcas/1/edit
  def edit
    @marca = Marca.find(params[:id])
  end

  # POST /marcas
  # POST /marcas.json
  def create
    @marca = Marca.new(params[:marca])

    respond_to do |format|
      if @marca.save
        format.html { redirect_to @marca, notice: 'Marca was successfully created.' }
        format.json { render json: @marca, status: :created, location: @marca }
      else
        format.html { render action: "new" }
        format.json { render json: @marca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marcas/1
  # PUT /marcas/1.json
  def update
    @marca = Marca.find(params[:id])

    respond_to do |format|
      if @marca.update_attributes(params[:marca])
        format.html { redirect_to @marca, notice: 'Marca was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marcas/1
  # DELETE /marcas/1.json
  def destroy
    @marca = Marca.find(params[:id])
    @marca.destroy

    respond_to do |format|
      format.html { redirect_to marcas_url }
      format.json { head :no_content }
    end
  end
end
