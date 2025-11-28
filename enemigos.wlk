import martina.*
import escenario.*

class PlantillaEnemigo{
    var property image 
    var property position
    const manager = managerListasDeSala
    var property direccion = derechaEnemigo
    
    method interactuarCon(pj){
        pj.decrementarEnUnoVidas()
    }
    
    method chocarCon(objeto) {
      manager.removerAlEnemigo(self)
      game.removeVisual(self)
    }



}//Usarlo como plantilla, dejando un method del comportamiento individual 
class EnemigoPatrulla inherits PlantillaEnemigo{

     method cambiarDireccion(){
        direccion = [derechaEnemigo,izquierdaEnemigo,abajoEnemigo,arribaEnemigo].anyOne()
    }
    method avanzar(){
        if(!manager.hayMuroEn(direccion.siguientePosition(position)) && !manager.hayPuertaEn(direccion.siguientePosition(position)))
        self.position(direccion.siguientePosition(self.position()))
    }
}

class EnemigoPerseguidor inherits PlantillaEnemigo{
     method perseguir(objetivo){
       movimientoPersecutor.perseguirConA(self, martina)
    }
}
object movimientoPersecutor {
    var property manager = managerListasDeSala

    method perseguirConA(persecutor , perseguido){
        const posPr = persecutor.position()
        const posPs = perseguido.position()
        
        if(self.distanciaDeXesMayorQueYEntre(persecutor, perseguido)){
            self.moverseEnX(persecutor, posPr, posPs)
        }else{
            self.moverseEnY(persecutor, posPr, posPs)
        }
       
    }

    //Saca la distancia entre el persecutor y el perseguido en el eje X y se asegura con abs que sea un valor absoluto
    method distanciaEntreEnEjeX(persecutor , perseguido){
        return (persecutor.position().x() - perseguido.position().x()).abs()
    }

    //Saca la distancia entre el persecutor y el perseguido en el eje Y y se asegura con abs que sea un valor absoluto
    method distanciaEntreEnEjeY(persecutor , perseguido){
        return (persecutor.position().y() - perseguido.position().y()).abs()
    }

    //Indica si la distancia entre el persecutor y el perseguido es mayor en el eje X 
    method distanciaDeXesMayorQueYEntre(persecutor, perseguido){
        return self.distanciaEntreEnEjeX(persecutor, perseguido) > self.distanciaEntreEnEjeY(persecutor, perseguido) 
    }

    //Hace que el persecutor se mueva hacia la posicion que mas le convenga en Y para acercarse al perseguido 
    method moverseEnY(persecutor , posPr , posPs){
        if(posPr.y() > posPs.y() && !manager.hayMuroEn(posPr.down(1))){
            persecutor.position(posPr.down(1))
       }else if(posPr.y() < posPs.y() && !manager.hayMuroEn(posPr.up(1))) {
            persecutor.position(posPr.up(1))
       }
    }

    //Hace que el persecutor se mueva hacia la posicion que mas le convenga en X para acercarse al perseguido 
    method moverseEnX(persecutor, posPr, posPs){
        if(posPr.x() > posPs.x() && !manager.hayMuroEn(posPr.left(1))){
            persecutor.position(posPr.left(1))
       }else if(posPr.x() < posPs.x()&& !manager.hayMuroEn(posPr.right(1))) {
            persecutor.position(posPr.right(1))
       }
    }
}
class DireccionEnemigo inherits Direccion{

    override method mover(enemigo){
        enemigo.posicion(self.siguientePosicion(enemigo.posicion()))
    }
    method siguientePosition(posicion){
        return
    }
}
object derechaEnemigo inherits DireccionEnemigo {
    override method name(){
        return "-derecha"
    }
    override method siguientePosition(posicion){
        return game.at(posicion.x()+1,posicion.y())
    }
 
}
object izquierdaEnemigo inherits DireccionEnemigo {
    override method siguientePosition(posicion){
        return game.at(posicion.x()-1,posicion.y())
    }
}
object abajoEnemigo inherits DireccionEnemigo {
    override method siguientePosition(posicion){
        return game.at(posicion.x(),posicion.y()-1)
    }
}
object arribaEnemigo inherits DireccionEnemigo {
    override method siguientePosition(posicion){
        return game.at(posicion.x(),posicion.y()+1)
    }
}

