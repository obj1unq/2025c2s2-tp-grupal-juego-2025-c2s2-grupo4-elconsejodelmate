import escenario.*

object martina {
  var property position = game.at(7,1)
  var property estadoDeMartina = ""
  var property cantDeVidas = 3
  var property mochila = []
/* Al mover el escenario a un WKO, se perdio la referencia global, ahora los enemigos y el pj
guardan en variables el nivel donde se encuentran, y todos los objetos con los que pueden colisionar*/
  var property nivel = nivel1
  var property obstaculosNivel = nivel.obtenerObstaculos()
  var property murosNivel = nivel.obtenerMuros()
  //var direccion = //guardar objeto direccion
 
  method incrementarEnUnoVidas(){
    cantDeVidas = cantDeVidas + 1 //quiza medio redundante pero es mas facil de leer
  }
  method decrementarEnUnoVidas(){
    cantDeVidas = cantDeVidas -1
  }
  method image(){
    return "martina" + estadoDeMartina + ".png"
  }
  method estaMuerta(){
    return self.cantDeVidas() <= 0
  }
  // que el juego termine en decrementarEnUnoVidasDeMartina
  method estaViva(){
    return self.cantDeVidas() > 0
  }
  
  method moverA(nuevaDireccion){
    if(self.estaViva() && self.puedeMoverseA(nuevaDireccion)){
      self.position(nuevaDireccion)
    }
  }
  //CAMBIA EL PNG 
  method direccionDeMartina(_direccion){
    estadoDeMartina = _direccion.name()
  }
  
  method hayMuroEn(nuevaDireccion){
    return murosNivel.any({muro => muro.position() == nuevaDireccion})
  }
  method hayObstaculoEn(nuevaDireccion){
    return obstaculosNivel.any({obstaculo => obstaculo.position() == nuevaDireccion})
  }
  method puedeMoverseA(nuevaDireccion){
    return !self.hayMuroEn(nuevaDireccion) && !self.hayObstaculoEn(nuevaDireccion)
  }
}
object config{
  method configTeclas(){
    keyboard.w().onPressDo({arriba.mover(martina)})
    keyboard.a().onPressDo({izquierda.mover(martina)})
    keyboard.s().onPressDo({abajo.mover(martina)})
   // keyboard.f().onPressDo({martina.dispararFlecha()})
    keyboard.d().onPressDo({derecha.mover(martina)})

                            
  }
}
object derecha{
  method name(){
    return "-derecha"
  }
  method mover(pj){
    if(pj.puedeMoverseA(self.siguientePosicion(pj.position()))){
      pj.position(self.siguientePosicion(pj.position()))
      pj.estadoDeMartina(self.name()) 
    }
  }
  method siguientePosicion(posicion){
    return game.at(posicion.x() + 1 , posicion.y())
  }
   
    
}
object izquierda{
  method name(){
    return ""
  }
  method mover(pj){
    if(pj.puedeMoverseA(self.siguientePosicion(pj.position()))){
      pj.position(self.siguientePosicion(pj.position()))
      pj.estadoDeMartina(self.name()) 
    }
  }
  method siguientePosicion(posicion){
    return game.at(posicion.x() - 1 , posicion.y())
  }
}
object arriba{
  method name(){
    return ""
  }
  method mover(pj){
    if(pj.puedeMoverseA(self.siguientePosicion(pj.position()))){
      pj.position(self.siguientePosicion(pj.position()))
      pj.estadoDeMartina(self.name()) 
    }
  }
  method siguientePosicion(posicion){
    return game.at(posicion.x(), posicion.y() + 1)
  }
}
object abajo{
  method name(){
    return ""
  }
  method mover(pj){
    if(pj.puedeMoverseA(self.siguientePosicion(pj.position()))){
      pj.position(self.siguientePosicion(pj.position()))
      pj.estadoDeMartina(self.name()) 
    }
  }
  method siguientePosicion(posicion){
    return game.at(posicion.x(), posicion.y() -1)
  }
}