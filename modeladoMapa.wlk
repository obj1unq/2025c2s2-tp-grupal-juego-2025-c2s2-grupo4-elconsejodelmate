import martina.*
import enemigos.*
import extras.*
import salas.*
import interfaz.*
import escenario.*

//  OBJETOS QUE MODELAN EL MAPA DE LA SALA  //

//Puerta
object pd{ //puerta arriba
  const manager = managerListasDeSala

  method dibujar(posicion){
    const sala = salaActual.salaActual()
    const puerta = new Puerta(position = posicion, salaADondeDirige = sala.salaDerecha() )

    game.addVisual(puerta)
    manager.agregarPuerta(puerta)
  }
}

object pi{ //puerta izquierda
  const manager = managerListasDeSala

  method dibujar(posicion){
    const sala = salaActual.salaActual()
    const puerta = new Puerta(position = posicion, salaADondeDirige = sala.salaIzquierda() )

    game.addVisual(puerta)
    manager.agregarPuerta(puerta)
  }
}
object pa{ //puerta adelante
  const manager = managerListasDeSala
  

  method dibujar(posicion){
    const sala = salaActual.salaActual()
    const puerta = new Puerta(position = posicion, salaADondeDirige = sala.salaArriba() )

    game.addVisual(puerta)
    manager.agregarPuerta(puerta)
  }
}

//Cofre
object c {
  const manager = managerListasDeSala

  method dibujar(posicion){
    const cofre = new Cofre(position = posicion)

    game.addVisual(cofre)
    manager.agregarCofre(cofre)
  }
}

//Barril
object b{
  var property manager = managerListasDeSala
  method dibujar(posicion){
    const barril = new Barril(position = posicion)
    game.addVisual(barril)
    manager.agregarObstaculo(barril)
  }
}

//Ataud
object a{
  var property manager = managerListasDeSala

  method dibujar(posicion){
    const ataud = new Ataud(position = posicion)

    game.addVisual(ataud)
    manager.agregarObstaculo(ataud)
  }
}

//Trampa
object t{
  var property manager = managerListasDeSala
  method dibujar(posicion){
    const trampa = new Trampa(position = posicion)

    game.addVisual(trampa)
    manager.agregarTrampa(trampa)
  }
  
}

//Muro
object m{

  var property manager = managerListasDeSala
  method dibujar(posicion){
    const muro = new Muro(position = posicion)
    game.addVisual(muro)
    manager.agregarMuro(muro)
  }

}

//Vacio
object v{
  method dibujar(posicion){

  }
}

// CLASES DE LOS OBJETOS DEL MAPA //

class Muro{
  var property position
  var property image = "pared1.png"
  
  method chocarCon(objeto){
    //method de la colision de la flecha
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
    //method de la colsion con la flecha
  }
}

class Obstaculo{
  var property position  
  method image()
  method chocarCon(objeto){
    //method de la colision de la flecha
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
  var property position
  const property poolDeObjetos = []
  var property estado = cofreCerrado  

  method image(){
    return estado.image()
  }
  method abrir(){
    estado = estado.siguienteEstado()
  }

  method inicializarPoolObjetos(){

    const pocionVida = new PocionVida(position = self.position())
    const pocionVenenosa = new PocionVenenosa(position = self.position())
    const anillo = new Anillo(position = self.position())
    const collar = new Collar(position = self.position())
    //const llave = new Llave(position = self.position())
    poolDeObjetos.add(pocionVida)
    poolDeObjetos.add(pocionVenenosa)
    poolDeObjetos.add(anillo)
    poolDeObjetos.add(collar)
    //poolDeObjetos.add(llave)
  }
  method seleccionarObjeto(listaDeObjetos){
    return poolDeObjetos.anyOne()
  }

  method interactuarCon(pj){
    if(estado.image() == "cofre-cerrado.png"){ 
        self.inicializarPoolObjetos()
        self.seleccionarObjeto(poolDeObjetos).interactuarCon(pj)
        self.abrir()
    }
  }
  method chocarCon(objeto){
    //method de la colision de la flecha
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
  const salaADondeDirige 
  
  method interactuarCon(pj){ 
    salaActual.cambiarASala(salaADondeDirige)
    salaActual.dibujarNuevaSala()
    
  }
  method chocarCon(objeto){
    //method de la colision de la flecha
  }

}


