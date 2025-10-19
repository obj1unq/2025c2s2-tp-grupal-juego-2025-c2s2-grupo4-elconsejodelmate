import enemigos.*
import martina.*
import escenario.*
object cofre{
  var property position = game.at(6,9)
  var property image = "cofre.png"  
  var property contenido = [arco]
  //se modelaran WKO para los estados del cofre 
 
  method interactuarCon(personaje){
    self.image("cofre-abierto.png") 
    martina.mochila().add(arco)
    self.contenido().clear()
  }
}
object arco{
    method dispararFlechas(){
    if (!martina.mochila.null()){
        game.addVisual(Flecha)
      game.onTick(800, "DispararFlechasConArcoEquipado", {new Flecha().arrojarse()})
    }
  }

}
class Flecha {
    var property position = martina.position()
    var property direccion = martina.estadoDeMartina()
    var property murosNivel = nivel1.obtenerMuros()
    var property obstaculosNivel =nivel1.obtenerObstaculos()
    method image(){
        return "flecha.png"
    }
    method arrojarse(){
        if(!self.hayMuroEn(direccion.siguientePosition(position))
        || !self.hayObstaculoEn(direccion.siguientePosition(position))){
          self.position(direccion.siguientePosition(self.position()))  
        } else {
            game.removeVisual(Flecha)
        }
        
    }
    
    method hayMuroEn(positionDestino){
      return(murosNivel.any({muro => muro.position() == positionDestino}))
    }
    method hayObstaculoEn(positionDestino){
      return(obstaculosNivel.any({obstaculo => obstaculo.position() == positionDestino}))
    }

    /* method nombre(direccionDada){
        if (direccionDada == "up"){
        return arriba}
        else if (direccionDada == "down"){
            return abajo 
        } else if (direccionDada == "right"){
            return derecha
        } else {return izquierda}
    }*/
}

/*object pocionVida {
    const personaje = martina
    var property position = game.at(8,8)
    method image(){
        return "pocion.png" //es de prueba
    }
    method interactuarConMartina(){
        personaje.incrementarEnUnoVidasDeMartina()
        game.removeVisual(self)
    }
    
    method interactuarCon(pj){
        pj.incrementarEnUnoVidasDeMartina()
        
    }
    
}
*/

const pocion1 = new PocionVida(position = game.at(4,6))
class PocionVida{
    var property position = game.origin()
    var property image = "pocion.png"


    method interactuarCon(pj){
        pj.incrementarEnUnoVidas()
        game.removeVisual(self)
    }
}