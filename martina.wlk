object martina {
  var property position = game.center()
  var property estadoDeMartina =  ""
  var property cantDeVidas = 1 


  method decrementarEnUnoVidasDeMartina(){
    cantDeVidas = cantDeVidas -1
  }
  method image(){
    return "martina" + estadoDeMartina + ".png"
  }
  method estaMuerta(){
    return self.cantDeVidas() <= 0
  }
  method estaViva(){
    return self.cantDeVidas() > 0
  }
  
  method moverA(nuevaDireccion){
    if(self.estaViva() && not self.hayMuroEn(nuevaDireccion)){
      self.position(nuevaDireccion)
    }
  }
  //CAMBIA EL PNG 
  method direccionDeMartina(direccion){
    estadoDeMartina = direccion
  }
  
  method hayMuroEn(nuevaDireccion){
    return escenario.muros.any({muro => muro.position() == nuevaDireccion})
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
