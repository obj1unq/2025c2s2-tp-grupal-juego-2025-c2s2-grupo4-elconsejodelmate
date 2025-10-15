import martina.*
class Muro{
  var property position = game.origin()
  var property image = "pared1.png"  
}
class Trampa{
  var property position = game.at(3,1)
  var property image = "trampa.png"

  method interactuarCon(pj){
    pj.decrementarEnUnoVidas()
  }
}
const trampa = new Trampa() // prueba de trampa
class Obstaculo{
  var property position = game.at(4,8)
  var property image = "barril.png"
  //puede ser un barril o ataud, la clase se inicializara con un barril 
}
class Cofre{
  var property position = game.at(6,9)
  var property image = "cofre.png"  
  var property contenido = []
  var property fueAbierto = false 

}
//PARA HACER QUE COLISIONEN LOS PERSONAJES; ESTOS DEBEN SABER TODAS LAS POSICIONES DE LOS OBJETOS CON LOS QUE PUEDEN COLISIONAR 
//ARRAY DE MUROS; SE VAN AGREGANDO DESDE EL WPGM 
const muros = []
const obstaculos =[barril, ataud]
//IMPLEMENTACION DE COISIONES CON OBJETOS DEL ESCENARIO
const barril = new Obstaculo()
const ataud = new Obstaculo(position = game.at(6,7), image = "ataud.png")


