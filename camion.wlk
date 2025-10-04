import cosas.*

object camion {
	const property cosas = #{}
	
	method estaCargado(cosa) = cosas.contains(cosa)

	method todoPesoPar() = cosas.all({c => c.peso().even()})

	method hayAlgoQuePesa(peso) = cosas.any({c => c.peso() == peso})

	method validarCargar(cosa) {
		if (self.estaCargado(cosa)) {
			self.error(cosa.toString() + " ya está cargado en el camión. No se puede cargar")
		}
	}

	method validarDescargar(cosa) {
		if (not self.estaCargado(cosa)) {
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
