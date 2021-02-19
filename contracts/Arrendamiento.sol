//Definir versión de compilador
//pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;
//Importar funciones externas
import "./Utilidades.sol";

//Declaración de Smart Contract
contract Arrendamiento { 
  
  //Declarar variables 
  address propietario;
  //address propietario;
  mapping(address => Inmueble[]) inmueblesList;
  mapping(address => Inquilino[]) inquilinosList;
  mapping(address => Arriendo[]) arriendosList;
  /*
  address propietario;
  mapping(address => Titulo[]) titulosList;
  mapping(address => EstudianteTitulado[]) estudiantesTituladosList;
  mapping(address => Estudiante[]) estudiantesList;
  */
  //Inquilino, Contrato, Departamento. Fuera: Propietario.

  //Se ejecuta al inicio de cada transacción
  constructor() public {
    //asignar la dirección a la variable inquilino
    propietario = msg.sender;
  }

  //Estructura personalizada
  struct Inmueble {
    string idInmueble;
    string descripcion;
    string direccion;
    string prestaciones;
    bool amoblado;
    uint marcadeTiempo;
  }
  struct Inquilino {
    string cedula;
    string nombre;
    uint marcadeTiempo;
  }
  //id del inmueble, cedula del inmueble
  struct Arriendo {
    uint precio;
    uint garantia;
    uint marcadeTiempo;
    bool arriendoPagado;
    bool garantiaPagada;
    string idInmueble;
    string cedula;
    Inmueble inmueble;
    Inquilino inquilino;
  }

//DESDE AQUÍ FUNCIONES

  function registrarNuevoInquilino(string memory cedula, string memory nombre) public returns (bool correcto) { 
    if (!existeInquilino(cedula)){ 
      Inquilino memory nuevoInquilino = Inquilino({cedula:cedula, nombre:nombre, marcadeTiempo:now}); 
      inquilinosList[msg.sender].push(nuevoInquilino); return true;
    } 
    return false; 
  }

//modificador view no modifica los datos
  function existeInquilino(string memory cedula)public view returns (bool existe){ 
    for (uint i = 0; i<inquilinosList[msg.sender].length; i++){ 
      if (Utilidades.esIgual(inquilinosList[msg.sender][i].cedula,cedula)){ 
        return true; 
      } 
    } 
    return false; 
  }

  function registrarNuevoInmueble(string memory id, string memory descripcion, string memory direccion, string memory prestaciones, bool amoblado) public returns (bool correcto) {
    if (!existeInmueble(id)){ 
      Inmueble memory nuevoInmueble = Inmueble({idInmueble:id, descripcion:descripcion, direccion:direccion, 
      prestaciones:prestaciones, amoblado:amoblado, marcadeTiempo:now}); 
      inmueblesList[msg.sender].push(nuevoInmueble); return true;
    } 
    return false; 
  }
  function existeInmueble(string memory idInmueble)public view returns (bool existe){ 
    for (uint i = 0; i<inmueblesList[msg.sender].length; i++){ 
      if (Utilidades.esIgual(inmueblesList[msg.sender][i].idInmueble, idInmueble)){ 
        return true;
      } 
    } 
    return false; 
  }

  function registrarArriendo(uint precio, uint garantia, bool arriendoPagado, 
  bool garantiaPagada, string memory idInmueble, string memory cedula) public returns (bool correcto){ 
    uint indice=0; 
    //Verificar que cedula e idInmueble no estén vacíos.
    if (bytes(cedula).length != 0 && bytes(idInmueble).length != 0){ 
      //Se obtiene un inquilino en base al parámetro cedula
      (Inquilino memory inquilino, bool inquilinoRegistrado) = obtenerInquilino(cedula);
      //Se obtiene un inmueble en base al parámetro idInmueble
      (Inmueble memory inmueble, bool inmuebleRegistrado) = obtenerInmueble(idInmueble); 
      //Comprueba que los datos de inquilino e inmueble existan
      if (inquilinoRegistrado && inmuebleRegistrado){ 
        //Comprueba que arriendo y garantía esten pagados para iniciar un contrato de arrendamiento
        if(arriendoPagado && garantiaPagada){
          //Se crea el contrato de arrendamiento
          Arriendo memory arriendo = Arriendo({ precio:precio, garantia:garantia, marcadeTiempo: now, arriendoPagado:arriendoPagado, garantiaPagada:garantiaPagada, idInmueble:idInmueble, cedula:cedula, inmueble:inmueble, inquilino:inquilino});
          arriendosList[msg.sender].push(arriendo);
          return true; 
        }
      } 
    } 
  }

  function obtenerInmueble(string memory idInmueble)public view returns (Inmueble memory inmueble, bool existe){ 
    for (uint i = 0; i<inmueblesList[msg.sender].length; i++){ 
      if (Utilidades.esIgual(inmueblesList[msg.sender][i].idInmueble, idInmueble)){ 
        return (inmueblesList[msg.sender][i], true);
      } 
    } 
    return (inmueblesList[msg.sender][0], false); 
  }

  function obtenerInquilino(string memory cedula)public view returns (Inquilino memory inquilino, bool existe){ 
    for (uint i = 0; i<inquilinosList[msg.sender].length; i++){ 
      if (Utilidades.esIgual(inquilinosList[msg.sender][i].cedula, cedula)){ 
        return (inquilinosList[msg.sender][i], true);
      } 
    } 
    return (inquilinosList[msg.sender][0], false); 
  }

  function obtenerListaDeInquilinos()public view returns (Inquilino[] memory){
    return inquilinosList[msg.sender];
  }
  function obtenerListaDeInmuebles()public view returns (Inmueble[] memory){ 
    return inmueblesList[msg.sender];
  }
  function obtenerListaDeArriendos()public view returns (Arriendo[] memory){ 
    return arriendosList[msg.sender];
  }

}
