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
object enemigo2{
    var property position = game.at(3,3)
    var property direccion = arriba
    method image(){
        return "enemy-" + direccion.name() + ".png"
    }
    method perseguir(objetivo) {
    const dx = objetivo.position().x() - self.position().x()
    const dy = objetivo.position().y() - self.position().y()

    const distancia = self.raizCuadrada(dx*dx + dy*dy)

    if (distancia > 0) {
        self.position(
        game.at(self.position().x() + (dx / distancia),self.position().y() + (dy / distancia))
        )
    }
}

method raizCuadradaIter(n, x, iter) {
    if (iter == 0) {
        return x
    } else {
        return self.raizCuadradaIter(n, (x + n / x) / 2, iter - 1)
    }
}

method raizCuadrada(n) {
    return self.raizCuadradaIter(n, n / 2.0, 10)   // empezamos con n/2 y 10 pasos
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