import cosas.*

object camion {
	const property cosas = #{}
	
	method estaCargada(cosa) = cosas.contains(cosa)

	method validarCargar(cosa) {
		if (self.estaCargada(cosa)) {
			self.error(cosa.toString() + " ya está cargado en el camión. No se puede cargar")
		}
	}

	method validarDescargar(cosa) {
		if (not self.estaCargada(cosa)) {
			self.error(cosa.toString() + " no está cargado en el camión. No se puede descargar.")
		}
	}

	method cargar(cosa) {
		self.validarCargar(cosa)
		cosas.add(cosa)
	}

	method descargar(cosa) {
		self.validarDescargar(cosa)
		cosas.remove(cosa)
	}
}
