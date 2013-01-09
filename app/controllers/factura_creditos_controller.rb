class FacturaCreditosController < ApplicationController
  # GET /factura_creditos
  # GET /factura_creditos.json
  def index
    @factura_creditos = FacturaCredito.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factura_creditos }
    end
  end

  # GET /factura_creditos/1
  # GET /factura_creditos/1.json
  def show
    @factura_credito = FacturaCredito.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factura_credito }
    end
  end

  # GET /factura_creditos/new
  # GET /factura_creditos/new.json
  def new
    @factura_credito = FacturaCredito.new

		$producto_global=[]
		$total=0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factura_credito }
    end
  end

  # GET /factura_creditos/1/edit
  def edit
    @factura_credito = FacturaCredito.find(params[:id])
  end

  # POST /factura_creditos
  # POST /factura_creditos.json
  def create
    @factura_credito = FacturaCredito.new(params[:factura_credito])
    @factura_credito.numero=sigNumFactura

    respond_to do |format|
      if @factura_credito.save

				$producto_global.each do |p_credito|
					p_credito.factura_credito_id=@factura_credito.id
				  	p_credito.save

					p=p_credito.producto
					p.existencias-=p_credito.cantidad
					p.save

					c=p_credito.producto.categorium
					c.ventas+=p_credito.cantidad*p_credito.producto.cantidad_galones
					c.save
				end

        format.html { redirect_to @factura_credito, notice: 'Factura credito was successfully created.' }
        format.json { render json: @factura_credito, status: :created, location: @factura_credito }
      else
        format.html { render action: "new" }
        format.json { render json: @factura_credito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factura_creditos/1
  # PUT /factura_creditos/1.json
  def update
    @factura_credito = FacturaCredito.find(params[:id])

    respond_to do |format|
      if @factura_credito.update_attributes(params[:factura_credito])
        format.html { redirect_to @factura_credito, notice: 'Factura credito was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @factura_credito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factura_creditos/1
  # DELETE /factura_creditos/1.json
  def destroy
    @factura_credito = FacturaCredito.find(params[:id])
    @factura_credito.destroy

    respond_to do |format|
      format.html { redirect_to factura_creditos_url }
      format.json { head :no_content }
    end
  end
  def agregarProductoCredito
		p_temp=ProductoFacturaCredito.new(params[:producto_factura_credito])
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
	def buscar_producto_credito

		@producto=buscarProducto params[:nombre],params[:descripcion],params[:categoria][0],params[:marca][0]

    respond_to do |format|
			format.js
		end
	end
end
