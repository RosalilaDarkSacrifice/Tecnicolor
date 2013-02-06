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

class FacturaTarjetaController < ApplicationController
  # GET /factura_tarjeta
  # GET /factura_tarjeta.json
  def index
    @factura_tarjeta = FacturaTarjetum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factura_tarjeta }
    end
  end

  # GET /factura_tarjeta/1
  # GET /factura_tarjeta/1.json
  def show
    @factura_tarjetum = FacturaTarjetum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factura_tarjetum }
    end
  end

  # GET /factura_tarjeta/new
  # GET /factura_tarjeta/new.json
  def new
    @factura_tarjetum = FacturaTarjetum.new

		$producto_global=[]
		$total=0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factura_tarjetum }
    end
  end

  # GET /factura_tarjeta/1/edit
  def edit
    @factura_tarjetum = FacturaTarjetum.find(params[:id])
  end

  # POST /factura_tarjeta
  # POST /factura_tarjeta.json
  def create
    @factura_tarjetum = FacturaTarjetum.new(params[:factura_tarjetum])
    @factura_tarjetum.numero=sigNumFactura

    respond_to do |format|
      if @factura_tarjetum.save

				$producto_global.each do |p_tarjetum|
					p_tarjetum.factura_tarjetum_id=@factura_tarjetum.id
				  	p_tarjetum.save

					p=p_tarjetum.producto
					p.existencias-=p_tarjetum.cantidad
					p.save

					c=p_tarjetum.producto.categorium
					c.ventas+=p_tarjetum.cantidad*p_tarjetum.producto.cantidad_galones
					c.save
				end

        format.html { redirect_to @factura_tarjetum, notice: 'Factura tarjetum was successfully created.' }
        format.json { render json: @factura_tarjetum, status: :created, location: @factura_tarjetum }
      else
        format.html { render action: "new" }
        format.json { render json: @factura_tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factura_tarjeta/1
  # PUT /factura_tarjeta/1.json
  def update
    @factura_tarjetum = FacturaTarjetum.find(params[:id])

    respond_to do |format|
      if @factura_tarjetum.update_attributes(params[:factura_tarjetum])
        format.html { redirect_to @factura_tarjetum, notice: 'Factura tarjetum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @factura_tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factura_tarjeta/1
  # DELETE /factura_tarjeta/1.json
  def destroy
    @factura_tarjetum = FacturaTarjetum.find(params[:id])
    @factura_tarjetum.destroy

    respond_to do |format|
      format.html { redirect_to factura_tarjeta_url }
      format.json { head :no_content }
    end
  end
  def agregarProductoTarjetum

		p_temp=ProductoFacturaTarjetum.new(params[:producto_factura_tarjetum])
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

	def buscar_producto_tarjetum

		@producto=buscarProducto params[:nombre],params[:descripcion],params[:categoria][0],params[:marca][0]

    respond_to do |format|
			format.js
		end
	end
end
