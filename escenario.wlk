import martina.*
import enemigos.*
object nivel1{
  method iniciar(){
  /*se va a agregar una const, entre 0 y 10 para determinar la cantidad de instancias que se 
  van a crear 
  Para los enemigos, se eligira un numero entre 1 y 3
  Para los obstaculos, se elegira un numero entre 5 y 10
  */
  //ARRAYS
  const muros = []
  //INSTANCIAS 
  const enemigosACrear = 1.randomUpTo(3)
  const obstaculosACrear = 5.randomUpTo(10)
  //VISUALS

  //SUELO 
    game.ground("suelo.png")

  //MUROS 
    (0..6).forEach({x => 
        const muro = new Muro(position = game.at(x,0))
        muros.add(muro)
        game.addVisual(muro)
    })
    (8..15).forEach({x => 
        const muro = new Muro(position = game.at(x,0))
        muros.add(muro)
        game.addVisual(muro)   
    })
    (0..6).forEach({y => 
        const muro = new Muro(position = game.at(0,y), image = "pared1-vertical.png")
        muros.add(muro)
        game.addVisual(muro)
    })
    (8..15).forEach({ y => 
        const muro = new Muro(position = game.at(0,y), image = "pared1-vertical.png")
        muros.add(muro)
        game.addVisual(muro)
    })
    (0..6).forEach({x => 
        const muro = new Muro(position = game.at(x,14))
        muros.add(muro)
        game.addVisual(muro)
    })
    (8..15).forEach({x => 
        const muro = new Muro(position = game.at(x,14))
        muros.add(muro)
        game.addVisual(muro)
    })
    (0..6).forEach({y => 
        const muro = new Muro(position = game.at(14,y), image = "pared1-vertical.png")
        muros.add(muro)
        game.addVisual(muro)
    })
    (8..15).forEach({ y => 
        const muro = new Muro(position = game.at(14,y), image = "pared1-vertical.png")
        muros.add(muro)
        game.addVisual(muro)
    })
    obstaculosACrear.times()
    
  }
}












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

class Obstaculo{
  var property position = game.at(4,8)
  var property image = "barril.png"
  //puede ser un barril o ataud, la clase se inicializara con un barril 
}
class Cofre{
  var property position = game.at(6,9)
  var property image = "cofre.png"  
  var property contenido = []
  //se modelaran WKO para los estados del cofre 

}
//PARA HACER QUE COLISIONEN LOS PERSONAJES; ESTOS DEBEN SABER TODAS LAS POSICIONES DE LOS OBJETOS CON LOS QUE PUEDEN COLISIONAR 
//ARRAY DE MUROS; SE VAN AGREGANDO DESDE EL WPGM 

const obstaculos =[barril, ataud]
//IMPLEMENTACION DE COISIONES CON OBJETOS DEL ESCENARIO
const barril = new Obstaculo()
const ataud = new Obstaculo(position = game.at(6,7), image = "ataud.png")


