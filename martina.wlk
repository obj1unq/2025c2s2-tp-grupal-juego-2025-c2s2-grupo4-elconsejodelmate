import escenario.*
import extras.*
import interfaz.*
import salas.*
object martina {
  var property position = game.at(7,1)
  var property estadoDeMartina =  ""
  var property cantDeVidas = 3
  var property ultimaDireccion = arriba 
  var property puntos = 0 

  const manager = managerListasDeSala

  method image(){
    return "martina" + estadoDeMartina + ".png"
  }

  //resetea el estado interno de martina para arrancar el nivelInicial devuelta
  method restart(){
    self.cantDeVidas(3)
    self.puntos(0)
    self.position(salaInicial.posicionDeMartina())

  }

  //posiciona a martina en la posicion que le indica la sala y agrega su visual
  method aSala(sala){
    self.position(sala.posicionDeMartina())
    game.addVisual(self)
  }

  //carteles de vida y puntos
  method carteles(){
    game.addVisual(barraDeVidas)
    game.addVisual(cartelDePuntos)
  }

  method incrementarEnUnoVidas(){
    cantDeVidas = cantDeVidas + 1 //quiza medio redundante pero es mas facil de leer
  }
  method decrementarEnUnoVidas(){
    cantDeVidas = (cantDeVidas -1).max(0)
    self.estaMuerta()
  }
  
  //Si esta muerta muestra el mensaje de muerte 
  method estaMuerta(){
    if( self.cantDeVidas() == 0 ){
      game.removeVisual(self)
      game.addVisual(imagenFinal)
      game.addVisual(cartelMostrarPuntos)
    
    }
  }
  
  method estaViva(){
    return self.cantDeVidas() > 0
  }
  method noTieneVidaCompleta(){
    return cantDeVidas < 3 
  }

  method moverA(nuevaDireccion){
    if(self.estaViva() && self.puedeMoverseA(nuevaDireccion)){
      self.position(nuevaDireccion)
    }
  }

  //method para el onPressDo, genera una flecha la da una colision con el inicializar (con cualquier cosa que choque se borra ) agrega al objeto flechas la flecha recien instanciada
  method disparar(){
    const flecha = new Flecha(position = self.position(),direccion= self.ultimaDireccion())
    flecha.inicializar()
    flechas.agregar(flecha)
  }

  method puedeMoverseA(nuevaDireccion){
    return !manager.hayMuroEn(nuevaDireccion) && !manager.hayObstaculoEn(nuevaDireccion)
  }

  //agrega la puntuacion del objeto dado
  method sumarPuntuacionDe(objeto){
    puntos = puntos + objeto.puntos()
  }

  method chocarCon(objeto){
    //colision de la flecha
  }
  
}
object config{
  method configTeclas(){
    keyboard.w().onPressDo({arriba.mover(martina)})
    keyboard.a().onPressDo({izquierda.mover(martina)})
    keyboard.s().onPressDo({abajo.mover(martina)})
    keyboard.d().onPressDo({derecha.mover(martina)})
    keyboard.f().onPressDo({martina.disparar()})
    keyboard.h().onPressDo({salaActual.restart()})
    keyboard.c().onPressDo({salaActual.iniciarSalaInicial()})
  }
}
object derecha{
  method name(){
    return "-derecha"
  }
  method mover(pj){
    if(pj.puedeMoverseA(self.siguientePosicion(pj.position()))){
      pj.position(self.siguientePosicion(pj.position()))
      pj.estadoDeMartina(self.name()) 
      pj.ultimaDireccion(self)
    }
  }
  method siguientePosicion(posicion){
    return game.at(posicion.x() + 1 , posicion.y())
  }
}
object izquierda{
  method name(){
    return ""
  }
  method mover(pj){
    if(pj.puedeMoverseA(self.siguientePosicion(pj.position()))){
      pj.position(self.siguientePosicion(pj.position()))
      pj.estadoDeMartina(self.name()) 
      pj.ultimaDireccion(self)
    }
  }
  method siguientePosicion(posicion){
    return game.at(posicion.x() - 1 , posicion.y())
  }
}
object arriba{
  method name(){
    return ""
  }
  method mover(pj){
    if(pj.puedeMoverseA(self.siguientePosicion(pj.position()))){
      pj.position(self.siguientePosicion(pj.position()))
      pj.estadoDeMartina(self.name()) 
      pj.ultimaDireccion(self)
    }
  }
  method siguientePosicion(posicion){
    return game.at(posicion.x(), posicion.y() + 1)
  }
}
object abajo{
  method name(){
    return ""
  }
  method mover(pj){
    if(pj.puedeMoverseA(self.siguientePosicion(pj.position()))){
      pj.position(self.siguientePosicion(pj.position()))
      pj.estadoDeMartina(self.name()) 
      pj.ultimaDireccion(self)
    }
  }
  method siguientePosicion(posicion){
    return game.at(posicion.x(), posicion.y() -1)
  }
}