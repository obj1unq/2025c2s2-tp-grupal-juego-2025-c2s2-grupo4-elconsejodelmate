import martina.*

object imagenFinal{
  method position() = game.at(0,0)
  method image() = "PantallaFinal.png"
}
object mensajeFinal{
  method position() = game.center()
  method text() = "Puntos = "+ martina.puntos()+ "Presiona H para reintentar"
  method textColor() = "FFFFFFFF"

}

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