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
  const lista = []
  
  method moverFlechas(){
    lista.forEach({flecha => flecha.mover()})
  }
  method agregar(flecha){
    lista.add(flecha)
    game.addVisual(flecha)
  } 

  method remover(flecha){{
    lista.remove(flecha)
  }}
}
class Flecha {

    var property position 
    const direccion 
    
    method image(){
        return "flecha.png"
    }
    
    method mover(){
      self.position(direccion.siguientePosicion(self.position()))  
    }

    method inicializar(){
      game.onCollideDo(self, ({objeto => objeto.chocarCon(self)
                                self.destruir()}))  
    }
    
    method destruir(){
      flechas.remover(self)
      game.removeVisual(self)
      
    }
    method interactuarCon(pj){

    }

    method chocarCon(objeto){
      
    }
}
class ObjetoRecolectable{

  var property position 
  method image(){

  }
  method interactuarCon(pj){
    self.aplicarEfecto(pj)
  }
  method aplicarEfecto(pj){

  }
}

class PocionVida inherits ObjetoRecolectable{
  override method image(){
    return "pocion.png"
  }
  override method aplicarEfecto(pj){
    if(pj.noTieneVidaCompleta()){
      pj.incrementarEnUnoVidas()
      game.say(pj, "Recolecte una pocion de vida, incremento mi vida por que estaba baja")
    }
  }
}
class PocionVenenosa inherits ObjetoRecolectable{
  override method image(){
    return "pocion.png"
  }
  override method aplicarEfecto(pj){
    if(pj.cantDeVidas() > 1){
      pj.decrementarEnUnoVidas()
      game.say(pj, "Recolecte una pocion de venenosa, decrementara mi vida")
    }
  }
}
class Anillo inherits ObjetoRecolectable{
  const property puntos = 50 
  override method image(){
    return "joya.png"
  }
  override method aplicarEfecto(pj){
    game.say(pj, "Obtuve un anillo, incrementara mi puntuacion")
    pj.sumarPuntuacionDe(self)
  }
}
class Collar inherits ObjetoRecolectable{
  const property puntos = 100
  override method image(){
    return "joya.png"
  }
  override method aplicarEfecto(pj){
    game.say(pj, "Obtuve un collar, incrementara mi puntuacion")
    pj.sumarPuntuacionDe(self)
  }
}