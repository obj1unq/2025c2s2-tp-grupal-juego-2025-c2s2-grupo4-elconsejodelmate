import martina.*

object barraDeVidas{
  var property position = game.at(12,14)
  
  method image(){
    return "corazon" + self.vidasDe(martina) + ".png"
  }
  method vidasDe(personaje){
    return personaje.cantDeVidas()
  }
}

object cartelDePuntos{
  method text() = "" + martina.puntos()
  var property position = game.at(1,14)
  method textColor(){
    return "FFFFFFFF"
  }
}

object cartelMostrarPuntos{
  method position() = game.at(7,5)
  method text() = "Puntos = "+ martina.puntos()
  method textColor() = "FFFFFFFF"

  method interactuarCon(pj){

  }

}

object imagenFinal{
  method position() = game.at(0,0)
  method image() = "PantallaFinal.png"
}

object imagenInicial{
  method position() = game.at(0,0)
  method image() = "pantallaInicial.png"
}

object imagenGanaste{
  method position() = game.at(0,0)
  method image() = "pantallaGanaste.png"
}

object imagenRestar{
  method position() = game.at(0,0)
  method image() = "pantallaReintentar.png"
}