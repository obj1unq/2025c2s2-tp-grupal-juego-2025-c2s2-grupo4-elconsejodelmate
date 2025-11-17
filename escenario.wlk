import martina.*
import enemigos.*
import extras.*
import salas.*
import interfaz.*
//problema a solucionar: volver a la sala anterior 
object nivelActual{
  // el gato de schrodinger 
  var salaAnterior = null 
  var salaActual = salaInicial

  method cambiarDeNivel(){
   salaActual = salaActual.siguiente()
  }
  method cambiarANivelAnterior(){
    salaActual = salaAnterior
  }
  method salaActual(){
    return salaActual
  }
  method actualizarSalaAnterior(){
    salaAnterior = salaActual
  }

  method iniciar(){
    salaActual.iniciar()
  }

  method dibujarNuevaSala(){
    managerListasDeSala.limpiarNivel()
    salaActual.dibujar()
    salaActual.enemigos()
    game.addVisual(barraDeVidas)
    game.addVisual(cartelDePuntos)
   // martina.position(game.at(1,7))
    game.addVisual(martina)

  }
  method enemigos(){
    salaActual.enemigos()
  }
  method restart(){
    game.removeVisual(imagenFinal)
    game.removeVisual(mensajeFinal)
    martina.cantDeVidas(3)
    salaActual = salaInicial
    self.dibujarNuevaSala()
    self.iniciar()
    //hay que delegar mucho de aca
    //Cuando se resete martina queda en la posicion que se le da en el metho dibujarNuevaSala, ojo con eso 
  }

}


object managerListasDeSala{
  var property obstaculos = []
  var property muros  = []
  const  listaDeCofres = []
  const  listaDeTrampas = []
  const  listaDePuertas = []
  const  listaDeEnemigos = []

  method agregarObstaculo(objeto){
    obstaculos.add(objeto)
  }
  method agregarMuro(objeto){
    muros.add(objeto)
  }
  method agregarCofre(objeto){
    listaDeCofres.add(objeto)
  }
  method agregarTrampa(objeto){
    listaDeTrampas.add(objeto)
  }

  method agregarPuerta(objeto){
    listaDePuertas.add(objeto)
  }

  method removerVisualesDe(lista){
    lista.forEach({elemento => game.removeVisual(elemento)})
  }
  method agregarEnemigo(enemigo){
    listaDeEnemigos.add(enemigo)
  }

  method limpiarNivel(){
    //Listas de visuales 
    //Y clear de listas viejas
    
    self.removerVisualesDe(obstaculos)
    obstaculos.clear()

    self.removerVisualesDe(muros)
    muros.clear()

    self.removerVisualesDe(listaDeCofres)
    listaDeCofres.clear()

    self.removerVisualesDe(listaDeTrampas)
    listaDeTrampas.clear()

    self.removerVisualesDe(listaDePuertas)
    listaDePuertas.clear()

    self.removerVisualesDe(listaDeEnemigos)
    listaDeEnemigos.clear()

    //Visuales individuales
    game.removeVisual(barraDeVidas)
    game.removeVisual(cartelDePuntos)
    game.removeVisual(martina)
    
    //Remover ticks

    game.removeTickEvent("movimientoEnemigo")
    game.removeTickEvent("cambioDireccionEnemigo")
    game.removeTickEvent("perseguirAMartina")

  }
}





class Sala{

method siguiente(){
  return
}
method anterior(){
  return
}




  
  const nivel 
  
  method iniciar(){
    game.ground("suelo.png")
    self.construir()
    self.enemigos()
    self.configMartina()
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

  method configMartina(){
    martina.position(self.posicionDeMartina())
    game.addVisual(martina)
    config.configTeclas()
    //TICKS
    game.onTick(200, "DispararFlecha", {flechas.moverFlechas()})
    //COLISIONES 
     game.onCollideDo(martina, {objeto => objeto.interactuarCon(martina)})
  }

  method posicionDeMartina(){
    return 
  }


  method enemigos(){
    const enemigosACrear = 1.randomUpTo(3)
    const manager = managerListasDeSala
    const enemigosPatrulla = []
    const enemigosPerseguidores = []  
    enemigosACrear.times({i => 
        const enemigo = new EnemigoPatrulla(image = "troll.png", position = randomizer.emptyPosition(), nivel = self)
        game.addVisual(enemigo)
        manager.agregarEnemigo(enemigo)
        enemigosPatrulla.add(enemigo)
    })
    enemigosACrear.times({i => 
        const enemigo = new EnemigoPerseguidor(image = "wendingo.png", position = randomizer.emptyPosition(), nivel = self)
        game.addVisual(enemigo)
        enemigosPerseguidores.add(enemigo)
        manager.agregarEnemigo(enemigo)
    })
    //Ticks
    game.onTick(800, "movimientoEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.avanzar()})})
    game.onTick(2000, "cambioDireccionEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.cambiarDireccion()})})
    game.onTick(800, "perseguirAMartina", {enemigosPerseguidores.forEach({enemigo => enemigo.perseguir(martina)})})
  }

  
}

object p{
  const sala = managerListasDeSala

  method dibujar(posicion){
    const puerta = new Puerta(position = posicion)

    game.addVisual(puerta)
    sala.agregarPuerta(puerta)
  }
}
object pa{
  const sala = managerListasDeSala

  method dibujar(posicion){
    const puerta = new PuertaASalaAnterior(position = posicion)

    game.addVisual(puerta)
    sala.agregarPuerta(puerta)
  }
}

object c {
  const sala = managerListasDeSala

  method dibujar(posicion){
    const cofre = new Cofre(position = posicion)

    game.addVisual(cofre)
    sala.agregarCofre(cofre)
  }
}

object b{
  var property sala = managerListasDeSala
  method dibujar(posicion){
    const barril = new Barril(position = posicion)
    game.addVisual(barril)
    sala.agregarObstaculo(barril)
  }
}

object a{
  var property sala = managerListasDeSala

  method dibujar(posicion){
    const ataud = new Ataud(position = posicion)

    game.addVisual(ataud)
    sala.agregarObstaculo(ataud)
  }
}


object t{
  //const trampas = []
  var property sala = managerListasDeSala
  method dibujar(posicion){
    const trampa = new Trampa(position = posicion)

    game.addVisual(trampa)
    sala.agregarTrampa(trampa)
  }
}


object m{
  //pasarle el nivel actual 
  var property sala = managerListasDeSala
  //const muros = []
  method dibujar(posicion){
    const muro = new Muro(position = posicion)
    game.addVisual(muro)
    sala.agregarMuro(muro)
    
    //muros.add(muro)
  }

}

object v{
  method dibujar(posicion){

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
    if(estado.image() == "cofre-cerrado.png"){ //preguntar si esto se puede mejorar, no pregunte mas xd 
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
    return "cofre-cerrado.png"
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
    nivelActual.actualizarSalaAnterior()
    nivelActual.cambiarDeNivel()
    nivelActual.dibujarNuevaSala()
    //nivelActual.enemigos()
  }

}

class PuertaASalaAnterior{
  var property position 
  var property image = "baston.png"

  method interactuarCon(pj){
    nivelActual.cambiarANivelAnterior()//hacer que las salas apunten tambien al anterior 
    nivelActual.cambiarDeNivel()
    nivelActual.dibujarNuevaSala()
  }
}


