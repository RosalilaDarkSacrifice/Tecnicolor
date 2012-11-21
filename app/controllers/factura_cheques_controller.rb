class FacturaChequesController < ApplicationController
  # GET /factura_cheques
  # GET /factura_cheques.json
  def index
    @factura_cheques = FacturaCheque.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factura_cheques }
    end
  end

  # GET /factura_cheques/1
  # GET /factura_cheques/1.json
  def show
    @factura_cheque = FacturaCheque.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factura_cheque }
    end
  end

  # GET /factura_cheques/new
  # GET /factura_cheques/new.json
  def new
    @factura_cheque = FacturaCheque.new

		$producto_global=[]
		$total=0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factura_cheque }
    end
  end

  # GET /factura_cheques/1/edit
  def edit
    @factura_cheque = FacturaCheque.find(params[:id])
  end

  # POST /factura_cheques
  # POST /factura_cheques.json
  def create
    @factura_cheque = FacturaCheque.new(params[:factura_cheque])
    @factura_cheque.numero=sigNumFactura

    respond_to do |format|
      if @factura_cheque.save

				$producto_global.each do |p_cheque|
					p_cheque.factura_cheque_id=@factura_cheque.id
				  p_cheque.save

					p=p_cheque.producto
					p.existencias-=p_cheque.cantidad
					p.save
				end

        format.html { redirect_to @factura_cheque, notice: 'Factura cheque was successfully created.' }
        format.json { render json: @factura_cheque, status: :created, location: @factura_cheque }
      else
        format.html { render action: "new" }
        format.json { render json: @factura_cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factura_cheques/1
  # PUT /factura_cheques/1.json
  def update
    @factura_cheque = FacturaCheque.find(params[:id])

    respond_to do |format|
      if @factura_cheque.update_attributes(params[:factura_cheque])
        format.html { redirect_to @factura_cheque, notice: 'Factura cheque was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @factura_cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factura_cheques/1
  # DELETE /factura_cheques/1.json
  def destroy
    @factura_cheque = FacturaCheque.find(params[:id])
    @factura_cheque.destroy

    respond_to do |format|
      format.html { redirect_to factura_cheques_url }
      format.json { head :no_content }
    end
  end

  def agregarProductoCheque
		p_temp=ProductoFacturaCheque.new(params[:producto_factura_cheque])
  	$producto_global.push(p_temp)
		$total+=((p_temp.cantidad*100.0).round*(p_temp.precio*100.0).round)/10000.0
    respond_to do |format|
			format.js
		end
  end

	def buscar_producto_cheque

		@producto=buscarProducto params[:nombre],params[:descripcion],params[:categoria][0],params[:marca][0]

    respond_to do |format|
			format.js
		end
	end
end
