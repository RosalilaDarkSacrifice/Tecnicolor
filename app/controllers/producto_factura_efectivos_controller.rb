class ProductoFacturaEfectivosController < ApplicationController
  # GET /producto_factura_efectivos
  # GET /producto_factura_efectivos.json
  def index
    @producto_factura_efectivos = ProductoFacturaEfectivo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @producto_factura_efectivos }
    end
  end

  # GET /producto_factura_efectivos/1
  # GET /producto_factura_efectivos/1.json
  def show
    @producto_factura_efectivo = ProductoFacturaEfectivo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @producto_factura_efectivo }
    end
  end

  # GET /producto_factura_efectivos/new
  # GET /producto_factura_efectivos/new.json
  def new
    @producto_factura_efectivo = ProductoFacturaEfectivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto_factura_efectivo }
    end
  end

  # GET /producto_factura_efectivos/1/edit
  def edit
    @producto_factura_efectivo = ProductoFacturaEfectivo.find(params[:id])
  end

  # POST /producto_factura_efectivos
  # POST /producto_factura_efectivos.json
  def create
    @producto_factura_efectivo = ProductoFacturaEfectivo.new(params[:producto_factura_efectivo])

    respond_to do |format|
      if @producto_factura_efectivo.save
        format.html { redirect_to @producto_factura_efectivo, notice: 'Producto factura efectivo was successfully created.' }
        format.json { render json: @producto_factura_efectivo, status: :created, location: @producto_factura_efectivo }
      else
        format.html { render action: "new" }
        format.json { render json: @producto_factura_efectivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /producto_factura_efectivos/1
  # PUT /producto_factura_efectivos/1.json
  def update
    @producto_factura_efectivo = ProductoFacturaEfectivo.find(params[:id])

    respond_to do |format|
      if @producto_factura_efectivo.update_attributes(params[:producto_factura_efectivo])
        format.html { redirect_to @producto_factura_efectivo, notice: 'Producto factura efectivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @producto_factura_efectivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producto_factura_efectivos/1
  # DELETE /producto_factura_efectivos/1.json
  def destroy
    @producto_factura_efectivo = ProductoFacturaEfectivo.find(params[:id])
    @producto_factura_efectivo.destroy

    respond_to do |format|
      format.html { redirect_to producto_factura_efectivos_url }
      format.json { head :no_content }
    end
  end

end
