object almacen {
    const property cosas = []

    method estaCargado(cosa) = cosas.contains(cosa)

    method almacenar(cosasNuevas) {
        cosas.addAll(cosasNuevas)
    }

	method cargar(cosa) {
		cosas.add(cosa)
	}
}