import enemigos.*
import martina.*
import escenario.*

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
      self.position(direccion.siguientePosicion(self.position()))    
      game.onCollideDo(self, ({objeto => objeto.chocarCon(self)}))     
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
  method interactuarCon(pj){

  }
}

class ObjetoRecolectable{
  method image()
  method position()
  method interactuarCon(pj)
}
class PocionVida inherits ObjetoRecolectable{
  override method image(){
    return "pocion.png"
  }
}