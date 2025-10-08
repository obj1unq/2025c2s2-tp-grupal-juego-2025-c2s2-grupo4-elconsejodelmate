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
    method perseguir(objetivo){
        const posXObj = objetivo.position().x() - self.position().x()
        const posYObj = objetivo.position().y() - self.position().y()

        const distancia = objetivo.position().distance(self.position()).squareRoot()
    
        const posicionSiguiente = game.at(self.position().x() + posXObj.div(posXObj.abs()), self.position().y() + posYObj.div(posYObj.abs()))
        
        if(distancia > 0 && (self.hayMuroEn(posicionSiguiente)).negate()){
            self.position(posicionSiguiente)
        }
    }

    method validarNumero(numero1 , numero2){
        if(numero1 - numero2 == 0){
            return 0
        } else{
            return 
        }
    }

    method hayMuroEn(positionDestino){
      return(escenario.muros.any({muro => muro.position() == positionDestino}))
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
