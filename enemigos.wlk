import martina.*
import escenario.*
/*object enemigo1{
    var property nivel = nivel0
    var property position = game.at(2,2)
    var property direccion = derecha
    var property murosNivel = nivel.obtenerMuros()

    method image(){
        return "troll" + direccion.name() + ".png"
    }
    //randomizer de movimiento 
    method cambiarDireccion(){
        direccion = [derecha,izquierda,abajo,arriba].anyOne()
    }
    method avanzar(){
        if(!self.hayMuroEn(direccion.siguientePosition(position)))
        self.position(direccion.siguientePosition(self.position()))
    }

    method interactuarCon(pj){
        pj.decrementarEnUnoVidas()
    }
    method hayMuroEn(positionDestino){
      return(murosNivel.any({muro => muro.position() == positionDestino}))
    }
}*/
/*object enemigo2{
    var property nivel = nivel0
    var property position = game.at(3,3)
    var property direccion = arriba
    var property murosNivel = nivel.obtenerMuros()

    method image(){
        return "wendingo" + direccion.name() + ".png"
    }

    method perseguir(objetivo){
       movimientoPersecutor.perseguirConA(self, martina)

    }

    method interactuarCon(pj){
        pj.decrementarEnUnoVidas()
        }

}*/


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
//IMPLEMENTACION DE CLASES ENEMIGOS 
class PlantillaEnemigo{
    var property image  
    var property position
    var property nivel 
    var property murosNivel = nivel.obtenerMuros() 
    var property direccion = derecha 
    
    method interactuarCon(pj){
        pj.decrementarEnUnoVidas()
    }
    method hayMuroEn(positionDestino){
      return(murosNivel.any({muro => muro.position() == positionDestino}))
    }
}
class EnemigoPatrulla inherits PlantillaEnemigo{

     method cambiarDireccion(){
        direccion = [derecha,izquierda,abajo,arriba].anyOne()
    }
    method avanzar(){
        if(!self.hayMuroEn(direccion.siguientePosition(position)))
        self.position(direccion.siguientePosition(self.position()))
    }
}

class EnemigoPerseguidor inherits PlantillaEnemigo{

     method perseguir(objetivo){
       movimientoPersecutor.perseguirConA(self, martina)
    }
}
object movimientoPersecutor {
    var property nivel = nivel0
    var property murosNivel = nivel.obtenerMuros()

    method hayMuroEn(positionDestino){
      return(murosNivel.any({muro => muro.position() == positionDestino}))
    } 

    method perseguirConA(persecutor , perseguido){
        const posPr = persecutor.position()
        const posPs = perseguido.position()
        

        if(posPr.y() > posPs.y() && !self.hayMuroEn(posPr.down(1))){
            persecutor.position(posPr.down(1))
       }else if(posPr.y() < posPs.y() && !self.hayMuroEn(posPr.up(1))) {
            persecutor.position(posPr.up(1))
       }

       if(posPr.x() > posPs.x() && !self.hayMuroEn(posPr.left(1))){
            persecutor.position(posPr.left(1))
       }else if(posPr.x() < posPs.x()&& !self.hayMuroEn(posPr.right(1))) {
            persecutor.position(posPr.right(1))
       }
    }
}