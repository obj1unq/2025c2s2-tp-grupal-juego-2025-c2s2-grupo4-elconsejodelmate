import escenario.*
import martina.*
import modeladoMapa.*


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
    return salaDerecha
  }

  method sala(){
    return      [ [m, m, m, m, m, m, pa, m, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, a, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, b, v, c, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, pd],
                  [m, v, v, v, v, v, v, t, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, a, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
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
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, v, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, v, v, v, v, v, m],
                  [m, v, v, v, v, v, t, t, t, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, pd, m, m, m, m, m, m, m]].reverse()
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
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, c, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, c, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, c, v, v, v, c, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [pd, v, v, v, v, v, v, v, v, v, v, v, v, v, pi],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, c, v, v, m],
                    [m, v, c, v, v, c, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, c, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
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

  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [pi, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
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
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, b, v, v, v, v, v, v, m],
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