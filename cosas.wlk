object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object arenaAGranel {
	var property peso = 1 
	method nivelPeligrosidad() = 1
}

object bumblebee {
	var transformadoEnAuto = false

	method peso() = 800
	method nivelPeligrosidad() = if (transformadoEnAuto) {15} else {30}

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
}

object bateriaAntiaerea {
	var tieneMisiles = false

	method peso() = if (tieneMisiles) {300} else {200}
	method nivelPeligrosidad() = if (tieneMisiles) {100} else {0}

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
}