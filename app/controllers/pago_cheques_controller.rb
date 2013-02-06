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

class PagoChequesController < ApplicationController
  # GET /pago_cheques
  # GET /pago_cheques.json
  def index
    @pago_cheques = PagoCheque.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pago_cheques }
    end
  end

  # GET /pago_cheques/1
  # GET /pago_cheques/1.json
  def show
    @pago_cheque = PagoCheque.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pago_cheque }
    end
  end

  # GET /pago_cheques/new
  # GET /pago_cheques/new.json
  def new
    @pago_cheque = PagoCheque.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pago_cheque }
    end
  end

  # GET /pago_cheques/1/edit
  def edit
    @pago_cheque = PagoCheque.find(params[:id])
  end

  # POST /pago_cheques
  # POST /pago_cheques.json
  def create
    @pago_cheque = PagoCheque.new(params[:pago_cheque])

    respond_to do |format|
      if @pago_cheque.save
        format.html { redirect_to @pago_cheque, notice: 'Pago cheque was successfully created.' }
        format.json { render json: @pago_cheque, status: :created, location: @pago_cheque }
      else
        format.html { render action: "new" }
        format.json { render json: @pago_cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pago_cheques/1
  # PUT /pago_cheques/1.json
  def update
    @pago_cheque = PagoCheque.find(params[:id])

    respond_to do |format|
      if @pago_cheque.update_attributes(params[:pago_cheque])
        format.html { redirect_to @pago_cheque, notice: 'Pago cheque was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pago_cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_cheques/1
  # DELETE /pago_cheques/1.json
  def destroy
    @pago_cheque = PagoCheque.find(params[:id])
    @pago_cheque.destroy

    respond_to do |format|
      format.html { redirect_to pago_cheques_url }
      format.json { head :no_content }
    end
  end
end
