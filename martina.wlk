import escenario.*

object martina {
  var property position = game.at(7,1)
  var property estadoDeMartina =  ""
  var property cantDeVidas = 3
/* Al mover el escenario a un WKO, se perdio la referencia global, ahora los enemigos y el pj
guardan en variables el nivel donde se encuentran, y todos los objetos con los que pueden colisionar*/
  var property nivel = nivel1
  var property obstaculosNivel = nivel.obtenerObstaculos()
  var property murosNivel = nivel.obtenerMuros()

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
  method direccionDeMartina(direccion){
    estadoDeMartina = direccion
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
    keyboard.w().onPressDo({martina.moverA(martina.position().up(1))
                              martina.direccionDeMartina("")})
    keyboard.a().onPressDo({martina.moverA(martina.position().left(1))
                            martina.direccionDeMartina("")})
    keyboard.s().onPressDo({martina.moverA(martina.position().down(1))
                            martina.direccionDeMartina("")})
    keyboard.d().onPressDo({martina.moverA(martina.position().right(1))
                            martina.direccionDeMartina("-derecha")})
                            
  }
}
