module ApplicationHelper
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
end
