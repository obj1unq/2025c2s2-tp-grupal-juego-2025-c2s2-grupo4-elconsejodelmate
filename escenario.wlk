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
//Poner todos los obstaculos en una misma lista 

object nivelInicial{

  const property listaDeObstaculos = []

  method agregar(objeto){
    listaDeObstaculos.add(objeto)
  }


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
      game.width(nivel.size()) // habia un get(0)

      (0 .. game.width() - 1).forEach({ x =>
          (0 .. game.height() - 1).forEach({ y =>
              nivel.get(y).get(x).dibujar(game.at(x, y))
          })
      })
  }

  method obtenerMuros(){
    return muro.listaDeMuros()
  }

  /*method obtenerObstaculos() {
    return listaDeObstaculos
  //esto tendria que tener una lista conjunta entre la lista de ataudes y la lista de barriles pero no anda 
  }*/

  method martina(){
    game.addVisual(martina)
    config.configTeclas()
    //TICKS
    game.onTick(200, "DispararFlecha", {flechas.moverFlechas()})
    //COLISIONES 
     game.onCollideDo(martina, {objeto => objeto.interactuarCon(martina)})
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
    //barriles.add(barril)
    //nivelInicial.listaDeObstaculos.add(barril)
    nivelInicial.agregar(barril)
  }
 /* method listaDeBarriles(){
    return barriles
  }*/
  method listaDePosicionesDeBarriles(){
    return barriles.map({barril => barril.position()})
  }
}

object a{
  const ataudes= []
  method dibujar(posicion){
    const ataud = new Ataud(position = posicion)
    game.addVisual(ataud)
    //ataudes.add(ataud)
    //nivelInicial.listaDeObstaculos.add(ataud)
    nivelInicial.agregar(ataud)
  }
 /* method listaDeAtaudes(){
    return ataudes
  }*/

  method listaDePosicionesDeAtaudes(){
    return ataudes.map({ataud => ataud.position()})
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


object cartelDeMuerte{
  var property position = game.center()
  method image(){
    return "cartelMuerte.png"
  }
}


object inventario{
  var property position = game.center()
  method image(){
    const primerObjDelInventario = martina.inventario().first() 
    return primerObjDelInventario.image()
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
    if(estado.image() == "cofre.png"){ //preguntar si esto se puede mejorar, no pregunte mas xd 
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




