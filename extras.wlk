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
      //pj.añadirAlInventario(self)
      game.say(pj, "Obtuve una pocion de vida que ira a mi inventario")
    }else{
      pj.incrementarEnUnoVidas()
      game.say(pj, "Recolecte una pocion de vida, incremento mi vida por que estaba baja")
    }
  }
}
class PocionVenenosa inherits ObjetoRecolectable{
  override method image(){
    return "pocion-venenosa.png"
  }
  override method interactuarCon(pj){
    
    if(pj.cantDeVidas() == 1){
      //pj.añadirAlInventario(self)
      game.say(pj, "Obtuve una pocion venenosa, quedara en mi inventario ")

    }else{
      pj.decrementarEnUnoVidas()
      game.say(pj, "Recolecte una pocion de venenosa, decrementara mi vida")
    }
  }
}
/* a implementar mas tarde, solo para molestar jeje 
class PocionInvisibilidad inherits ObjetoRecolectable{
  override method image(){
    return "pocion-invisibilidad.png"
  }
   override method interactuarCon(pj){
    game.schedule(5000, game.removeVisual(pj))
  }
}*/
// class Llave inherits ObjetoRecolectable{
//   override method image(){
//     return "llave.png"
//   }
//   override method interactuarCon(pj){
//     game.say(pj, "Obtuve una llave, busquemos que puerta abre")
//     //pj.añadirAlInventario(self)
//     //game.removeVisual(self)
    
//   }
//}
class Joya inherits ObjetoRecolectable{
  method puntos()
  override method interactuarCon(pj){
    game.say(pj, "Obtuve una joya, incrementara mi puntuacion")
    pj.sumarPuntuacionDe(self)
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
/*agregar o modificar templeate*/