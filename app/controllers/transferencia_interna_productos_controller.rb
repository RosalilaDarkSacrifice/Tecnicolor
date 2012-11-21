class TransferenciaInternaProductosController < ApplicationController
  # GET /transferencia_interna_productos
  # GET /transferencia_interna_productos.json
  def index
    @transferencia_interna_productos = TransferenciaInternaProducto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transferencia_interna_productos }
    end
  end

  # GET /transferencia_interna_productos/1
  # GET /transferencia_interna_productos/1.json
  def show
    @transferencia_interna_producto = TransferenciaInternaProducto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transferencia_interna_producto }
    end
  end

  # GET /transferencia_interna_productos/new
  # GET /transferencia_interna_productos/new.json
  def new
    @transferencia_interna_producto = TransferenciaInternaProducto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transferencia_interna_producto }
    end
  end

  # GET /transferencia_interna_productos/1/edit
  def edit
    @transferencia_interna_producto = TransferenciaInternaProducto.find(params[:id])
  end

  # POST /transferencia_interna_productos
  # POST /transferencia_interna_productos.json
  def create
    @transferencia_interna_producto = TransferenciaInternaProducto.new(params[:transferencia_interna_producto])

    respond_to do |format|

			#poner galones
@transferencia_interna_producto.cantidad_galones=@transferencia_interna_producto.producto.cantidad_galones*@transferencia_interna_producto.cantidad

      if @transferencia_interna_producto.save

				p=@transferencia_interna_producto.producto
				p.existencias-=@transferencia_interna_producto.cantidad
				p.save

        format.html { redirect_to @transferencia_interna_producto, notice: 'Transferencia interna producto was successfully created.' }
        format.json { render json: @transferencia_interna_producto, status: :created, location: @transferencia_interna_producto }
      else
        format.html { render action: "new" }
        format.json { render json: @transferencia_interna_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transferencia_interna_productos/1
  # PUT /transferencia_interna_productos/1.json
  def update
    @transferencia_interna_producto = TransferenciaInternaProducto.find(params[:id])

    respond_to do |format|
      if @transferencia_interna_producto.update_attributes(params[:transferencia_interna_producto])
        format.html { redirect_to @transferencia_interna_producto, notice: 'Transferencia interna producto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transferencia_interna_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transferencia_interna_productos/1
  # DELETE /transferencia_interna_productos/1.json
  def destroy
    @transferencia_interna_producto = TransferenciaInternaProducto.find(params[:id])
    @transferencia_interna_producto.destroy

    respond_to do |format|
      format.html { redirect_to transferencia_interna_productos_url }
      format.json { head :no_content }
    end
  end

	def buscar_producto_transferencia

		@producto=buscarProducto params[:nombre],params[:descripcion],params[:categoria][0],params[:marca][0]

    respond_to do |format|
			format.js
		end
	end

end
