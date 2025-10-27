import enemigos.*
import martina.*


const pocion1 = new PocionVida(position = game.at(4,6))
class PocionVida{
    var property position = game.origin()
    var property image = "pocion.png"


    method interactuarCon(pj){
        pj.incrementarEnUnoVidas()
        game.removeVisual(self)
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