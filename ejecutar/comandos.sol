//Abrir consola de truffle para ejecutar comandos
truffle console
//Variable de instancia
Arrendamiento = Arrendamiento.deployed()
//Crear inquilinos
Arrendamiento.then(function(instance){ return instance.registrarNuevoInquilino("1720242187","Andres Castro")})
Arrendamiento.then(function(instance){ return instance.registrarNuevoInquilino("1720242179","Carlos Tapia")})
//para comprobar que si se creo
//obtenerInquilino
Arrendamiento.then(function(instance){ return instance.obtenerInquilino("1720242187")})
//obtenerListaTodoslosInquilinos
Arrendamiento.then(function(instance){ return instance.obtenerListaDeInquilinos()})


//Inmuebles
Arrendamiento.then(function(instance){ return instance.registrarNuevoInmueble("inmueble01","Departamento con 3 dormitorios, sala, cocina y baño independiente","Norte de Quito Conjunto privado con servicio de guardianía","lavandería propia, instalación para lavadora, patio independiente, tv cable gratuito", false)})
Arrendamiento.then(function(instance){ return instance.registrarNuevoInmueble("inmueble02","Casa amoblada con 5 dormitorios, estudio, cuarto de maquinas, balcón, sala, cocina, 3 baños","Guayllabamba barrio esperanza y progreso","vista al lago, piscina, area BBQ, internet incluido", true)})
//obtenerInmueble
Arrendamiento.then(function(instance){ return instance.obtenerInmueble("inmueble02")})
Arrendamiento.then(function(instance){ return instance.obtenerListaDeInmuebles()})
obtenerInmueble(string memory idInmueble)

//Arriendo
Arrendamiento.then(function(instance){ return instance.registrarArriendo(250, 500, true, true,"inmueble01","1720242187" )})
Arrendamiento.then(function(instance){ return instance.registrarArriendo(300, 600, true, true,"inmueble02","1720242179" )})
unction registrarArriendo(uint precio, uint garantia, bool arriendoPagado, 
  bool garantiaPagada, string memory idInmueble, string memory cedula) public returns (bool correcto){ 
//ObtenerArriendo
Arrendamiento.then(function(instance){ return instance.obtenerListaDeArriendos()})
