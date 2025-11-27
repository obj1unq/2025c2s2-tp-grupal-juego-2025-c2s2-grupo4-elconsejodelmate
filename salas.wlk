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

  override method salaMedia(){
    return salaMedia
  }

  override method salaIzquierda(){
    return salaIzquierda
  }

  method sala(){
    return      [ [m, m, m, m, m, m, pm, m, m, m, m, m, m, m, m],
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

object salaIzquierda inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(13,7)
  }

  override method salaDerecha(){
    return  salaDeCofres
  }
  override method salaIzquierda(){
    return  salaMixta
  }
  override method salaMedia(){
    return salaGanar
  }
  override method cantDeEnemigos(){
    return 3
  }
  method sala(){
    return        [ [m, m, m, m, m, m, m, pd, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, d1, v, v, v, c, v, v, v, v, d3, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, d3, v, m],
                    [m, v, v, c, v, v, v, v, v, v, v, v, v, d3, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, d1, d3,d1, v, v, v, v, v, m],
                    [pm,v, v, v, v, d1, d3,d2,d3, d1, v, v, v, v,m],
                    [m, v, v, v, v, v, d1, d3,d1, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, a, v, v, v, v, v, m],
                    [m, v, v, c, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, b, v, v, m],
                    [m, m, m, m, m, m, m, pi, m, m, m, m, m, m, m]].reverse()
  }//d1 = piedras , d2 = pentagrama , d3 = Huesos
}   

object salaMedia inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(7,1)
  }

  override method salaIzquierda(){
    return  salaMixta
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
    return salaDeCofres 
  }

  method sala(){
    return      [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, d3, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, t, v, v, v, v, d1, v, v, v, d1, v, m],
                  [m, v, v, v, v, t, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, t, v, v, v, v, d3, m],
                  [m, v, d1, v, v, v, t, t, t, v, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, d3, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, d3, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, t, t, t, v, v, v, v, v, v, v, v, v, m],
                  [m, v, d1, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, d3, d3, v, v, v, v, v, v, v, v, d1, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, pd, m, m, m, m, m, m, m]].reverse()
  }
}

object salaMixta inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(13,7)
  }

  override method salaDerecha(){
    return  salaEnemigosPro
  }
  override method salaIzquierda(){
    return  salaTrampa
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, pd, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, d1, d3, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, d3, m],
                    [m, v, v, v, v, v, v, a, a, v, v, c, v, v, m],
                    [m, v, v, b, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, c, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, c, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, t, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, d3, d1, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, d3, d3, v, v, v, v, v, b, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, pi, m, m, m, m, m, m, m]].reverse()
  }
}   

object salaDeCofres inherits Sala(){

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
    return salaEnemigos
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, d3, d3, m],
                    [m, v, v, v, v, v, c, v, v, v, v, v, v, d3, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, c, v, m],
                    [m, v, v, v, d1, v, v, v, v, v, v, d3, v, v, m],
                    [m, v, v, c, v, v, v, c, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [pd, v, v, v, v, v, v, v, v, v, v, v, v, v, pi],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, d1, d3, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, c, v, v, m],
                    [m, v, c, v, v, c, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, c, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, d1, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}     



object salaEnemigos inherits Sala(){

  override method dibujoDeSala(){
    return self.sala()
  }

  override method posicionDeMartina(){
    return game.at(1,7)
  }

  override method salaDerecha(){
    return salaGanar
  }

  override method cantDeEnemigos(){
    return 4
  }

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, d3, d3, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, d3, v, v, v, v, v, m],
                    [m, v, v, v, t, v, v, v, v, v, v, c, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, d1, v, v, v, v, v, v, v, v, d1, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, pd],
                    [m, v, v, v, v, c, v, d3, v, t, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, d3, t, m],
                    [m, v, v, v, t, d1, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
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


  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, b, v, v, v, v, d1, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, c, v, v, d1, d3, d1, v, v, v, v, v, m],
                    [m, v, v, v, v, d1, d3, g, d3, d1, v, v, v, v, m],
                    [m, v, v, v, v, v, d1, d3, d1, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, c, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, d1, v, m],
                    [m, v, v, v, v, c, v, v, v, v, v, d1, v, v, m],
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
                    [m, v, d3, v, v, v, v, v, v, v, v, v, d3, v, m],
                    [m, d3, v, c, v, v, v, v, v, v, v, v, v, d3, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, d1, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, d3, d1, d3, v, v, v, v, v, m],
                    [m, v, v, v, v, d3, d1, ng, d1, d3, v, v, v, v, m],
                    [m, v, v, v, v, v, d3, d1, d3, v, v, d1, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, a, v, v, v, c, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, c, v, v, v, m],
                    [m, v, v, v, b, v, v, v, v, v, v, v, v, v, m],
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

  override method cantDeEnemigos(){
    return 4
  }
  
  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, d3, d3, m],
                    [m, c, d1, v, v, v, v, v, v, v, v, v, v, d3, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, a, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, c, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, d3, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, pd],
                    [m, v, v, v, v, v, v, v, v, v, v, v, c, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, a, v, d1, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, c, v, v, v, v, v, b, v, m],
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