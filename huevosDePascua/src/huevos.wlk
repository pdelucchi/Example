object huevoReposteria{
	var cantidad = 1
	var listaTipo = [chocolateBlanco.tipo()]
	var calorias = 750
	method cantidad(){
		return cantidad
		
		//return 750
	}
	method hechoDe(){
		return listaTipo
	}
	method caloriasQueAporta(){
		return calorias
	}
	method caloriasChocolateBlanco(){
		return calorias
	}
	method esComestible(persona){
		return persona.leGusta(self)
	}
	method esAmargo(){
		return false
	}
	
}

object huevoKinder {
	var cantidad = 1
	var listaTipo = [chocolateBlanco.tipo(),chocolateConLeche.tipo()]
	var calorias = 0
	var caloriasBlanco = 400
	var caloriasLeche = 500
	method cantidad(){
		return cantidad
	}
	method hechoDe(){
		return listaTipo
	}
	method caloriasQueAporta(cantidadHuevos){
		return calorias += caloriasBlanco + caloriasLeche
	}
	method caloriasChocolateBlanco(){
		return caloriasBlanco
	}
	method esComestible(persona){
		return persona.leGusta(self)
	}
	method esAmargo(){
		return listaTipo.any({tipo => tipo == "amargo"})
	}
}

object conejoChocolate {
	var cantidad = 1
	var listaTipo = [chocolateAmargo.tipo()]
	var peso = 100
	var caloriasAportadas = peso*10
	method cantidad(){
		return cantidad
	}
	method hechoDe(){
		return listaTipo
	}
	method caloriasQueAporta(cantidadHuevos){
		return caloriasAportadas
	}
	method cuantoPesa(){
		return caloriasAportadas	
		}
	method caloriasChocolateBlanco(){
		return 0
	}
	method esComestible(persona){
		return persona.leGusta(self)
	}
	method esAmargo(){
		return listaTipo.any({tipo => tipo == "amargo"})
	}
}

object blisterHuevitos{
	var cantidad = 10
	var listaTipo = [chocolateBlanco.tipo(),chocolateConLeche.tipo()]
	var calorias = 0
	var caloriasBlancas = 0
	var caloriasBlanco = 150
	var caloriasLeche = 100
	method cantidad(){
		return cantidad
	}
	method hechoDe(){
		return listaTipo
	}
	method esAmargo(){
		return listaTipo.any({tipo => tipo == "amargo"})
	}
	method caloriasQueAporta(huevosLeche){
		caloriasBlancas = caloriasBlanco*(huevosLeche.div(5))
		calorias = caloriasLeche*huevosLeche + caloriasBlancas
		return calorias
	} 
	method caloriasChocolateBlanco(){
		return caloriasBlancas
	}
	method esComestible(persona){
		return persona.leGusta(self)
	}
}

object matrioshkaArbol{
	var cantidad = 1
	var listaTipo = [chocolateAmargo.tipo(),chocolateConLeche.tipo()]
	var caloriasAportadas = 3000
	method cantidad(){
		return cantidad
	}
	method hechoDe(){
		return listaTipo
	}
	method caloriasQueAporta(huevosLeche){
		caloriasAportadas += (conejoChocolate.caloriasQueAporta(1) + 150)
		return caloriasAportadas
	}	
	method caloriasChocolateBlanco(){
		return 0
	}
	method esComestible(persona){
		return persona.leGusta(self)
	}
	method esAmargo(){
		return listaTipo.any({tipo => tipo == "amargo"})
	}
}

object matrioshkaFlor{
	var cantidad = 1
	var petalos = 5
	var listaTipo = [chocolateAmargo.tipo(),chocolateConLeche.tipo()]
	var caloriasAportadas = 3000
	method cantidad(){
		return cantidad
	}
	method hechoDe(){
		return listaTipo
	}
	method caloriasQueAporta(cantidadHuevos){
		caloriasAportadas += (huevoKinder.caloriasQueAporta(1) + (petalos*100))
		return caloriasAportadas
	}	
	method caloriasChocolateBlanco(){
		return 0
	}
	method esComestible(persona){
		return persona.leGusta(self)
	}
	method esAmargo(){
		return listaTipo.any({tipo => tipo == "amargo"})
	}
}

