import escenario.*
import extras.*
object martina {
  var property position = game.at(7,1)
  var property estadoDeMartina =  ""
  var property cantDeVidas = 3
  var property ultimaDireccion = arriba 
  const property inventario = []
  var property puntos = 0 

  var property nivel = nivel0
  var property obstaculosNivel = nivel.obtenerObstaculos()
  var property murosNivel = nivel.obtenerMuros()

  method incrementarEnUnoVidas(){
    cantDeVidas = cantDeVidas + 1 //quiza medio redundante pero es mas facil de leer
  }
  method decrementarEnUnoVidas(){
    cantDeVidas = cantDeVidas -1
  }
  method image(){
    return "martina" + estadoDeMartina + ".png"
  }
  method estaMuerta(){
    return self.cantDeVidas() <= 0
  }
  // que el juego termine en decrementarEnUnoVidasDeMartina
  method estaViva(){
    return self.cantDeVidas() > 0
  }
  method moverA(nuevaDireccion){
    if(self.estaViva() && self.puedeMoverseA(nuevaDireccion)){
      self.position(nuevaDireccion)
    }
  }
  method disparar(){
    const flecha = new Flecha(position = self.position(),direccion= self.ultimaDireccion())
    flechas.agregar(flecha)
  }
  
  method hayMuroEn(nuevaDireccion){
    return murosNivel.any({muro => muro.position() == nuevaDireccion})
  }
  method hayObstaculoEn(nuevaDireccion){
    return obstaculosNivel.any({obstaculo => obstaculo.position() == nuevaDireccion})
  }
  method puedeMoverseA(nuevaDireccion){
    return !self.hayMuroEn(nuevaDireccion) && !self.hayObstaculoEn(nuevaDireccion)
  }
  method añadirAlInventario(objeto){
    inventario.add(objeto)
    game.say(self, "Añadi al inventario " + objeto)
  }
  method sumarPuntuacionDe(objeto){
    puntos = puntos + objeto.puntos()
  }
  method tieneObjeto(objeto){
    return inventario.contains(objeto)
  }
  
}
object config{
  method configTeclas(){
    keyboard.w().onPressDo({arriba.mover(martina)})
    keyboard.a().onPressDo({izquierda.mover(martina)})
    keyboard.s().onPressDo({abajo.mover(martina)})
    keyboard.d().onPressDo({derecha.mover(martina)})
    keyboard.f().onPressDo({martina.disparar()})
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