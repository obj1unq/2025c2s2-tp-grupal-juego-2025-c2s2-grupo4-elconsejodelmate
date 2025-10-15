import enemigos.*
import martina.*
/*object proyectil {
    var property position = martina.position()
    var property direccion = self.nombre(martina.estadoDeMartina())
    method image(){
        return "martina-proyectil.png"
    }
    method arrojarse(){
        if(!self.estaEnBorde(direccion.siguientePosition(position)))
        self.position(direccion.siguientePosition(self.position()))
    }
    method estaEnBorde(positionDestino){
		return positionDestino.x() == -1 || positionDestino.x() == 15 || positionDestino.y() == -1 || positionDestino.y() == 15
    }
    method nombre(direccionDada){
        if (direccionDada == "up"){
        return arriba}
        else if (direccionDada == "down"){
            return abajo 
        } else if (direccionDada == "right"){
            return derecha
        } else {return izquierda}
    }
}*/

object pocionVida {
    //const personaje = martina
    var property position = game.at(8,8)
    method image(){
        return "pocion.png" //es de prueba
    }
    /*method interactuarConMartina(){
        personaje.incrementarEnUnoVidasDeMartina()
    }*/
    method interactuarCon(pj){
        pj.incrementarEnUnoVidasDeMartina()
        game.removeVisual(self)
    }
}
class PocionVida{
    var property position = game.origin()
    var property image = "pocion.png"

    method interactuarCon(pj){
        pj.incrementarEnUnoVidas()
        game.removeVisual(self)
    }
}