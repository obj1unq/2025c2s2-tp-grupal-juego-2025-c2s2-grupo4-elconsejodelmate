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
    method perseguir(objetivo) {
       //movimientoPersecutor.perseguirConA(self, martina)
       /*Bueno lo de arriba llama al objeto que ejecuta el method perseguirConA(a,b) hace exactamente lo de abajo, lo de abajo deberia borrarlo
       pero por si lo quieren probar, esto de aca abajo permite al wendingo moverse en diagonales, si se preguntan por que este si y el otro no, no tengo la
       mas palida idea pero bueno, el del objeto movimientoPersecutor no tiene diagonal y el de este method perseguir si tiene diagonales temas para el
       futuro bye */
       const direccionY = objetivo.position().y()
       const direccionX = objetivo.position().x()

       if(direccionY > self.position().y() && !self.hayMuroEn(self.position().up(1))){
            self.position(self.position().up(1))
       }else if(direccionY < self.position().y() && !self.hayMuroEn(self.position().down(1))) {
            self.position(self.position().down(1))
       }

       if(direccionX > self.position().x() && !self.hayMuroEn(self.position().right(1))){
            self.position(self.position().right(1))
       }else if(direccionX < self.position().x() && !self.hayMuroEn(self.position().left(1))) {
            self.position(self.position().left(1))
       }
    }

    method interactuarCon(martina){
        martina.decrementarEnUnoVidasDeMartina()
        }

}

object movimientoPersecutor {
    method hayMuroEn(positionDestino){
      return(escenario.muros.any({muro => muro.position() == positionDestino}))
    } 
    method esMayorQue(direccion1, direccion2){
        return direccion1 > direccion2
    }
    method esMenorQue(direccion1, direccion2){
        return direccion1 < direccion2
    }
    method perseguirConA(persecutor , perseguido){
        const posPr = persecutor.position()
        const posPs = perseguido.position()

        if(self.esMayorQue(posPr.y() , posPs.y()) && !self.hayMuroEn(posPr.down(1))){
            persecutor.position(posPr.down(1))
       }else if(self.esMenorQue(posPr.y() , posPs.y()) && !self.hayMuroEn(posPr.up(1))) {
            persecutor.position(posPr.up(1))
       }

       if(self.esMayorQue(posPr.x() , posPs.x()) && !self.hayMuroEn(posPr.left(1))){
            persecutor.position(posPr.left(1))
       }else if(self.esMenorQue(posPr.x() , posPs.x()) && !self.hayMuroEn(posPr.right(1))) {
            persecutor.position(posPr.right(1))
       }
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
