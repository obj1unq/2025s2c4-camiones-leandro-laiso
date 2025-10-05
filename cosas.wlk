object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method bultos() = 1

	method accidentarse() {

	}
}

object arenaAGranel {
	var property peso = 1 
	method nivelPeligrosidad() = 1
	method bultos() = 1

	method accidentarse() {
		peso += 20
	}
}

object bumblebee {
	var transformadoEnAuto = false

	method transformadoEnAuto() = transformadoEnAuto

	method peso() = 800
	method nivelPeligrosidad() = if (transformadoEnAuto) {15} else {30}
	method bultos() = 2

	method accidentarse() {
		if (transformadoEnAuto) {
			self.transformarEnRobot()
		} else {
			self.transformarEnAuto()
		}
	}

	method transformarEnAuto() {
		transformadoEnAuto = true
	}

	method transformarEnRobot() {
		transformadoEnAuto = false
	}
}

object paqueteLadrillos {
	const pesoPorLadrillo = 2
	var property cantLadrillos = 1
	const ladrillosQuePierdePorAccidente = 12

	method peso() = pesoPorLadrillo * cantLadrillos
	method nivelPeligrosidad() = 2

	method accidentarse() {
		cantLadrillos = 0.max(cantLadrillos - ladrillosQuePierdePorAccidente)
	}

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

	method estaCargada() = tieneMisiles

	method peso() = if (tieneMisiles) {300} else {200}
	method nivelPeligrosidad() = if (tieneMisiles) {100} else {0}
	method bultos() = if (tieneMisiles) {2} else {1}

	method accidentarse() {
		self.descargarMisiles()
	}

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

	method accidentarse() {
		peso += 15
	}
}

object contenedorPortuario {
	const cosas = #{}
	const pesoBase = 100
	const bultoPropio = 1

	method pesoCosas() = cosas.sum({c => c.peso()})

	method tieneCosas() = not cosas.isEmpty()

	method cosaMasPeligrosa() = cosas.max({c => c.nivelPeligrosidad()})

	method peso() = self.pesoCosas() + pesoBase

	method bultosDeCosas() = cosas.sum({c => c.bultos()})

	method bultos() = self.bultosDeCosas() + bultoPropio

	method nivelPeligrosidad() = if (not self.tieneCosas()) {0} else {self.cosaMasPeligrosa().nivelPeligrosidad()}

	method accidentarse() {
		cosas.forEach({c => c.accidentarse()})
	}

	method cargar(cosa) {
		cosas.add(cosa)
	}
}

object embalajeDeSeguridad {
	var cosaQueEnvuelve = null

	method peso() = cosaQueEnvuelve.peso()

	method nivelPeligrosidad() = cosaQueEnvuelve.nivelPeligrosidad() / 2

	method bultos() = 2

	method accidentarse() {

	}

	method envolver(cosa) {
		cosaQueEnvuelve = cosa
	}
}