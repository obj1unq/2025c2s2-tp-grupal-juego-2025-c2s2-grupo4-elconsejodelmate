object martina {
  var property position = game.center()
  var property estadoDeMartina =  "up"
  var property cantDeVidas = 1

  method actualizarVidasDeMartina(){
    cantDeVidas = cantDeVidas -1
  }
  method image(){
    if (self.estaMuerta()){
        self.estadoDeMartina("death")
    }
    return "martina-" + estadoDeMartina + ".png"
  }
  method estaMuerta(){
    return self.cantDeVidas() <= 0
  }
  method estaViva(){
    return self.cantDeVidas() > 0
  }
  
  method moverA(nuevaDireccion){
    if(!self.estaEnBorde(nuevaDireccion) && self.estaViva()){
      self.position(nuevaDireccion)
    }
  }

  method direccionDeMartina(direccion){
    estadoDeMartina = direccion
  }
  
  method estaEnBorde(positionDestino){
		return positionDestino.x() == -1 || positionDestino.x() == 14 || positionDestino.y() == -1 || positionDestino.y() == 14
	}
}

object config{
  method configTeclas(){
    keyboard.w().onPressDo({martina.moverA(martina.position().up(1))
                              martina.direccionDeMartina("up")})
    keyboard.a().onPressDo({martina.moverA(martina.position().left(1))
                            martina.direccionDeMartina("left")})
    keyboard.s().onPressDo({martina.moverA(martina.position().down(1))
                            martina.direccionDeMartina("down")})
    keyboard.d().onPressDo({martina.moverA(martina.position().right(1))
                            martina.direccionDeMartina("right")})
  }
}