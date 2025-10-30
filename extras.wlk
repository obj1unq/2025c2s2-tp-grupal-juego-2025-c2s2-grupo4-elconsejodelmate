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
  const property position  
  method image()
  method interactuarCon(pj)
}
class PocionVida inherits ObjetoRecolectable{
  override method image(){
    return "pocion.png"
  }
  override method interactuarCon(pj){
    if(pj.cantDeVidas() == 3){
      pj.añadirAlInventario(self)
      game.say(pj, "obtuve " + self)
    }else{
      pj.incrementarEnUnoVidas()
      game.say(pj, "tengo " + pj.cantDeVidas() + "vidas")
    }
  }
}
class PocionVenenosa inherits ObjetoRecolectable{
  override method image(){
    return "pocion-venenosa.png"
  }
  override method interactuarCon(pj){
    pj.decrementarEnUnoVidas()
    game.say(pj, "tengo " + pj.cantDeVidas() + "vidas")
  }
}
// a implementar mas tarde, solo para molestar jeje 
class PocionInvisibilidad inherits ObjetoRecolectable{
  override method image(){
    return "pocion-invisibilidad.png"
  }
 /* override method interactuarCon(pj){
    game.schedule(5000, game.removeVisual(pj))
  }*/ 
}
class Llave inherits ObjetoRecolectable{
  override method image(){
    return "llave.png"
  }
  override method interactuarCon(pj){
    pj.añadirAlInventario(self)
    game.removeVisual(self)
    game.say(pj, "obtuve " + self)
  }
}
class Joya inherits ObjetoRecolectable{
  method puntos()
  override method interactuarCon(pj){
    pj.sumarPuntuacionDe(self)
    game.removeVisual(self)
    game.say(pj, "obtuve " + self)
  }
}
class Anillo inherits Joya{
  override method puntos(){
    return 50 
  }
  override method image(){
    return "anillo.png"
  }
}
class Collar inherits Joya{
  override method puntos(){
    return 100 
  }
  override method image(){
    return "collar.png"
  }
}