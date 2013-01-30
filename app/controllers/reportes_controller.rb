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

	def cuentas_por_cobrar
		@cuentas_por_cobrar=FacturaCredito.all
	end

	def reporte_galones
		@categoria=Categorium.where(:tipo_reporte=>"galon")
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
