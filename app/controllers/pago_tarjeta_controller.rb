class PagoTarjetaController < ApplicationController
  # GET /pago_tarjeta
  # GET /pago_tarjeta.json
  def index
    @pago_tarjeta = PagoTarjetum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pago_tarjeta }
    end
  end

  # GET /pago_tarjeta/1
  # GET /pago_tarjeta/1.json
  def show
    @pago_tarjetum = PagoTarjetum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pago_tarjetum }
    end
  end

  # GET /pago_tarjeta/new
  # GET /pago_tarjeta/new.json
  def new
    @pago_tarjetum = PagoTarjetum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pago_tarjetum }
    end
  end

  # GET /pago_tarjeta/1/edit
  def edit
    @pago_tarjetum = PagoTarjetum.find(params[:id])
  end

  # POST /pago_tarjeta
  # POST /pago_tarjeta.json
  def create
    @pago_tarjetum = PagoTarjetum.new(params[:pago_tarjetum])

    respond_to do |format|
      if @pago_tarjetum.save
        format.html { redirect_to @pago_tarjetum, notice: 'Pago tarjetum was successfully created.' }
        format.json { render json: @pago_tarjetum, status: :created, location: @pago_tarjetum }
      else
        format.html { render action: "new" }
        format.json { render json: @pago_tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pago_tarjeta/1
  # PUT /pago_tarjeta/1.json
  def update
    @pago_tarjetum = PagoTarjetum.find(params[:id])

    respond_to do |format|
      if @pago_tarjetum.update_attributes(params[:pago_tarjetum])
        format.html { redirect_to @pago_tarjetum, notice: 'Pago tarjetum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pago_tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_tarjeta/1
  # DELETE /pago_tarjeta/1.json
  def destroy
    @pago_tarjetum = PagoTarjetum.find(params[:id])
    @pago_tarjetum.destroy

    respond_to do |format|
      format.html { redirect_to pago_tarjeta_url }
      format.json { head :no_content }
    end
  end
end
