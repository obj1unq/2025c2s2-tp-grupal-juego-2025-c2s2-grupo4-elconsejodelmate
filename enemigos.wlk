import martina.*
object enemigo1{
    var property position = game.at(2,2)
    var property direccion = derecha
    method image(){
        return "troll" + direccion.name() + ".png"
    }
    //randomizer de movimiento 
    method cambiarDireccion(){
        direccion = [derecha,izquierda,abajo,arriba].anyOne()
         //direccion = [izquierda].anyOne()
    }
    method avanzar(){
        if(!self.hayMuroEn(direccion.siguientePosition(position)))
        self.position(direccion.siguientePosition(self.position()))
    }

    method interactuarCon(pj){
        pj.decrementarEnUnoVidasDeMartina()
    }
    method hayMuroEn(positionDestino){
      return(escenario.muros.any({muro => muro.position() == positionDestino}))
    }
}
object enemigo2{
    var property position = game.at(3,3)
    var property direccion = arriba
    method image(){
        return "wendingo" + direccion.name() + ".png"
    }
    method hayMuroEn(positionDestino){
      return(escenario.muros.any({muro => muro.position() == positionDestino}))
    }
   /* method perseguir(objetivo) {
        // idea: calculamos el vector entre los dos puntos, y eso nos va a dar la direccion en la que nos queremos mover, como calculamos el vector? en cada coordenada, hacemos la direccion de martina menos la direccion del enemigo
        //ahora que tenemos la direccion, calculamos la que distancia, que es hacer el cuadrado de las coordenadas calculadas en el paso anterior, sumanrlas y a eso, les aplicamos la raiz cuadrada. Como wollok cuando puse repeat o while, me ponia error, lo hice con recursion.
        // ahora que tenemos la direccion y la distancia, queda normalizarlo, que es a cada vector resultante del primer paso, dividirlo por la distancia calculada en el segundo paso.
        //asi logramos que el enemigo se mueva solo un paso, porque sino se "teletransportaria" a martina.
    const direccionEnX = objetivo.position().x() - self.position().x()
    const direccionEnY = objetivo.position().y() - self.position().y()

    const distancia = (direccionEnX.square() + direccionEnY.square()).squareRoot()

    const posicionSiguiente = game.at(direccionEnX.div(distancia), direccionEnY.div(distancia))
    
    if (distancia > 0 && !self.hayMuroEn(posicionSiguiente)) {// osea si no estan en el mismo punto (distancia = 0), si estan en el mismo punto el enemigo se queda quieto (si, pense que podia ser negativa la distancia pero no es posible, solo puede ser 0 o mayor a cero)
        self.position(posicionSiguiente)
        }
    
    }*/
    //Pensamos que se puede simplificar usando distance()
    method perseguir(objetivo){
        const distanciaX = objetivo.position().x() - self.position().x()
        const distanciaY = objetivo.position().y() - self.position().y()

        if(distanciaX > distanciaY){
            self.moverseEnX(distanciaX)
        }else{
            self.moverseEnY(distanciaY)
        }
    } 
    method moverseEnX(_distancia){
        if(_distancia > 0){
            self.position(self.position().right(1))
        }else{
            self.position(self.position().left(1))
        }
    }
    method moverseEnY(_distancia){
        if(_distancia > 0){
            self.position(self.position().up(1))
        }else{
            self.position(self.position().down(1))
        }
    }


method interactuarCon(pj){
    pj.decrementarEnUnoVidasDeMartina()
    }

}
object derecha {
    method name(){
        return ""
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
        return ""
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
        return ""
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
        return "-derecha"
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
//para subir mi rama a master, hago merge desde master y eligo mi rama*/

//IMPLEMENTACION DE CLASES ENEMIGOS 
/*
    Se puede utilizar para otro enemigo, que te persiga solo cuando te ve
    (el personaje debe estar en el eje x o y del enemigo)

    method perseguir(objetivo){
        const posXObj = objetivo.position().x() - self.position().x()
        const posYObj = objetivo.position().y() - self.position().y()

        const distancia = objetivo.position().distance(self.position())
        const posicionSiguiente = game.at(self.position().x() + posXObj.div(distancia), self.position().y() + posYObj.div(distancia))

        if(distancia > 0 && (self.hayMuroEn(posicionSiguiente)).negate()){
            self.position(posicionSiguiente)
        }
    }*/
//pensar movimiento del wendingo como cuadrantes 