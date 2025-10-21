import enemigos.*
import martina.*
import escenario.*
object cofre{
  var property position = game.at(6,9)
  var property image = "cofre.png"  
  var property contenido = [arco]
  /*se modelaran WKO para los estados del cofre 
  */
 
  method interactuarCon(personaje){
    self.image("cofre-abierto.png") /*cambiar a WKO, si no sabes como hacerlo te lo explico
                                    tambien cambia el cofre a una clase con la posicion randomizada*/
    martina.mochila().add(arco)
    self.contenido().clear()
  }
}
object arco{
    method dispararFlechas(){
    if (!martina.mochila.null()){
        game.addVisual(Flecha)
      game.onTick(800, "DispararFlechasConArcoEquipado", {new Flecha().arrojarse()})
      /*esto deberia ser una subtarea de la que se encarga martina; ejemplo disparar, mi idea era hacer
      que el proyectil recorra x cant de celdas y si no colisiona con nada desaparece
      Lo del proyectil podria calcularse en una var dentro del method arrojarse, que si llega por ej 
      a x celdas recorridas, que caiga la flecha, o sea, desparece
      La flecha podria ser un WKO, pero solo podrias disparar 1 a la vez, si es una class, podrias
      disparar varias a la vez, lo que si veo, es que no se si con estado de martina podes hacer que 
      dispare en direcciones, ya que eso solo actualiza el asset, y este solo es distinto cuando mira para
      la derecha; lo que haria es una var que guarde la direccion hacia donde se movio; podriamos 
      implementar las direcciones como objeto; ese objeto guardarlo y ver hacia donde tiene que disparar,
      a partir de esto, podria tener un asset por direccion la flecha, modelarlos como WKO y que ese WKO
      cambie el asset de la flecha*/
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