import sabores.*

object mariano {
    const bolsaDeGolosina=[]
    method comprarGolosina(unaGolosina) {
        bolsaDeGolosina.add(unaGolosina)
    }
    method desecharGolosina(unaGolosina) {
      bolsaDeGolosina.remove(unaGolosina)
    }
    method cantidadDeGolosinas() = bolsaDeGolosina.size()
    method tieneLaGolosina(unaGolosina) =bolsaDeGolosina.any({g=> g==unaGolosina})  
    method probarGolosina(unaGolosina) {
      bolsaDeGolosina.forEach({ g => g.mordisco()})
    }
    method hayGolosinaSinTac() = bolsaDeGolosina.any({ g => !g.contieneGluten()}) 
    method preciosCuidados() =bolsaDeGolosina.all({g=> g.precio() <= 10})
    method golosinasDeSabor(unSabor) =bolsaDeGolosina.filter({g=> g.sabor()==unSabor})   
    method golosinaDeSabor(unSabor) =self.golosinasDeSabor(unSabor).first()
    method sabores() =bolsaDeGolosina.map({ g=>g.sabor()}).asSet() 
    
    method golosinaMasCara() =bolsaDeGolosina.max({g => g.precio()}) 
    method pesoGolosina() =bolsaDeGolosina.map({g=> g.peso()}) 

    method golosinasFaltantes(golosinasDeseadas) =bolsaDeGolosina.asSet().intersection(golosinasDeseadas) 
    method gustosDeseados(gustosDeseados) =self.sabores().intersection(gustosDeseados) 
}