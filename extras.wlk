object piedra {
    var property position = martina.position()
    var property direccion = estadoDeMartina

    method arrojarse(){
        if(!self.estaEnBorde(direccion.siguientePosition(position)))
        self.position(direccion.siguientePosition(self.position()))
    }
    method estaEnBorde(positionDestino){
		return positionDestino.x() == -1 || positionDestino.x() == 15 || positionDestino.y() == -1 || positionDestino.y() == 15
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
}