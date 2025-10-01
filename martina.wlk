object martina {
  var property position = game.center()

  method image() = ""
  
  method moverA(nuevaDireccion){
    self.position(nuevaDireccion)
  }

  method direccionDeMartina(){

  }
}

object config{
  method configTeclas(){
    keyboard.w().onPressDo({martina.moverA(martina.position().up(1))})
    keyboard.a().onPressDo({martina.moverA(martina.position().left(1))})
    keyboard.s().onPressDo({martina.moverA(martina.position().down(1))})
    keyboard.d().onPressDo({martina.moverA(martina.position().right(1))})
  }
}