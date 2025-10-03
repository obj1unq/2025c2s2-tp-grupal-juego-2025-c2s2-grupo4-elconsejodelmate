object martina {
  var property position = game.center()
  var property estadoDeMartina =  ""
  var property cantDeVidas = 1 

  method actualizarVidasDeMartina(){
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
                              martina.direccionDeMartina("")})
    keyboard.a().onPressDo({martina.moverA(martina.position().left(1))
                            martina.direccionDeMartina("")})
    keyboard.s().onPressDo({martina.moverA(martina.position().down(1))
                            martina.direccionDeMartina("")})
    keyboard.d().onPressDo({martina.moverA(martina.position().right(1))
                            martina.direccionDeMartina("-derecha")})
  }
}