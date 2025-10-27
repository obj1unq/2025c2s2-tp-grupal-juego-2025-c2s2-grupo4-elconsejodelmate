import enemigos.*
import martina.*
import escenario.*

const pocion1 = new PocionVida(position = game.at(4,6))
class PocionVida{
    var property position = game.origin()
    var property image = "pocion.png"


    method interactuarCon(pj){
        pj.incrementarEnUnoVidas()
        game.removeVisual(self)
    }
}

object flechas{
  const property lista= []
  method moverFlechas(){
    lista.forEach({flecha => flecha.arrojarse()})

  }
  method agregar(flecha){
    lista.add(flecha)
    game.addVisual(flecha)
  } 
}
class Flecha {
    var property nivel = nivel0
    var property position 
    var property direccion 
    var property murosNivel = nivel.obtenerMuros()
    var property obstaculosNivel = nivel.obtenerObstaculos()
    method image(){
        return "flecha.png"
    }
    method arrojarse(){
        //self.puedeMoverseA(direccion.siguientePosicion(self.position()))
          self.position(direccion.siguientePosicion(self.position()))  
      //  } else {
       //     game.removeVisual(Flecha)
     //   }
        
    }
    
    method hayMuroEn(positionDestino){
      return(murosNivel.any({muro => muro.position() == positionDestino}))
    }
    method hayObstaculoEn(positionDestino){
      return(obstaculosNivel.any({obstaculo => obstaculo.position() == positionDestino}))
    }
    method puedeMoverseA(nuevaDireccion){
      return !self.hayMuroEn(nuevaDireccion) && !self.hayObstaculoEn(nuevaDireccion)
  }
}





//implementacion de randomizer para las posiciones 
object randomizer{

  method position(){
    return game.at((0..game.width() - 2).anyOne(), (0.. game.height() - 2).anyOne())
  }
  
  method emptyPosition(){
    const position = self.position()
    if(game.getObjectsIn(position).isEmpty()){
      return position 
    }else{
      return self.emptyPosition()
    }
  }
}
