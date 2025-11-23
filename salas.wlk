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
                  
  override method salaIzquierda(){
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
  method sala(){
    return        [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, c, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, c, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, c, v, v, v, c, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, c, v, v, m],
                    [m, v, c, v, v, c, v, v, v, v, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, c, v, v, v, v, m],
                    [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                    [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()
  }
}     


