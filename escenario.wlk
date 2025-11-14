import martina.*
import enemigos.*
import extras.*

//Poner todos los obstaculos en una misma lista 
object nivelActual{

  const property obstaculos = salaActual.listaDeObstaculos()
  const property muros = salaActual.muros()

  var salaActual = salaInicial

  method cambiarDeNivel(){
   salaActual = salaActual.siguiente()
  }
  method salaActual(){
    return salaActual
  }

  method iniciar(){
    salaActual.iniciar()
  }

  method dibujarNuevaSala(){
    game.removeVisual(barraDeVidas)
    game.removeVisual(cartelDePuntos)
    game.removeVisual(martina)
    
    salaActual.dibujar()
    game.addVisual(barraDeVidas)
    game.addVisual(cartelDePuntos)
    martina.position(game.at(1,7))
    game.addVisual(martina)
    //Bueno con esto se crea la  nueva sala pero no se crea ni a martina ni su barra de vida ni contador :P
    //Notar que los cofres se instancian como cofres abiertos aun cuando se cambio de nivel
  }

}

object salaInicial inherits Sala(
        nivel = [ [m, m, m, m, m, m, m, v, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, a, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, b, v, c, v, v, v, v, v, v, v, v, v, m],
                  [v, v, v, v, v, v, v, v, v, v, v, v, v, v, p],
                  [m, v, v, v, v, v, v, t, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, a, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, v, m, m, m, m, m, m, m]].reverse()){
                    override method siguiente(){
                      return salaDerecha
                    }
                  }

object salaDerecha inherits Sala(
        nivel = [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, v, v, v, v, v, m],
                  [v, v, v, v, v, v, t, t, t, v, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()){}


object salaDeCofres inherits Sala(
        nivel = [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, c, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, c, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, c, v, v, v, c, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [v, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, c, v, v, m],
                  [m, v, c, v, v, c, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, c, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()){
                    
                  }


class Sala{

  method siguiente(){
    return 
  }

  const property listaDeObstaculos = []
  const property muros  = []

  method agregarObstaculo(objeto){
    listaDeObstaculos.add(objeto)
  }
  method agregarMuro(objeto){
    muros.add(objeto)
  }

  const muro = m
  // const ataud = a
  // const barril = b
  // const cofre = c

  const nivel 
  
  method iniciar(){
    game.ground("suelo.png")
    self.construir()
    self.enemigos()
    self.martina()
  }

  method construir() {
      game.height(nivel.size())
      game.width(nivel.size()) // habia un get(0)
      self.dibujar()
      
  }

  method dibujar(){
    (0 .. game.width() - 1).forEach({ x =>
          (0 .. game.height() - 1).forEach({ y =>
              nivel.get(y).get(x).dibujar(game.at(x, y))
          })
      })
  }

  method listaDeMuros(){
    return muro.listaDeMuros()
  }

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
    game.onTick(2000, "cambioDireccionEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.cambiarDireccion()})})
    game.onTick(800, "perseguirAMartina", {enemigosPerseguidores.forEach({enemigo => enemigo.perseguir(martina)})})
  }

  
}

object p{
  method dibujar(posicion){
    const puerta = new Puerta(position = posicion)
    game.addVisual(puerta)
  }
}

object c {
  //const cofres = []
  method dibujar(posicion){
    const cofre = new Cofre(position = posicion)
    game.addVisual(cofre)
    //cofres.add(cofre)
  }
 /* method listaDeCofres(){
    return cofres
  }*/
}

object b{
  //const barriles = []
  //pasarle el nivel actual 
  var property listaAEscribir = nivelActual.salaActual()
  method dibujar(posicion){
    const barril = new Barril(position = posicion)
    game.addVisual(barril)
    listaAEscribir.agregarObstaculo(barril)
    //barriles.add(barril)
    //nivelInicial.listaDeObstaculos.add(barril)
    //salaInicial.agregar(barril)
  }
 /* method listaDeBarriles(){
    return barriles
  }*/
 /* method listaDePosicionesDeBarriles(){
    return barriles.map({barril => barril.position()})
  }*/
}

object a{
  //pasarle el nivel actual 
  var property listaAEscribir = nivelActual.salaActual()
  //const ataudes= []
  method dibujar(posicion){
    const ataud = new Ataud(position = posicion)
    game.addVisual(ataud)
    listaAEscribir.agregarObstaculo(ataud)
    //ataudes.add(ataud)
    //nivelInicial.listaDeObstaculos.add(ataud)
    //salaActual.agregar(ataud)
  }
 /* method listaDeAtaudes(){
    return ataudes
  }*/

  /*method listaDePosicionesDeAtaudes(){
    return ataudes.map({ataud => ataud.position()})
  }*/
}


object t{
  //const trampas = []
  method dibujar(posicion){
    const trampa = new Trampa(position = posicion)
    game.addVisual(trampa)
    //trampas.add(trampa)
  }
  /*method listaDeTrampas(){
    return trampas
  }*/
}


object m{
  //pasarle el nivel actual 
  var property listaAEscribir = nivelActual.salaActual()
  //const muros = []
  method dibujar(posicion){
    const muro = new Muro(position = posicion)
    game.addVisual(muro)
    listaAEscribir.agregarMuro(muro)
    
    //muros.add(muro)
  }

 /* method listaDeMuros(){
    return muros
  }*/
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

class Puerta{
  var property position 
  var property image = "baston.png"


  method interactuarCon(pj){
    nivelActual.cambiarDeNivel()
    nivelActual.dibujarNuevaSala()
  }
}




