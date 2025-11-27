import escenario.*
import martina.*
import modeladoMapa.*
import interfaz.*

object salaInicial inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }
  
  override method posicionDeMartina(){
    return game.at(7,1)
  }
                    
  override method salaDerecha(){
    return salaDerecha
  }

  override method salaArriba(){
    return salaArriba
  }

  override method salaIzquierda(){
    return salaIzquierda1
  }
  /*PARA HACER EL MAPA COMPLETO, SE LE CAMBIARAN LOS NOMBRES A LAS SALAS POR DIRECCIONES, TOMANDO COMO REFERENCIA 
  LA SALA INICIAL, DESPUES CUANDO SE TERMINEN LOS MAPAS LES CAMBIAN LOS NOMBRES
  SALAS USADAS: 
  izquierda1 
  izquierda2
  salaGAnar no se puede usar*/
  method sala(){
    return      [ [m, m, m, m, m, m, pa, m, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, d3, m],
                  [m, v, d1, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, a, v, v, v, m],
                  [m, v, v, v, v, v, d3, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, b, v, c, v, v, v, v, v, v, v, v, v, m],
                  [pi, v, v, v, v, v, v, v, v, v, v, v, v, v, pd],
                  [m, v, v, v, v, v, v, t, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, d3, v, v, v, v, m],
                  [m, v, v, d1, v, v, v, v, v, v, v, a, v, v, m],
                  [m, d1, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, d3, d3, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
                
  }
                    
}

object salaIzquierda1 inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(13,7)
  }

 /* override method salaDerecha(){ aca iria la sala inicial en caso de poder volver 
    return  salaDeCofres
  }*/
  override method salaIzquierda(){
    return  salaIzquierda2
  }
  override method salaDerecha(){
    return salaInicial
  }
  //tambien iria la sala IzqAb3 en caso de poder volver 
 /* override method salaMedia(){
    return salaGanar
  }*/
  override method cantDeEnemigos(){
    return 3
  }
  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, d1, d3,d1, v, v, v, v, v, m],
                    [pi,v, v, v, v, d1, d3,d2,d3, d1, v, v, v, v,pd],
                    [m, v, v, v, v, v, d1, d3,d1, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, pi, m, m, m, m, m, m, m]].reverse()
  }//d1 = piedras , d2 = pentagrama , d3 = Huesos
}   
object salaIzquierda2 inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(13,7)
  }

  override method salaDerecha(){
    return  salaIzquierda1 
  }
  override method salaIzquierda(){
    return  salaGanar
  }
  override method salaArriba(){
    return salaArribaIzquierda2
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, pa, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [pi, v, v, v, v, v, v, v, v, v, v, v, v, v, pd],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}   

object salaArriba inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(7,1)
  }

  override method salaIzquierda(){
    return  salaArribaIzquierda
  }

  override method cantDeEnemigos(){
    return 2
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, d3, m],
                    [m, v, v, v, v, v, v, v, v, v, v, c, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, t, v, m],
                    [m, v, v, v, c, t, v, v, v, v, v, t, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, t, v, v, v, v, m],
                    [pi, v, v, v, v, v, v, v, v, c, t, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, d3, v, v, v, v, v, d3, m],
                    [m, v, v, t, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, t, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, c, v, v, v, v, t, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}   

object salaDerecha inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(1,7)
  }
                  
  override method salaDerecha(){
    return 
  }

  method sala(){
    return      [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, d3, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, d1, v, v, v, d1, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, d3, m],
                  [m, v, d1, v, v, v, t, t, t, v, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, d3, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, d3, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, d1, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, d3, d3, v, v, v, v, v, v, v, v, d1, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, pd, m, m, m, m, m, m, m]].reverse()
  }
}



object salaArribaIzquierda inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(7,13)
  }

  override method salaDerecha(){
    return  salaTrampa
  }
  override method salaIzquierda(){
    return salaArribaIzquierda2
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, d3, d3, m],
                    [m, v, v, v, v, v, c, v, v, v, v, v, v, d3, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, c, v, m],
                    [m, v, v, v, d1, v, v, v, v, v, v, d3, v, v, m],
                    [m, v, v, c, v, v, v, c, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [pi, v, v, v, v, v, v, v, v, v, v, v, v, v, pi],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, d1, d3, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, c, v, v, m],
                    [m, v, c, v, v, c, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, c, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, d1, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}     



object salaArribaIzquierda2 inherits Sala(){

 // const enemigosDeSala = enemigos

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(1,7)
  }


 /* override method salaDerecha(){
    return salaGanar
  }*/
  /*override method salaAbajo(){
    return salaIzquierda2
  }*/

  override method cantDeEnemigos(){
    return 4
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, t, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, pd],
                    [m, v, v, v, v, v, v, v, v, t, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, t, m],
                    [m, v, v, v, t, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, pab, m, m, m, m, m, m, m]].reverse()
  }
}


object salaTrampa inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(13,7)
  }
  
  override method salaIzquierda(){
    return salaPerder
  }
  override method cantDeEnemigos(){
    return 1
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, t, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, t, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, t, v, v, v, v, v, v, v, v, m],
                    [m, v, t, t, t, t, v, v, v, v, t, v, v, v, m],
                    [m, v, v, v, t, t, t, t, v, v, t, v, v, v, m],
                    [m, v, v, v, t, v, v, v, v, v, t, v, v, v, m],
                    [pi, v, v, v,t, v, v, v, t, v, v, t, v, v, m],
                    [m, v, v, v, t, v, v, v, t, v, v, v, t, v, m],
                    [m, v, t, v, t, v, v, v, t, v, v, v, v, v, m],
                    [m, v, t, v, t, v, v, v, v, v, t, t, t, t, m],
                    [m, v, v, v, t, v, v, v, v, v, t, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, t, t, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}


object salaGanar inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(13,7)
  }
  override method salaIzquierda(){
    return salaIzquierda2 
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, g, v, v, v, v, v, v, pi],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}


object salaPerder inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(1,7)
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, a, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}   

object salaEnemigosPro inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(7,1)
  }

  override method salaDerecha(){
    return  salaGanar
  }
  
  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, pd],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}   


/*
object sala inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at()
  }

  override method salaDerecha(){
    return  
  }
  override method salaIzquierda(){
    return  
  }
  override method salaArriba(){
    return
  }
  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}   

*/