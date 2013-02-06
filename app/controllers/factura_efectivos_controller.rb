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

class FacturaEfectivosController < ApplicationController
  # GET /factura_efectivos
  # GET /factura_efectivos.json
  def index
    @factura_efectivos = FacturaEfectivo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factura_efectivos }
    end
  end

  # GET /factura_efectivos/1
  # GET /factura_efectivos/1.json
  def show
    @factura_efectivo = FacturaEfectivo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factura_efectivo }
    end
  end

  # GET /factura_efectivos/new
  # GET /factura_efectivos/new.json
  def new
    @factura_efectivo = FacturaEfectivo.new

    $producto_global=[]
		$total=0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factura_efectivo }
    end
  end

  # GET /factura_efectivos/1/edit
  def edit
    @factura_efectivo = FacturaEfectivo.find(params[:id])
  end

  # POST /factura_efectivos
  # POST /factura_efectivos.json
  def create
    @factura_efectivo = FacturaEfectivo.new(params[:factura_efectivo])
    @factura_efectivo.numero=sigNumFactura

    respond_to do |format|
      if @factura_efectivo.save

				$producto_global.each do |p_efectivo|
					p_efectivo.factura_efectivo_id=@factura_efectivo.id
				  	p_efectivo.save

					p=p_efectivo.producto
					p.existencias-=p_efectivo.cantidad
					p.save

					c=p_efectivo.producto.categorium
					c.ventas+=p_efectivo.cantidad*p_efectivo.producto.cantidad_galones
					c.save
				end

        format.html { redirect_to @factura_efectivo, notice: 'Factura efectivo was successfully created.' }
        format.json { render json: @factura_efectivo, status: :created, location: @factura_efectivo }
      else
        format.html { render action: "new" }
        format.json { render json: @factura_efectivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factura_efectivos/1
  # PUT /factura_efectivos/1.json
  def update
    @factura_efectivo = FacturaEfectivo.find(params[:id])

    respond_to do |format|
      if @factura_efectivo.update_attributes(params[:factura_efectivo])
        format.html { redirect_to @factura_efectivo, notice: 'Factura efectivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @factura_efectivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factura_efectivos/1
  # DELETE /factura_efectivos/1.json
  def destroy
    @factura_efectivo = FacturaEfectivo.find(params[:id])
    @factura_efectivo.destroy

    respond_to do |format|
      format.html { redirect_to factura_efectivos_url }
      format.json { head :no_content }
    end
  end

  def agregarProductoEfectivo

		p_temp=ProductoFacturaEfectivo.new(params[:producto_factura_efectivo])
		@success_flag=true

		if p_temp.precio<p_temp.producto.precio_minimo || p_temp.precio>p_temp.producto.precio_maximo
			@success_flag=false
		else
			success_flag=true
			$producto_global.push(p_temp)
			$total+=((p_temp.cantidad*100.0).round*(p_temp.precio*100.0).round)/10000.0
		end

    respond_to do |format|
        format.js
    end
  end

  def buscar_producto_factura
    @nombre=params[:nombre]
    @descripcion=params[:descripcion]
    @categoria=params[:categoria]
    @marca=params[:marca]
    respond_to do |format|
        format.js
    end
  end
	def buscar_producto_efectivo

		@producto=buscarProducto params[:nombre],params[:descripcion],params[:categoria][0],params[:marca][0]

    respond_to do |format|
			format.js
		end
	end
end
