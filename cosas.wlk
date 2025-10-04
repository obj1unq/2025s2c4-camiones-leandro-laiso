object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method bultos() = 1
}

object arenaAGranel {
	var property peso = 1 
	method nivelPeligrosidad() = 1
	method bultos() = 1
}

object bumblebee {
	var transformadoEnAuto = false

	method peso() = 800
	method nivelPeligrosidad() = if (transformadoEnAuto) {15} else {30}
	method bultos() = 2

	method transformarEnAuto() {
		transformadoEnAuto = true
	}

	method transformarEnRobot() {
		transformadoEnAuto = false
	}
}

object paqueteLadrillos {
	const pesoPorLadrillo = 2
	var cantLadrillos = 1

	method cantLadrillos(_cantLadrillos) {
		cantLadrillos = _cantLadrillos
	}

	method peso() = pesoPorLadrillo * cantLadrillos
	method nivelPeligrosidad() = 2

	method bultos() {
		return
			if (cantLadrillos <= 100) {
				1
			} else if (cantLadrillos <= 300) {
				2
			} else {
				3
			}
	}
}

object bateriaAntiaerea {
	var tieneMisiles = false

	method peso() = if (tieneMisiles) {300} else {200}
	method nivelPeligrosidad() = if (tieneMisiles) {100} else {0}
	method bultos() = if (tieneMisiles) {2} else {1}

	method cargarMisiles() {
		tieneMisiles = true
	}

	method descargarMisiles() {
		tieneMisiles = false
	}
}

object residuosRadiactivos {
	var property peso = 1
	method nivelPeligrosidad() = 200
	method bultos() = 1
}

object contenedorPortuario {
	const cosas = #{}
	const pesoBase = 100
	const bultoPropio = 1

	method estaCargado(cosa) = cosas.contains(cosa)

	method pesoCosas() = cosas.sum({c => c.peso()})

	method tieneCosas() = not cosas.isEmpty()

	method cosaMasPeligrosa() = cosas.max({c => c.nivelPeligrosidad()})

	method peso() = self.pesoCosas() + pesoBase

	method bultosDeCosas() = cosas.sum({c => c.bultos()})

	method bultos() = self.bultosDeCosas() + bultoPropio

	method nivelPeligrosidad() = if (not self.tieneCosas()) {0} else {self.cosaMasPeligrosa().nivelPeligrosidad()}

	method validarCargar(cosa) {
		if (self.estaCargado(cosa)) {
			self.error(cosa.toString() + " ya está cargado en el contenedor. No se puede cargar")
		}
	}

	method validarDescargar(cosa) {
		if (not self.estaCargado(cosa)) {
			self.error(cosa.toString() + " no está cargado en el contenedor. No se puede descargar.")
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

object embalajeDeSeguridad {
	var cosaQueEnvuelve = null

	method peso() = cosaQueEnvuelve.peso()

	method nivelPeligrosidad() = cosaQueEnvuelve.nivelPeligrosidad() / 2

	method bultos() = 2

	method envolver(cosa) {
		cosaQueEnvuelve = cosa
	}
}