import escenario.*
import martina.*

/*La salas tendrian que tener un method para su creacion y no recibirlas por una const asi quedaria mas prolijo*/
object salaInicial inherits Sala(
        sala = [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, a, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, b, v, c, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, p],
                  [m, v, v, v, v, v, v, t, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, a, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, v, v, v, v, v, v, v, v, v, v, v, v, v, m],
                  [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()){
                    override method siguiente(){
                      return salaDerecha
                    }
                    override method posicionDeMartina(){
                      return game.at(7,1)
                    }
                  }

object salaDerecha inherits Sala(
        sala = [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
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
                  [m, m, m, m, m, m, m, p, m, m, m, m, m, m, m]].reverse()){
                    override method posicionDeMartina(){
                      return game.at(1,7)
                    }
                    override method siguiente(){
                      return salaDeCofres 
                    }
                    // override method anterior(){
                    //   return salaInicial
                    // }
                  }


object salaDeCofres inherits Sala(
        sala = [ [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m],
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
                  [m, m, m, m, m, m, m, m, m, m, m, m, m, m, m]].reverse()){
                    
                    override method posicionDeMartina(){
                      return game.at(7,13)
                    }
                  }


