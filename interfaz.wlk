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