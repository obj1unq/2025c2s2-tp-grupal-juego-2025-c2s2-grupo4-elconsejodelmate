import martina.*
import escenario.*

class PlantillaEnemigo{
    var property image 
    var property position
    var property nivel = nivelActual
    var property murosNivel = nivel.listaDeObstaculos() 
    var property direccion = derechaEnemigo
    
    method interactuarCon(pj){
        pj.decrementarEnUnoVidas()
    }
    method hayMuroEn(positionDestino){
      return(murosNivel.any({muro => muro.position() == positionDestino}))
    }
    method chocarCon(objeto) {
      game.removeVisual(self)
      game.removeVisual(objeto)
    }
}
class EnemigoPatrulla inherits PlantillaEnemigo{

     method cambiarDireccion(){
        direccion = [derechaEnemigo,izquierdaEnemigo,abajoEnemigo,arribaEnemigo].anyOne()
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
    var property nivel = nivelActual
    var property murosNivel = nivel.muros()

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

object derechaEnemigo {
    method name(){
        return "-derecha"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x()+1,position.y())
    }
 
}
object izquierdaEnemigo {
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
object abajoEnemigo {
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
object arribaEnemigo {
   method name() {
        return ""
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x(),position.y()+1)
    }
}

