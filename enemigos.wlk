import martina.*
object trampa{
    var property position = game.at(3,1)
    //game.at(0.randomUpTo(game.width()).truncate(0),0.randomUpTo(game.height()).truncate(0))
    method lastimarAMartina(){
        martina.actualizarVidasDeMartina()
    } // trampa no entiende tiene un problema con los numeros
    method image(){
        return "extras-trampa.png"
    }
}
object enemigo1{
    var property position = game.at(2,2)
    var property direccion = derecha
    method image(){
        return "enemy-" + direccion.name() + ".png"
    }
    method cambiarDireccion(){
        direccion = [derecha,izquierda,abajo,arriba].anyOne()
    }
    method avanzar(){
        if(!self.estaEnBorde(direccion.siguientePosition(position)))
        self.position(direccion.siguientePosition(self.position()))
    }
    method estaEnBorde(positionDestino){
		return positionDestino.x() == -1 || positionDestino.x() == 15 || positionDestino.y() == -1 || positionDestino.y() == 15
	}
}
object enemigo2{
    var property position = game.at(3,3)
    var property direccion = arriba
    method image(){
        return "enemy-" + direccion.name() + ".png"
    }
    method perseguir(objetivo) {
        // idea: calculamos el vector entre los dos puntos, y eso nos va a dar la direccion en la que nos queremos mover, como calculamos el vector? en cada coordenada, hacemos la direccion de martina menos la direccion del enemigo
        //ahora que tenemos la direccion, calculamos la que distancia, que es hacer el cuadrado de las coordenadas calculadas en el paso anterior, sumanrlas y a eso, les aplicamos la raiz cuadrada. Como wollok cuando puse repeat o while, me ponia error, lo hice con recursion.
        // ahora que tenemos la direccion y la distancia, queda normalizarlo, que es a cada vector resultante del primer paso, dividirlo por la distancia calculada en el segundo paso.
        //asi logramos que el enemigo se mueva solo un paso, porque sino se "teletransportaria" a martina.
    const direccionEnX = objetivo.position().x() - self.position().x()
    const direccionEnY = objetivo.position().y() - self.position().y()

    const distancia = self.raizCuadrada((direccionEnX * direccionEnX) + (direccionEnY*direccionEnY))

    if (distancia > 0) {// osea si no estan en el mismo punto (distancia = 0), si estan en el mismo punto el enemigo se queda quieto (si, pense que podia ser negativa la distancia pero no es posible, solo puede ser 0 o mayor a cero)
        self.position(
        game.at(self.position().x() + (direccionEnX / distancia),self.position().y() + (direccionEnY / distancia))
        )
    }
}

method raizCuadradaIter(n, x, iter) {
    if (iter == 0) {
        return x
    } else {
        return self.raizCuadradaIter(n, (x + n / x) / 2, iter - 1)
    }
}
//calculo de raiz cuadrada con el metodo de newton raphson, que es aproximarse a la raiz cuadrada,se hacen 10 recursiones para que el calculo sea lo mas exacto posible.
method raizCuadrada(n) {
    return self.raizCuadradaIter(n, n / 2.0, 10)   // empezamos con n/2 y 10 pasos
}


}
object derecha {
    method name(){
        return "right"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x()+1,position.y())
    }
 
}
object izquierda {
    method name(){
        return "left"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x()-1,position.y())
    }
}
object abajo {
    method name() {
        return "up-down"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x(),position.y()-1)
    }
}
object arriba {
   method name() {
        return "up-down"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x(),position.y()+1)
    }
}

//primero comiteo lo de mi branch y syncronize
//voy al master y pull
//voy a mi branch y merge con master
//asi traigo lo de master para trabajar en mi branch

//para subir mi rama a master, hago merge desde master y eligo mi rama