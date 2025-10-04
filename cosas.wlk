object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object arenaAGranel {
	var property peso = 1 
	method nivelPeligrosidad() = 1
}

object bumblebee {
	var estaTransformadoEnAuto = false

	method peso() = 800
	method nivelPeligrosidad() = if (estaTransformadoEnAuto) {15} else {30}

	method transformarEnAuto() {
		estaTransformadoEnAuto = true
	}

	method transformarEnRobot() {
		estaTransformadoEnAuto = false
	}
}