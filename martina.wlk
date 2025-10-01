object martina {
  var property position = game.center()
  var property estadoDeMartina =  "up"

  method image(){
    return "martina-" + estadoDeMartina + ".png"
  }
  
  method moverA(nuevaDireccion){
    if(!self.estaEnBorde(nuevaDireccion)){
      self.position(nuevaDireccion)
    }
    
  }

  method direccionDeMartina(direccion){
    estadoDeMartina = direccion
  }
  
  method estaEnBorde(positionDestino){
		return positionDestino.x() == -1 || positionDestino.x() == 15 || positionDestino.y() == -1 || positionDestino.y() == 15
	}
}

object config{
  method configTeclas(){
    keyboard.w().onPressDo({martina.moverA(martina.position().up(1))
                              martina.direccionDeMartina("up")})
    keyboard.a().onPressDo({martina.moverA(martina.position().left(1))
                            martina.direccionDeMartina("lef")})
    keyboard.s().onPressDo({martina.moverA(martina.position().down(1))
                            martina.direccionDeMartina("down")})
    keyboard.d().onPressDo({martina.moverA(martina.position().right(1))
                            martina.direccionDeMartina("right")})
  }
}