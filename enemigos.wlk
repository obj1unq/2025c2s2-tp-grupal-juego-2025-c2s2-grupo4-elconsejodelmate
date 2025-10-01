object enemigo1{
    var property position = game.at(2,2)
    var property direccion = derecha
    method image(){
        return "enemy-" + direccion.name() + ".png"
    }
    method cambiarDireccion(){
        direccion = [derecha,izquierda,abajo,arriba].anyOne()
    }
    method avanzar(){
        if(!self.estaEnBorde(direccion.siguientePosition(position)))
        self.position(direccion.siguientePosition(self.position()))
    }
    method estaEnBorde(positionDestino){
		return positionDestino.x() == -1 || positionDestino.x() == 15 || positionDestino.y() == -1 || positionDestino.y() == 15
	}
}
object derecha {
    method name(){
        return "right"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x()+1,position.y())
    }
 
}
object izquierda {
    method name(){
        return "left"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x()-1,position.y())
    }
}
object abajo {
    method name() {
        return "up-down"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x(),position.y()-1)
    }
}
object arriba {
   method name() {
        return "up-down"
    }
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x(),position.y()+1)
    }
}

//primero comiteo lo de mi branch y syncronize
//voy al master y pull
//voy a mi branch y merge con master
//asi traigo lo de master para trabajar en mi branch

//para subir mi rama a master, hago merge desde master y eligo mi rama