object chocolateConLeche{
	var conLeche = "conLeche"
	method tipo(){
		return conLeche
	}
}

object chocolateBlanco{
	var blanco = "blanco"
	method tipo(){
		return blanco
	}
}

object chocolateAmargo{
	var amargo = "amargo"
	method tipo(){
		return amargo
	}
}

object ana {
	var lista = []
	var lista2 = []
	method leGusta(huevo){
		return !huevo.esAmargo()
	}


method encontrar(listaHuevos){
	lista.addAll(listaHuevos)
}
method huevosEncontrados(){
	return lista
}
method comerHuevos(){
	lista2 = lista.filter({huevo => huevo.esComestible(self)})
	lista.clear()
	}
	method seVaAEnfermar(){
		return lista2.size() > 1
	}
	method estaContento(){
		return (!self.seVaAEnfermar() && lista2.size() >= 1)
	}
	method encontrarPrimerHuevo(){
		lista.add(listaDeHuevos.retornarPrimero())
		listaDeHuevos.restarPrimero()
	}
	method encontrarEspecifico(huevo){
		lista.add(huevo)
		listaDeHuevos.restarEspecifico(huevo)
	}
	method encontrarLoQueResta(){
		lista.addall(listaDeHuevos.retornarTodo())
		listaDeHuevos.restarTodo()
	}
}

object jose{
	var lista = []
	var lista2 = []
	var sumatoria = 0
	method leGusta(huevo){
		return huevo.caloriasChocolateBlanco() < 400
	}


method encontrar(listaHuevos){
	lista.addAll(listaHuevos)
}
method huevosEncontrados(){
	return lista
}
method comerHuevos(){
	lista2 = lista.filter({huevo => huevo.esComestible(self)})
	lista.clear()
	sumatoria = lista2.sum({huevo => huevo.caloriasQueAporta(huevo.cantidad())})
	}
	method seVaAEnfermar(){
		return sumatoria > 5000
	}
	method estaContento(){
		return (!self.seVaAEnfermar() && lista2.size() >= 1)
	}
	method encontrarPrimerHuevo(){
		lista.add(listaDeHuevos.retornarPrimero())
		listaDeHuevos.restarPrimero()
	}
	method encontrarEspecifico(huevo){
		lista.add(huevo)
		listaDeHuevos.restarEspecifico(huevo)
	}
	method encontrarLoQueResta(){
		lista.addall(listaDeHuevos.retornarTodo())
		listaDeHuevos.restarTodo()
	}
}

object tito{
	var lista = []
	var lista2 = []
	var sumatoria = 0
	method leGusta(huevo){
		return huevo.caloriasChocolateBlanco() < 400
	}


method encontrar(listaHuevos){
	lista.addAll(listaHuevos)
}
method huevosEncontrados(){
	return lista
}
method comerHuevos(){
	lista2 = lista.filter({huevo => huevo.esComestible(self)})
	lista.clear()
	sumatoria = lista2.sum({huevo => huevo.caloriasQueAporta(huevo.cantidad())})
	}
	method seVaAEnfermar(){
		return sumatoria > 100
	}
	method estaContento(){
		return (!self.seVaAEnfermar() && lista2.size() >= 1)
	}
	method encontrarPrimerHuevo(){
		lista.add(listaDeHuevos.retornarPrimero())
		listaDeHuevos.restarPrimero()
	}
	method encontrarEspecifico(huevo){
		lista.add(huevo)
		listaDeHuevos.restarEspecifico(huevo)
	}
	method encontrarLoQueResta(){
		lista.addall(listaDeHuevos.retornarTodo())
		listaDeHuevos.restarTodo()
	}
}

object listaDeChicos{
	var lista = [ana,jose,tito]
	method estanContentos(){
		return lista.map({nene => nene.estaContento()})
	}
}

object listaDeHuevos{
	var lista = [huevoReposteria,huevoKinder,blisterHuevitos,conejoChocolate,matrioshkaArbol,matrioshkaFlor]
	method cuantosFaltan(){
		return lista.size()
	}
	method retornarPrimero(){
		return lista.head()
	}
	method restarPrimero(){
		lista.remove(lista.head())
	}
	method restarEspecifico(huevo){
		lista.remove(huevo)
	}
	method retornarTodo(){
		return lista
	}
	method restarTodo(){
		lista.clear()
	}
}