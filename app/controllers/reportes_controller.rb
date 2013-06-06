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

class ReportesController < ApplicationController
	def arqueo
		@factura_cheques=FacturaCheque.all(:conditions => ['fecha = ?', Date.today])
		@factura_creditos=FacturaCredito.all(:conditions => ['fecha = ?', Date.today])
		@factura_efectivos=FacturaEfectivo.all(:conditions => ['fecha = ?', Date.today])
		@factura_tarjeta=FacturaTarjetum.all(:conditions => ['fecha = ?', Date.today])

		@factura_cheques_total=0
		@factura_cheques.each do |f|
			@factura_cheques_total+=f.getTotal
		end

		@factura_creditos_total=0
		@factura_creditos.each do |f|
			@factura_creditos_total+=f.getTotal
		end

		@factura_efectivos_total=0
		@factura_efectivos.each do |f|
			@factura_efectivos_total+=f.getTotal
		end

		@factura_tarjeta_total=0
		@factura_tarjeta.each do |f|
			@factura_tarjeta_total+=f.getTotal
		end

		@pagos_cheques=PagoCheque.all(:conditions => ['fecha = ?', Date.today])
		@pagos_efectivos=PagoEfectivo.all(:conditions => ['fecha = ?', Date.today])
		@pagos_tarjeta=PagoTarjetum.all(:conditions => ['fecha = ?', Date.today])

		@pagos_cheques_total=0
		@pagos_cheques.each do |f|
			@pagos_cheques_total+=f.monto
		end

		@pagos_efectivos_total=0
		@pagos_efectivos.each do |f|
			@pagos_efectivos_total+=f.monto
		end

		@pagos_tarjeta_total=0
		@pagos_tarjeta.each do |f|
			@pagos_tarjeta_total+=f.monto
		end
	end

	def consultar_factura
	end

	def buscar_factura

		numero=params[:numero][0]

		anio=params[:anio]
		mes=params[:mes]
		dia=params[:dia]

		@anio=anio
		@mes=mes
		@dia=dia

		numero_lleno = numero!=""
		fecha_llena	=	anio!="---" && mes!="---" && dia!="---"

		if(numero_lleno && fecha_llena)
			@factura_efectivos = FacturaEfectivo.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
			@factura_creditos = FacturaCredito.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
			@factura_cheques = FacturaCheque.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
			@factura_tarjeta = FacturaTarjetum.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])

			@pagos_efectivo=PagoEfectivo.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
			@pagos_cheque=PagoCheque.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
			@pagos_tarjetum=PagoTarjetum.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
		end

		if (numero_lleno && !fecha_llena)
			@factura_efectivos = FacturaEfectivo.find(:all,:conditions => ["numero = ?",params[:numero]])
			@factura_creditos = FacturaCredito.find(:all,:conditions => ["numero = ?",params[:numero]])
			@factura_cheques = FacturaCheque.find(:all,:conditions => ["numero = ?",params[:numero]])
			@factura_tarjeta = FacturaTarjetum.find(:all,:conditions => ["numero = ?",params[:numero]])

			@pagos_efectivo=PagoEfectivo.find(:all,:conditions => ["numero = ?",params[:numero]])
			@pagos_cheque=PagoCheque.find(:all,:conditions => ["numero = ?",params[:numero]])
			@pagos_tarjetum=PagoTarjetum.find(:all,:conditions => ["numero = ?",params[:numero]])
		end

		if (!numero_lleno && fecha_llena)
			@factura_efectivos = FacturaEfectivo.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
			@factura_creditos = FacturaCredito.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
			@factura_cheques = FacturaCheque.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
			@factura_tarjeta = FacturaTarjetum.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])

			@pagos_efectivo = PagoEfectivo.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
			@pagos_cheque = PagoCheque.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
			@pagos_tarjetum = PagoTarjetum.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
		end

    respond_to do |format|
			format.js
		end
	end

	def buscar_factura_por_rango

		anio_inicio=params[:anio]
		mes_inicio=params[:mes]
		dia_inicio=params[:dia]

		anio_final=params[:anio_final]
		mes_final=params[:mes_final]
		dia_final=params[:dia_final]

		@anio_inicio=anio_inicio
		@mes_inicio=mes_inicio
		@dia_inicio=dia_inicio

		@anio_final=anio_final
		@mes_final=mes_final
		@dia_final=dia_final

		fecha_llena	=	anio_inicio!="---" && mes_inicio!="---" && dia_inicio!="---"

		if (fecha_llena)
			str = " fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'"
			@factura_efectivos = FacturaEfectivo.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@factura_creditos = FacturaCredito.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@factura_cheques = FacturaCheque.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@factura_tarjeta = FacturaTarjetum.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")

			@pagos_efectivo = PagoEfectivo.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@pagos_cheque = PagoCheque.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@pagos_tarjetum = PagoTarjetum.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
		end

    respond_to do |format|
			format.js
		end
	end

	def buscar_factura_por_rango_resumido

		anio_inicio=params[:anio]
		mes_inicio=params[:mes]
		dia_inicio=params[:dia]

		anio_final=params[:anio_final]
		mes_final=params[:mes_final]
		dia_final=params[:dia_final]

		@anio_inicio=anio_inicio
		@mes_inicio=mes_inicio
		@dia_inicio=dia_inicio

		@anio_final=anio_final
		@mes_final=mes_final
		@dia_final=dia_final

		fecha_llena	=	anio_inicio!="---" && mes_inicio!="---" && dia_inicio!="---"

		if (fecha_llena)
			str = " fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'"
			@factura_efectivos = FacturaEfectivo.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@factura_creditos = FacturaCredito.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@factura_cheques = FacturaCheque.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@factura_tarjeta = FacturaTarjetum.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")

			@pagos_efectivo = PagoEfectivo.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@pagos_cheque = PagoCheque.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
			@pagos_tarjetum = PagoTarjetum.where(" fecha BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'")
		end

    respond_to do |format|
			format.js
		end
	end

	def cuentas_por_cobrar
		@cuentas_por_cobrar=FacturaCredito.all
	end

	def reporte_galones
		@categoria=Categorium.where(:tipo_reporte=>"galon densidad")
	end

	def reporte_unitario
		@categoria=Categorium.where(:tipo_reporte=>"unitario")
		@productos=[]
		@categoria.each do |c|
			c.productos.each do |p|
				@productos.push(p)
			end
		end
	end

	def todos_los_productos
		@productos=Producto.all
	end
end
