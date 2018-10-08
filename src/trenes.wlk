class Fabrica {
	var property locomotoras = []
	
	method agregarLocomotora(unaLocomotora)
	  {
		locomotoras.add(unaLocomotora)
	  }
}

class Tren inherits Fabrica {
	var property vagones = []

	method agregarVagon(unVagon)
	 {
	 	vagones.add(unVagon)
	 }
 
	method pesoTotalVagones() = vagones.sum({ vagon => vagon.pesoMaximo() })
 
	method arrastreTotal() = locomotoras.sum({ locomotora => locomotora.arrastreReal() })
	
	method vagonesYLocomotoras() = [vagones, locomotoras].flatten()
	
	method esFormacionCompleja() {
		return self.vagonesYLocomotoras().size() > 20 ||
		       self.vagonesYLocomotoras().map({vyl => vyl.pesoMaximo()}).sum() > 10000
	}

}

class Deposito inherits Fabrica {
	 var property trenes = []
	 var vagonesPesados = []

	method agregarTren(unVagon)
	 {
	 	trenes.add(unVagon)
	 }
	 
	 method vagonesMasPesados() {
	 	trenes.forEach({tren => vagonesPesados.add( tren.vagones().max({vagon => vagon.pesoMaximo()}) )   })
	 	return vagonesPesados
	 }
	 
	 method hayFormacionCompleja(){
	 	return (trenes.any({ tren => tren.esFormacionCompleja() }))
	 }
	 	
	 	
}

class VagonPasajero {
	var property pasajeros = 2
	var ancho=0
	var largo=0
	
	method pesoMaximo()
	{
		return pasajeros*80
	}
	
	method cantidadPasajeros()
	{
		if (ancho <= 2.5)
		return largo*8
		else
		return largo*10
	}
}

class VagonCarga {
	var  cargaMaxima =0

	method pesoMaximo() = 160 + cargaMaxima 
	
}

class Locomotora 
{
	var property peso=0
	var property arrastreMaximo=0
	var property velocidad=0
	
	method arrastreReal() = arrastreMaximo - peso

	method esEficiente() = arrastreMaximo >= peso*5
}



