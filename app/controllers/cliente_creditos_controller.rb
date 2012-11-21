class ClienteCreditosController < ApplicationController
  # GET /cliente_creditos
  # GET /cliente_creditos.json
  def index
    @cliente_creditos = ClienteCredito.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cliente_creditos }
    end
  end

  # GET /cliente_creditos/1
  # GET /cliente_creditos/1.json
  def show
    @cliente_credito = ClienteCredito.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cliente_credito }
    end
  end

  # GET /cliente_creditos/new
  # GET /cliente_creditos/new.json
  def new
    @cliente_credito = ClienteCredito.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cliente_credito }
    end
  end

  # GET /cliente_creditos/1/edit
  def edit
    @cliente_credito = ClienteCredito.find(params[:id])
  end

  # POST /cliente_creditos
  # POST /cliente_creditos.json
  def create
    @cliente_credito = ClienteCredito.new(params[:cliente_credito])

    respond_to do |format|
      if @cliente_credito.save
        format.html { redirect_to @cliente_credito, notice: 'Cliente credito was successfully created.' }
        format.json { render json: @cliente_credito, status: :created, location: @cliente_credito }
      else
        format.html { render action: "new" }
        format.json { render json: @cliente_credito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cliente_creditos/1
  # PUT /cliente_creditos/1.json
  def update
    @cliente_credito = ClienteCredito.find(params[:id])

    respond_to do |format|
      if @cliente_credito.update_attributes(params[:cliente_credito])
        format.html { redirect_to @cliente_credito, notice: 'Cliente credito was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cliente_credito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cliente_creditos/1
  # DELETE /cliente_creditos/1.json
  def destroy
    @cliente_credito = ClienteCredito.find(params[:id])
    @cliente_credito.destroy

    respond_to do |format|
      format.html { redirect_to cliente_creditos_url }
      format.json { head :no_content }
    end
  end
end
