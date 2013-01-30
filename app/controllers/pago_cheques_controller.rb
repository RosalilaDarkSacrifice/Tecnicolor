class PagoChequesController < ApplicationController
  # GET /pago_cheques
  # GET /pago_cheques.json
  def index
    @pago_cheques = PagoCheque.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pago_cheques }
    end
  end

  # GET /pago_cheques/1
  # GET /pago_cheques/1.json
  def show
    @pago_cheque = PagoCheque.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pago_cheque }
    end
  end

  # GET /pago_cheques/new
  # GET /pago_cheques/new.json
  def new
    @pago_cheque = PagoCheque.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pago_cheque }
    end
  end

  # GET /pago_cheques/1/edit
  def edit
    @pago_cheque = PagoCheque.find(params[:id])
  end

  # POST /pago_cheques
  # POST /pago_cheques.json
  def create
    @pago_cheque = PagoCheque.new(params[:pago_cheque])

    respond_to do |format|
      if @pago_cheque.save
        format.html { redirect_to @pago_cheque, notice: 'Pago cheque was successfully created.' }
        format.json { render json: @pago_cheque, status: :created, location: @pago_cheque }
      else
        format.html { render action: "new" }
        format.json { render json: @pago_cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pago_cheques/1
  # PUT /pago_cheques/1.json
  def update
    @pago_cheque = PagoCheque.find(params[:id])

    respond_to do |format|
      if @pago_cheque.update_attributes(params[:pago_cheque])
        format.html { redirect_to @pago_cheque, notice: 'Pago cheque was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pago_cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_cheques/1
  # DELETE /pago_cheques/1.json
  def destroy
    @pago_cheque = PagoCheque.find(params[:id])
    @pago_cheque.destroy

    respond_to do |format|
      format.html { redirect_to pago_cheques_url }
      format.json { head :no_content }
    end
  end
end
