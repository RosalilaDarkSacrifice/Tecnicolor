class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sigNumFactura
    arr=[]
    if FacturaCheque.last!=nil
      arr.push(FacturaCheque.last.numero)
    end
    if FacturaCredito.last!=nil
      arr.push(FacturaCredito.last.numero)
    end
    if FacturaEfectivo.last!=nil
      arr.push(FacturaEfectivo.last.numero)
    end
    if FacturaTarjetum.last!=nil
      arr.push(FacturaTarjetum.last.numero)
    end

    if arr.max==nil
      return 7205
    else
      return arr.max+1
    end
  end

  def sigNumPago
    arr=[]
    if PagoCheque.last!=nil
      arr.push(PagoCheque.last.numero)
    end
    if PagoEfectivo.last!=nil
      arr.push(PagoEfectivo.last.numero)
    end
    if PagoTarjetum.last!=nil
      arr.push(PagoTarjetum.last.numero)
    end

    if arr.max==nil
      return 1
    else
      return arr.max+1
    end
  end

	def buscarProducto nombre_p, descripcion_p, categoria_p, marca_p
		@nombre=nombre_p
    @descripcion=descripcion_p

		@categoria=""
		@marca=""
		if(categoria_p!="")
    	@categoria=Integer(categoria_p)
		end
		if(marca_p!="")
    	@marca=Integer(marca_p)
		end

		limit=10

		@productos=[]
		if(@categoria=="" && @marca=="")
			#@productos=Producto.find(:all,:limit => limit, :conditions=> ["nombre like ? AND descripcion like ?", @nombre + "%", @descripcion + "%"])
			@productos=Producto.find(:all, :conditions=> ["nombre like ? AND descripcion like ?", @nombre + "%", @descripcion + "%"])
		end
		if(@categoria=="" && @marca!="")
			#@productos=Producto.find(:all,:limit => limit, :conditions=> ["nombre like ? AND descripcion like ? AND marca_id = ?", @nombre + "%", @descripcion + "%",@marca])
			@productos=Producto.find(:all, :conditions=> ["nombre like ? AND descripcion like ? AND marca_id = ?", @nombre + "%", @descripcion + "%",@marca])
		end
		if(@categoria!="" && @marca=="")
			#@productos=Producto.find(:all,:limit => limit, :conditions=> ["nombre like ? AND descripcion like ? AND categorium_id = ?", @nombre + "%", @descripcion + "%",@categoria])
			@productos=Producto.find(:all, :conditions=> ["nombre like ? AND descripcion like ? AND categorium_id = ?", @nombre + "%", @descripcion + "%",@categoria])
		end
		if(@categoria!="" && @marca!="")
			#@productos=Producto.find(:all,:limit => limit, :conditions=> ["nombre like ? AND descripcion like ? AND categorium_id = ? AND marca_id = ?", @nombre + "%", @descripcion + "%",@categoria,@marca])
			@productos=Producto.find(:all, :conditions=> ["nombre like ? AND descripcion like ? AND categorium_id = ? AND marca_id = ?", @nombre + "%", @descripcion + "%",@categoria,@marca])
		end

		return @producto
	end


	def buscarProducto25 nombre_p, descripcion_p, categoria_p, marca_p
		@nombre=nombre_p
    @descripcion=descripcion_p

		@categoria=""
		@marca=""
		if(categoria_p!="")
    	@categoria=Integer(categoria_p)
		end
		if(marca_p!="")
    	@marca=Integer(marca_p)
		end

		limit=25

		@productos=[]
		if(@categoria=="" && @marca=="")
			#@productos=Producto.find(:all,:limit => limit, :conditions=> ["nombre like ? AND descripcion like ?", @nombre + "%", @descripcion + "%"])
			@productos=Producto.find(:all, :conditions=> ["nombre like ? AND descripcion like ?", @nombre + "%", @descripcion + "%"])
		end
		if(@categoria=="" && @marca!="")
			#@productos=Producto.find(:all,:limit => limit, :conditions=> ["nombre like ? AND descripcion like ? AND marca_id = ?", @nombre + "%", @descripcion + "%",@marca])
			@productos=Producto.find(:all, :conditions=> ["nombre like ? AND descripcion like ? AND marca_id = ?", @nombre + "%", @descripcion + "%",@marca])
		end
		if(@categoria!="" && @marca=="")
			#@productos=Producto.find(:all,:limit => limit, :conditions=> ["nombre like ? AND descripcion like ? AND categorium_id = ?", @nombre + "%", @descripcion + "%",@categoria])
			@productos=Producto.find(:all, :conditions=> ["nombre like ? AND descripcion like ? AND categorium_id = ?", @nombre + "%", @descripcion + "%",@categoria])
		end
		if(@categoria!="" && @marca!="")
			#@productos=Producto.find(:all,:limit => limit, :conditions=> ["nombre like ? AND descripcion like ? AND categorium_id = ? AND marca_id = ?", @nombre + "%", @descripcion + "%",@categoria,@marca])
			@productos=Producto.find(:all, :conditions=> ["nombre like ? AND descripcion like ? AND categorium_id = ? AND marca_id = ?", @nombre + "%", @descripcion + "%",@categoria,@marca])
		end

		return @producto
	end

end
