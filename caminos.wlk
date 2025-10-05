object ruta9 {
    const nivelMaximoSoportado = 20
    method puedeTransportar(vehiculo) = vehiculo.puedeCircularEnRuta(nivelMaximoSoportado)
}

object caminosVecinales {
    var property pesoMaximoSoportado = 2000
    method puedeTransportar(vehiculo) = vehiculo.pesoTotal() <= pesoMaximoSoportado
}