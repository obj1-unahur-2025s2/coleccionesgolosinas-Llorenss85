import sabores.*

class Golosina{
    const precio
    const sabor
    var peso
    method contieneGluten() 
    method mordisco() 
    method peso() =peso
    method precio() = precio
    method sabor() =sabor 
}

class Bombon inherits Golosina(precio=5,peso=15,sabor=frutilla){
    override method contieneGluten() = false
    override method mordisco() {
        peso=(peso*0.8)-1
    }
}

class Alfajor inherits Golosina(precio=12, peso=300,sabor=chocolate){
    override method contieneGluten() =true  
    override method mordisco() {
        peso=peso *0.8
    }
}

class Caramelo inherits Golosina(precio=1, peso=5, sabor =frutilla){
    override method contieneGluten()=false 
    override method mordisco(){
        peso-=1
    }
}

class Chupetin inherits Golosina(precio=2, peso=7 , sabor=naranja){
    override method contieneGluten()=true 
    override method mordisco(){
        if(self.puedePerderPeso()){
            peso=peso * 0.1
        }
    }
    method puedePerderPeso()= peso>2


}
class Oblea inherits Golosina(precio=5,peso=250,sabor=vainilla ){
    override method contieneGluten() = true 
    override method mordisco(){
        peso= self.cantidadAPerder()
    }
    method cantidadAPerder() =if (peso>50) (peso/2) else peso *0.85 
     
}
class Chocolatin inherits Golosina(sabor=chocolate){
    var pesoInicial
    method asignarPeso(unPeso) {
      peso=unPeso
      pesoInicial=unPeso
    }
    override method precio() =0.5 * pesoInicial
    override method contieneGluten()=true 

    override method mordisco() {
      peso-=2
    }
}


class GolosinaBañada inherits Golosina {
  const golosinaBase
  override method peso()= golosinaBase.peso() + bañadoGolosina.peso()
  override method precio() =golosinaBase.precio() +2
  override method  sabor()= golosinaBase.sabor()
  override method contieneGluten() =golosinaBase.contieneGluten() 
  override method mordisco() {
    golosinaBase.mordisco()
    bañadoGolosina.gastoBañado()
  }

}

object bañadoGolosina {
    var peso=2
    method gastoBañado() {
        if(self.puedePerderPeso()){
            peso-=2
        }
    } 
    method puedePerderPeso() = peso>0 
    method peso() =peso 
}



class PastillaTuttiFrutti inherits Golosina(peso=5){
    const sabores=[frutilla,chocolate,naranja]
    var saborActual=frutilla
    const esLibreDeGulten
    override method contieneGluten() = esLibreDeGulten 
    override method precio() =self.precioActual()
    method precioActual() = if (esLibreDeGulten) 7 else 10  
    override method  mordisco() {
        saborActual=self.obtenerSabor()
    }
    method obtenerSabor() {
        sabores.add(sabores.first())
        sabores.remove(sabores.first())
        return sabores.first()
    } 
    method saborActual() =saborActual 
}