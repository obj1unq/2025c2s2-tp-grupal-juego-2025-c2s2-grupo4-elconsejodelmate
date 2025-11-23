import martina.*
import enemigos.*
import extras.*
import salas.*
import interfaz.*
import modeladoMapa.*

object salaActual{
  var salaActual = salaInicial

  // method cambiarDeNivel(){
  //  salaActual = salaActual.siguiente()
  // }

  method cambiarASala(salaNueva){
    salaActual = salaNueva
  }
  
  method salaActual(){
    return salaActual
  }

  //Se usa solo para el inicio del juego ya que setea el tamaño del tablero
  method iniciarSalaInicial(){
    salaActual.iniciar()
  }

  /*Limpia todo lo almacenado y dibujado en el nivel anterior e instancia la nueva sala, sus enemigos y a martina*/
  method dibujarNuevaSala(){
    managerListasDeSala.limpiarNivel()
    salaActual.dibujar()
    salaActual.enemigos()
    martina.aSala(salaActual)
    martina.carteles()
  }

  //Reseteo, te manda a la sala salaInicial, vidas en 3 y puntos en 0
  method restart(){
    game.removeVisual(imagenFinal)
    game.removeVisual(mensajeFinal)
    salaActual = salaInicial
    self.dibujarNuevaSala()
    martina.restart()
  }

  method construir(){
    salaActual.construir()
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

  method removerAlEnemigo(enemigo){
    listaDeEnemigos.remove(enemigo)
  }

  method limpiarNivel(){
    //Limpia las visuales de las listas dadas y borra los elementos de las listas
    
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

    //Remueve los visuales que no pertenecen a una lista de objetos
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

  //method abstracto para definir en la creacion de cada sala //vuela con las puertas :P
  method salaDerecha(){
     
  }

  method salaIzquierda(){

  }

  method salaArriba(){

  }

  //Constante abstracta para modelar el nivel, //vuela cuando se actualicen las salas
  const sala = self.dibujoDeSala()

  method dibujoDeSala(){
    return []
  }

  
  //method primitivo, es necesario unicamente para la creacion del primer nivel (para levantar el juego)  NO USAR FUERA DE ESO 
  method iniciar(){
    game.ground("suelo.png")
    self.construir()
    self.dibujar()
    self.enemigos()
    self.configMartina()
   
  }

  //method primitivo NO USAR instancia el tamaño del tablero, SOLO USAR DENTRO DE INICIAR 
  method construir() {
      game.height(sala.size())
      game.width(sala.size()) 
      
      
  }

  //Este es el lindo, method para dibujar el tablero segun la constante nivel creada previamente 
  method dibujar(){
    (0 .. game.width() - 1).forEach({ x =>
          (0 .. game.height() - 1).forEach({ y =>
              sala.get(y).get(x).dibujar(game.at(x, y))
          })
      })
  }

  //Configura la posicion de martina, sus visuales (ella, y las barras de vida y puntos) , su colision y el tick de las flechas
  method configMartina(){
    martina.position(self.posicionDeMartina())
    game.addVisual(martina)

    game.addVisual(barraDeVidas)
    game.addVisual(cartelDePuntos)
    //TICKS
    game.onTick(250, "DispararFlecha", {flechas.moverFlechas()})
    //COLISIONES 
     game.onCollideDo(martina, {objeto => objeto.interactuarCon(martina)})
  }

  //Method abstracto para poder indicar donde deberia aparecer martina en la nueva sala, tras pasar una puerta
  method posicionDeMartina(){
     return
  }

  //Instancia los enemgios en la sala, random de 1 a 3 por enemigo, y sus ticks
  method enemigos(){
    const enemigosACrear = 1.randomUpTo(3)
    const manager = managerListasDeSala
    const enemigosPatrulla = []
    const enemigosPerseguidores = []  
    enemigosACrear.times({i => 
        const enemigo = new EnemigoPatrulla(image = "troll.png", position = randomizer.emptyPosition())
        game.addVisual(enemigo)
        manager.agregarEnemigo(enemigo)
        enemigosPatrulla.add(enemigo)
    })
    enemigosACrear.times({i => 
        const enemigo = new EnemigoPerseguidor(image = "wendingo.png", position = randomizer.emptyPosition())
        game.addVisual(enemigo)
        enemigosPerseguidores.add(enemigo)
        manager.agregarEnemigo(enemigo)
    })
    //Ticks
    game.onTick(800, "movimientoEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.avanzar()})})
    game.onTick(2000, "cambioDireccionEnemigo", {enemigosPatrulla.forEach({enemigo => enemigo.cambiarDireccion()})})
    game.onTick(1200, "perseguirAMartina", {enemigosPerseguidores.forEach({enemigo => enemigo.perseguir(martina)})})
  }

  
}

