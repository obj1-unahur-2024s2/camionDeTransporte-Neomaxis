object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1
    method consecuencia() {}
}

object bumblebee {            //PARCIAL
    var estaRobot = false
    method peso() = 800
    method bultos() = 2
//  method peligrosidad() = if (estaRobot) 30 else 15   OTRA FORMA
    method peligrosidad() {
        if (estaRobot) 
            return 30
        else
            return 15
    }
    method transformar() {
        estaRobot = !estaRobot
    }
    method consecuencia() {
        estaRobot = true
    }        
}
/*
SIN USAR EL IF, ESTA ES LA MEJOR SOLUCION PARA LA PRACTICA DE POLIMORFISMOS

object bumblebee {
    var estado = auto
    method peso() = 800
    method peligrosidad() = estado.peligrosidad()
    method transformar(unEstado) {
        estado = unEstado
    }
}

object robot {
    method peligrosidad() = 30
}

object auto {
    method peligrosidad() = 15
}

*/

object paqueteDeLadrillos {
    var property cantidadDeLadrillos = 10
    method peso() = cantidadDeLadrillos * 2
    method peligrosidad() = 2
    method bultos() {
        if (cantidadDeLadrillos.between(0,100)) return 1
        if (cantidadDeLadrillos.between(101,300)) return 2
        return 3
    }
    method consecuencia() {
        cantidadDeLadrillos +=12
    }
}

object arenaAGranel {
    var property peso = 0
    method peligrosidad() = 1
    method bultos() = 1
    method consecuencia() {
        peso = 0.max(peso - 10)
    }
}

object bateriaAntiAerea {
    var tieneMisiles = true
    method peligrosidad() = if (tieneMisiles) 100 else 0
    method peso() = if (tieneMisiles) 300 else 200
    method cargar() {
        tieneMisiles = true
    }
    method descargar() {
        tieneMisiles = false
    }
    method bultos() {
        if (tieneMisiles) return 2
        else return 1
    }
    method consecuencia() {
        self.cargar()
    }
}

object contenedorPortuario {
    const cosas = []

    method agregarCosa(unaCosa) {
        cosas.add(unaCosa)
    }
    method peso() {
        return 100 + cosas.sum({c => c.peso()})
    }
    method peligrosidad() {
        if (cosas.esEmpty()) return 0 
        return cosas.max({c => c.peligrosidad()}).peligrosidad()
    }
    method consecuencia() {
        cosas.forEach({c=> c.consecuencia()})
    }
}

object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200
    method bultos() = 1
    method consecuencia() {
        peso += 12
    }
}

object embalajeDeSeguridad {
    var property cosaEnvuelta = cosaNulleable
    method bultos() = 2
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5 
    method consecuencia() {}
}

object cosaNulleable {
    method peso() = 0
    method peligrosidad() = 0
}