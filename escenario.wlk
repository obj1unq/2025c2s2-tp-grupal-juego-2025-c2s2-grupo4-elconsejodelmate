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
  const cofresACrear = 1.randomUpTo(3)
  
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
        const barril = new Barril(position = randomizer.emptyPosition())
        obstaculos.add(barril)
        game.addVisual(barril)
    })
    obstaculosACrear.times({i =>
        const ataud = new Ataud(position = randomizer.emptyPosition())
        obstaculos.add(ataud)
        game.addVisual(ataud)
    })
    trampasACrear.times({i =>
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
    cofresACrear.times({i => 
        const cofre = new Cofre(position = randomizer.emptyPosition())
        game.addVisual(cofre)
    })
   
   
    //TICKS 
    game.onTick(800, "movimientoEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.avanzar()})})
    game.onTick(6000, "cambioDireccionEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.cambiarDireccion()})})
    game.onTick(800, "perseguirAMartina", {enemigosPerseguidores.forEach({enemigo => enemigo.perseguir(martina)})})
    game.onTick(800, "DispararFlecha", {flechas.moverFlechas()})
    //COLISIONES 
     game.onCollideDo(martina, {objeto => objeto.interactuarCon(martina)})
                     // game.say(martina,"tengo "+ martina.cantDeVidas() + " vidas")})
  
  }
}

class Muro{
  var property position = game.origin()
  var property image = "pared1.png"  
  method chocarCon(objeto){
    game.removeVisual(objeto)
  }
}
class Trampa{
  var property position 
  var property image = "trampa.png"

  method interactuarCon(pj){
    pj.decrementarEnUnoVidas()
    game.say(pj,"tengo "+ martina.cantDeVidas() + " vidas")
  
  }
  method chocarCon(objeto){
    
  }
}

class Obstaculo{
  var property position  
  method image()
  method chocarCon(objeto){
    game.removeVisual(objeto)
  }
}
class Ataud inherits Obstaculo{
  override method image(){
    return "ataud.png"
  }
}
class Barril inherits Obstaculo{
  override method image(){
    return "barril.png"
  }
}

class Cofre{
  var property position // si quiero pasar una emptyPosition del rnadomizer a la clase, crashea  
  const property poolDeObjetos = []
  var property estado = cofreCerrado  

  method image(){
    return estado.image()
  }
  method abrir(){
    estado = estado.siguienteEstado()
  }

  method inicializarPoolObjetos(){
    //puedo inicializarlo y añadirlo directamente?
    //poolDeObjetos.add(new PocionVida())
    const pocionVida = new PocionVida(position = self.position())
    const pocionVenenosa = new PocionVenenosa(position = self.position())
    const anillo = new Anillo(position = self.position())
    const collar = new Collar(position = self.position())
    const llave = new Llave(position = self.position())
    poolDeObjetos.add(pocionVida)
    poolDeObjetos.add(pocionVenenosa)
    poolDeObjetos.add(anillo)
    poolDeObjetos.add(collar)
    poolDeObjetos.add(llave)
  }
  method seleccionarObjeto(listaDeObjetos){
    return poolDeObjetos.anyOne()
  }
  method interactuarCon(pj){
    if(estado == cofreCerrado){ //preguntar si esto se puede mejorar 
        self.inicializarPoolObjetos()
        self.seleccionarObjeto(poolDeObjetos).interactuarCon(pj)
        self.abrir()
    }
  }
  method chocarCon(objeto){
    
  }
}
object cofreCerrado{
  method image(){
    return "cofre.png"
  }
  method siguienteEstado(){
    return cofreAbierto
  }
}
object cofreAbierto{
  method image(){
    return "cofre-abierto.png"
  }
  method siguienteEstado(){
    return self 
  }
}
/*class Puerta{
  var property position 
  var property image 

  method interactuarCon(pj){
    siguienteNivel.cambiarNivel()
  }
}*/




