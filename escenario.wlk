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

object nivelInicial{

  const muro = m
  const ataud = a
  const barril = b
  const cofre = c
  const nivel = [ [m, m, m, m, m, m, m, v, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, a, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, b, v, c, v, v, v, v, v, v, v, v, v, m],
                  [v, v, v, v, v, v, v, v, v, v, v, v, v, v, v],
                  [m, v, v, v, v, v, v, t, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, a, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, v, m, m, m, m, m, m, m]].reverse()
  
  method iniciar(){
    game.ground("suelo.png")
    self.construir()
    self.enemigos()
    self.martina()
  }

  method construir() {
      game.height(nivel.size())
      game.width(nivel.get(0).size())

      (0 .. game.width() - 1).forEach({ x =>
          (0 .. game.height() - 1).forEach({ y =>
              nivel.get(y).get(x).dibujar(game.at(x, y))
          })
      })
  }

  method obtenerMuros(){
    return muro.listaDeMuros()
  }

  method obtenerObstaculos(){
    return ataud.listaDeAtaudes() + barril.listaDeBarriles()
  }


  method martina(){
    game.addVisual(martina)
    config.configTeclas()
    //TICKS
    game.onTick(200, "DispararFlecha", {flechas.moverFlechas()})
    //COLISIONES 
     game.onCollideDo(martina, {objeto => objeto.interactuarCon(martina)
                       game.say(martina,"tengo "+ martina.cantDeVidas() + " vidas")})
  }

  method enemigos(){
    const enemigosACrear = 1.randomUpTo(3)
    const enemigosPatrulla = []
    const enemigosPerseguidores = []  
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
    //Ticks
    game.onTick(800, "movimientoEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.avanzar()})})
    game.onTick(6000, "cambioDireccionEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.cambiarDireccion()})})
    game.onTick(800, "perseguirAMartina", {enemigosPerseguidores.forEach({enemigo => enemigo.perseguir(martina)})})
  }

  
}

object c {
  const cofres = []
  method dibujar(posicion){
    const cofre = new Cofre(position = posicion)
    game.addVisual(cofre)
    cofres.add(cofre)
  }
  method listaDeCofres(){
    return cofres
  }
}

object b{
  const barriles = []
  method dibujar(posicion){
    const barril = new Barril(position = posicion)
    game.addVisual(barril)
    barriles.add(barril)
  }
  method listaDeBarriles(){
    return barriles
  }
}

object a{
  const ataudes= []
  method dibujar(posicion){
    const ataud = new Ataud(position = posicion)
    game.addVisual(ataud)
    ataudes.add(ataud)
  }
  method listaDeAtaudes(){
    return ataudes
  }
}


object t{
  const trampas = []
  method dibujar(posicion){
    const trampa = new Trampa(position = posicion)
    game.addVisual(trampa)
    trampas.add(trampa)
  }
  method listaDeTrampas(){
    return trampas
  }
}


object m{
  const muros = []
  method dibujar(posicion){
    const muro = new Muro(position = posicion)
    game.addVisual(muro)
    muros.add(muro)
  }

  method listaDeMuros(){
    return muros
  }
}

object v{
  method dibujar(posicion){

  }
}

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
    game.onTick(200, "DispararFlecha", {flechas.moverFlechas()})
    //COLISIONES 
     game.onCollideDo(martina, {objeto => objeto.interactuarCon(martina)
                       game.say(martina,"tengo "+ martina.cantDeVidas() + " vidas")})
  
  }
}
object cartelDeMuerte{
  var property position = game.center()
  method image(){
    return "cartelMuerte.png"
  }
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


class Muro{
  var property position
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




