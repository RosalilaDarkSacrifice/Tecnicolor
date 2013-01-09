class EntradaProductosController < ApplicationController
  # GET /entrada_productos
  # GET /entrada_productos.json
  def index
    @entrada_productos = EntradaProducto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entrada_productos }
    end
  end

  # GET /entrada_productos/1
  # GET /entrada_productos/1.json
  def show
    @entrada_producto = EntradaProducto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entrada_producto }
    end
  end

  # GET /entrada_productos/new
  # GET /entrada_productos/new.json
  def new
    @entrada_producto = EntradaProducto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entrada_producto }
    end
  end

  # GET /entrada_productos/1/edit
  def edit
    @entrada_producto = EntradaProducto.find(params[:id])
  end

  # POST /entrada_productos
  # POST /entrada_productos.json
  def create
    @entrada_producto = EntradaProducto.new(params[:entrada_producto])

    respond_to do |format|
      if @entrada_producto.save

				p=@entrada_producto.producto
				p.existencias+=@entrada_producto.cantidad
				p.save

				c=@entrada_producto.producto.categorium
				c.entradas+=@entrada_producto.cantidad*@entrada_producto.producto.cantidad_galones
				c.save
				

        format.html { redirect_to @entrada_producto, notice: 'Entrada producto was successfully created.' }
        format.json { render json: @entrada_producto, status: :created, location: @entrada_producto }
      else
        format.html { render action: "new" }
        format.json { render json: @entrada_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entrada_productos/1
  # PUT /entrada_productos/1.json
  def update
    @entrada_producto = EntradaProducto.find(params[:id])

    respond_to do |format|
      if @entrada_producto.update_attributes(params[:entrada_producto])
        format.html { redirect_to @entrada_producto, notice: 'Entrada producto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entrada_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrada_productos/1
  # DELETE /entrada_productos/1.json
  def destroy
    @entrada_producto = EntradaProducto.find(params[:id])
    @entrada_producto.destroy

    respond_to do |format|
      format.html { redirect_to entrada_productos_url }
      format.json { head :no_content }
    end
  end

	def buscar_producto_entrada

		@producto=buscarProducto params[:nombre],params[:descripcion],params[:categoria][0],params[:marca][0]

    respond_to do |format|
			format.js
		end
	end
end
