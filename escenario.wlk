import martina.*
import enemigos.*
import extras.*

/*object siguienteNivel{
  const listaDeNiveles = [nivel0, nivel1, nivel2, nivel4]

  var property nivelActual = nivel0 
  var property index = 0 // se va a usar para recorrer la lista con la funcion get 

  method cambiarNivel(){
    index = index + 1 
    nivelActual = listaDeNiveles.get(index)

  }
}*/







object nivel0{

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
  const enemigosPatrulla = []
  const enemigosPerseguidores = []

  method iniciar(){

  //INSTANCIAS 
  const enemigosACrear = 1.randomUpTo(3)
  const obstaculosACrear = 1.randomUpTo(3)
  const trampasACrear = 1.randomUpTo(3)
  //PERSONAJE
  game.addVisual(martina)
  config.configTeclas()

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
        const barril = new Obstaculo(image ="barril.png", position = randomizer.emptyPosition())
        obstaculos.add(barril)
        game.addVisual(barril)
    })
    obstaculosACrear.times({i =>
        const ataud = new Obstaculo(image = "ataud.png", position = randomizer.emptyPosition())
        obstaculos.add(ataud)
        game.addVisual(ataud)
    })
    obstaculosACrear.times({i =>
        const trampa = new Trampa(position = randomizer.emptyPosition())
        trampas.add(trampa)
        game.addVisual(trampa)
    })
    //ENEMIGOS 
    enemigosACrear.times({i => 
        const enemigo = new EnemigoPatrulla(image = "troll.png", position = randomizer.emptyPosition(), nivel = self)
        game.addVisual(enemigo)
        enemigosPatrulla.add(enemigo)
    })
    enemigosACrear.times({i => 
        const enemigo = new EnemigoPerseguidor(image = "wendingo.png", position = randomizer.emptyPosition(), nivel = self)
        game.addVisual(enemigo)
        enemigosPerseguidores.add(enemigo)
    })
   
    //TICKS 
    game.onTick(800, "movimientoEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.avanzar()})})
    game.onTick(6000, "cambioDireccionEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.cambiarDireccion()})})
    game.onTick(800, "perseguirAMartina", {enemigosPerseguidores.forEach({enemigo => enemigo.perseguir(martina)})})
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
  var property position 
  var property image = "trampa.png"

  method interactuarCon(pj){
    pj.decrementarEnUnoVidas()
  }
}

class Obstaculo{
  var property position 
  var property image 
  
}
class Cofre{
  var property position = game.at(6,9)
  var property image = "cofre.png"  
  var property contenido = []
  //se modelaran WKO para los estados del cofre 
}
/*class Puerta{
  var property position 
  var property image 

  method interactuarCon(pj){
    siguienteNivel.cambiarNivel()
  }
}*/




