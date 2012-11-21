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

		numero_lleno = numero!=""
		fecha_llena	=	anio!="---" && mes!="---" && dia!="---"

		if(numero_lleno && fecha_llena)
			@factura_efectivos = FacturaEfectivo.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
			@factura_creditos = FacturaCredito.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
			@factura_cheques = FacturaCheque.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
			@factura_tarjeta = FacturaTarjetum.find(:all,:conditions => ["numero = ? AND fecha = ?",params[:numero],anio+"-"+mes+"-"+dia])
		end

		if (numero_lleno && !fecha_llena)
			@factura_efectivos = FacturaEfectivo.find(:all,:conditions => ["numero = ?",params[:numero]])
			@factura_creditos = FacturaCredito.find(:all,:conditions => ["numero = ?",params[:numero]])
			@factura_cheques = FacturaCheque.find(:all,:conditions => ["numero = ?",params[:numero]])
			@factura_tarjeta = FacturaTarjetum.find(:all,:conditions => ["numero = ?",params[:numero]])
		end

		if (!numero_lleno && fecha_llena)
			@factura_efectivos = FacturaEfectivo.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
			@factura_creditos = FacturaCredito.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
			@factura_cheques = FacturaCheque.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
			@factura_tarjeta = FacturaTarjetum.find(:all,:conditions => ["fecha = ?",anio+"-"+mes+"-"+dia])
		end

    respond_to do |format|
			format.js
		end
	end

	def cuentas_por_cobrar
		@cuentas_por_cobrar=FacturaCredito.all
	end

	def existencias_inventario
		@categoria=Categorium.all
		@ingresos=[]
		@transferencias=[]
		@salidas=[]
		@ventas=[]
		@categoria.each do |c|
			ingreso=0
			EntradaProducto.all.each do |p|
				if (p.producto!=nil  && p.cantidad!=nil)
					if(c.id==p.producto.categorium.id)
						ingreso+=p.cantidad*p.producto.cantidad_galones
					end
				end
			end

			transferencia=0
			TransferenciaInternaProducto.all.each do |p|
				if (p.producto!=nil && p.cantidad!=nil)
					if(c.id==p.categoria_id)
						transferencia+=p.cantidad_galones
					end
				end
			end


			salida=0
			SalidaProductoMalEstado.all.each do |p|
				if (p.producto!=nil  && p.cantidad!=nil)
					if(c.id==p.producto.categorium.id)
						salida+=p.cantidad*p.producto.cantidad_galones
					end
				end
			end


			venta=0
			ProductoFacturaCheque.all.each do |p|
				if(p.factura_cheque!=nil && p.producto!=nil && p.cantidad!=nil)
					if(!p.factura_cheque.anulada)
						if(c.id==p.producto.categorium.id)
							venta+=p.cantidad*p.producto.cantidad_galones
						end
					end
				end
			end
			ProductoFacturaCredito.all.each do |p|
				if(p.factura_credito!=nil && p.producto!=nil && p.cantidad!=nil)
					if(!p.factura_credito.anulada)
						if(c.id==p.producto.categorium.id)
							venta+=p.cantidad*p.producto.cantidad_galones
						end
					end
				end
			end
			ProductoFacturaEfectivo.all.each do |p|
				if(p.factura_efectivo!=nil && p.producto!=nil && p.cantidad!=nil)
					if(!p.factura_efectivo.anulada)
						if(c.id==p.producto.categorium.id)
							venta+=p.cantidad*p.producto.cantidad_galones
						end
					end
				end
			end
			ProductoFacturaTarjetum.all.each do |p|
				if(p.factura_tarjetum!=nil && p.producto!=nil && p.cantidad!=nil)
					if(!p.factura_tarjetum.anulada)
						if(c.id==p.producto.categorium.id)
							venta+=p.cantidad*p.producto.cantidad_galones
						end
					end
				end
			end

			@ingresos.push(ingreso)
			@transferencias.push(transferencia)
			@salidas.push(salida)
			@ventas.push(venta)
		end
	end
end
