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
        self.position(direccion.siguientePosition(self.position()))
    }
}
object derecha {
    method name(){
        return "right"
    }
    method mover(enemigo){
        enemigo.right(1)
    }
}
object izquierda {
    method mover(enemigo){
        enemigo.position(self.siguientePosition(enemigo.position()))
    }
    method siguientePosition(position){
        return game.at(position.x()-1,position.y())
    }
}
object abajo {
    method mover(enemigo){
        enemigo.position(enemigo.position().x(),enemigo.position().y()-1)
    }
}
object arriba {

}

//primero comiteo lo de mi branch
//voy al master y pull
//voy a mi branch y merge con master
//asi traigo lo de master para trabajar en mi branch