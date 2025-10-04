import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	const pesoMaximoAceptable = 2500
	
	method tieneCosas() = not cosas.isEmpty()

	method estaCargado(cosa) = cosas.contains(cosa)

	method todoPesoPar() = cosas.all({c => c.peso().even()})

	method hayAlgoQuePesa(peso) = cosas.any({c => c.peso() == peso})

	method pesoTotalCarga() = cosas.sum({c => c.peso()})

	method pesoTotal() = tara + self.pesoTotalCarga()

	method estaExcedidoDePeso() = self.pesoTotal() > pesoMaximoAceptable

	method hayAlgoDeNivel(nivel) = cosas.any({c => c.nivelPeligrosidad() == nivel})

	method cosaDeNivel(nivel) {
		return
			if (self.hayAlgoDeNivel(nivel)) {
				cosas.find({c => c.nivelPeligrosidad() == nivel})
			} else {
				self.error("No hay nada cargado de nivel " + nivel.toString())
			}
	}

	method cosasQueSuperanNivel(nivel) = cosas.filter({c => c.nivelPeligrosidad() > nivel})

	method cosasMasPeligrosasQue(cosa) = self.cosasQueSuperanNivel(cosa.nivelPeligrosidad())

	method puedeCircularEnRuta(nivel) = not self.estaExcedidoDePeso() && self.cosasQueSuperanNivel(nivel).isEmpty()

	method tieneAlgoQuePesaEntre(minimo, maximo) = cosas.any({c =>  c.peso() >= minimo && c.peso() <= maximo})

	method cosaMasPesada() {
		return
			if (not self.tieneCosas()) {
				self.error("No hay nada cargado en el camión")
			} else {
				cosas.max({c => c.peso()})
			}
	}

	method pesos() = cosas.map({c => c.peso()})

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
