import martina.*
import enemigos.*
object nivel1{
  //ARRAYS
  const muros = []
  //estos getters se usaran para que todos los objetos que se muevan conozcan los objetos 
  //con los que podrian colisionar 
  method obtenerMuros(){
    return muros
  } 
  const obstaculos = []
  method obtenerObstaculos(){
    return obstaculos
  }
  const trampas = []
  method obtenerTrmpas(){
    return trampas 
  }
  method iniciar(){
  /*se va a agregar una const, entre 0 y 10 para determinar la cantidad de instancias que se 
  van a crear 
  Para los enemigos, se eligira un numero entre 1 y 3
  Para los obstaculos, se elegira un numero entre 5 y 10
  */
  //Randomizer de numeros
  const enemigosACrear = 1.randomUpTo(3)
  const obstaculosACrear = 5.randomUpTo(10)
  const trampasACrear = 0.randomUpTo(15)
  //PERSONAJE
  game.addVisual(martina)
  config.configTeclas()
  //VISUALS 
    game.addVisual(enemigo1)
    game.addVisual(enemigo2)
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
    //OBJETOS DEL ESCENARIO
    obstaculosACrear.times({i =>
        const barril = new Obstaculo(image ="barril.png")
        obstaculos.add(barril)
        game.addVisual(barril)
    })
    obstaculosACrear.times({i =>
        const ataud = new Obstaculo(image = "ataud.png")
        obstaculos.add(ataud)
        game.addVisual(ataud)
    })
    obstaculosACrear.times({i =>
        const trampa = new Trampa()
        trampas.add(trampa)
        game.addVisual(trampa)
    })
    //TICKS 
    game.onTick(800, "movimientoEnemigo", {enemigo1.avanzar()})
    game.onTick(6000, "cambioDireccionEnemigo", {enemigo1.cambiarDireccion()})
    game.onTick(800, "perseguirAMartina", {enemigo2.perseguir(martina)})
    //COLISIONES 
     game.onCollideDo(martina, {objeto => objeto.interactuarCon(martina)
                      game.say(martina,"tengo "+ martina.cantDeVidas() + " vidas")})
  }
}


class Muro{
  var property position = game.origin()
  var property image = "pared1.png"  
}
class Trampa{
  //se les dio una posicion random a las trampas y obstaculos, falta fixear que no se superpongan 
  var property position = game.at((1..13).anyOne(),(1..13).anyOne())
  var property image = "trampa.png"

  method interactuarCon(pj){
    pj.decrementarEnUnoVidas()
  }
}

class Obstaculo{
  var property position = game.at((1..13).anyOne(),(1..13).anyOne())
  var property image 
  
}
class Cofre{
  var property position = game.at(6,9)
  var property image = "cofre.png"  
  var property contenido = []
  //se modelaran WKO para los estados del cofre 
}





