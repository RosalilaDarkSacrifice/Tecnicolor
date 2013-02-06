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

class SalidaProductoMalEstadosController < ApplicationController
  # GET /salida_producto_mal_estados
  # GET /salida_producto_mal_estados.json
  def index
    @salida_producto_mal_estados = SalidaProductoMalEstado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salida_producto_mal_estados }
    end
  end

  # GET /salida_producto_mal_estados/1
  # GET /salida_producto_mal_estados/1.json
  def show
    @salida_producto_mal_estado = SalidaProductoMalEstado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @salida_producto_mal_estado }
    end
  end

  # GET /salida_producto_mal_estados/new
  # GET /salida_producto_mal_estados/new.json
  def new
    @salida_producto_mal_estado = SalidaProductoMalEstado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @salida_producto_mal_estado }
    end
  end

  # GET /salida_producto_mal_estados/1/edit
  def edit
    @salida_producto_mal_estado = SalidaProductoMalEstado.find(params[:id])
  end

  # POST /salida_producto_mal_estados
  # POST /salida_producto_mal_estados.json
  def create
    @salida_producto_mal_estado = SalidaProductoMalEstado.new(params[:salida_producto_mal_estado])

    respond_to do |format|
      if @salida_producto_mal_estado.save

				c=@salida_producto_mal_estado.producto.categorium
				c.salidas+=@salida_producto_mal_estado.cantidad*@salida_producto_mal_estado.producto.cantidad_galones
				c.save

				p=@salida_producto_mal_estado.producto
				p.existencias-=@salida_producto_mal_estado.cantidad
				p.save

        format.html { redirect_to @salida_producto_mal_estado, notice: 'Salida producto mal estado was successfully created.' }
        format.json { render json: @salida_producto_mal_estado, status: :created, location: @salida_producto_mal_estado }
      else
        format.html { render action: "new" }
        format.json { render json: @salida_producto_mal_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salida_producto_mal_estados/1
  # PUT /salida_producto_mal_estados/1.json
  def update
    @salida_producto_mal_estado = SalidaProductoMalEstado.find(params[:id])

    respond_to do |format|
      if @salida_producto_mal_estado.update_attributes(params[:salida_producto_mal_estado])
        format.html { redirect_to @salida_producto_mal_estado, notice: 'Salida producto mal estado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @salida_producto_mal_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salida_producto_mal_estados/1
  # DELETE /salida_producto_mal_estados/1.json
  def destroy
    @salida_producto_mal_estado = SalidaProductoMalEstado.find(params[:id])
    @salida_producto_mal_estado.destroy

    respond_to do |format|
      format.html { redirect_to salida_producto_mal_estados_url }
      format.json { head :no_content }
    end
  end

	def buscar_producto_salida

		@producto=buscarProducto params[:nombre],params[:descripcion],params[:categoria][0],params[:marca][0]

    respond_to do |format|
			format.js
		end
	end

end
