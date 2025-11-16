import martina.*
import enemigos.*
import extras.*


object nivelActual{
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
    managerListasDeSala.limpiarNivel()
    salaActual.dibujar()
    //salaActual.enemigos()
    game.addVisual(barraDeVidas)
    game.addVisual(cartelDePuntos)
    martina.position(game.at(1,7))
    game.addVisual(martina)

  }
  method enemigos(){
    salaActual.enemigos()
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
    self.removerVisualesDe(obstaculos)
    self.removerVisualesDe(muros)
    self.removerVisualesDe(listaDeCofres)
    self.removerVisualesDe(listaDeTrampas)
    self.removerVisualesDe(listaDePuertas)
    self.removerVisualesDe(listaDeEnemigos)
    game.removeVisual(barraDeVidas)
    game.removeVisual(cartelDePuntos)
    game.removeVisual(martina)
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


object cartelDeMuerte{
  var property position = game.center()
  method image(){
    return "cartelMuerte.png"
  }
}

object mensajeFinal{
  var property position = game.center()
  method text(){
    return "Tu puntuacion: " + martina.puntos() + " aprete H para reiniciar"
  }
  method textColor(){
    return "FFFFFFFF"
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
    nivelActual.cambiarDeNivel()
    nivelActual.dibujarNuevaSala()
    nivelActual.enemigos()
  }
}




