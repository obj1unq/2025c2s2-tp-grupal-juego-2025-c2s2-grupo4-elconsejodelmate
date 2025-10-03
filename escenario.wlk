import martina.*

class Muro{
  var property position = game.origin()
  var property image = "pared1.png"  
}
class Trampa{
  var property position = game.at(3,1)
  var property image = "trampa.png"

  method lastimarAMartina(){
    martina.actualizarVidasDeMartina()
  }
}
const trampa = new Trampa()