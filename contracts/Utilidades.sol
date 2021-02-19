//Definir versión de compilador
pragma solidity ^0.5.0;

//Creación de una librería
library Utilidades { 

  function esIgual(string memory cadena1, string memory cadena2) public pure returns (bool) { 
    return compara(cadena1, cadena2) == 0;
  }

  function compara(string memory cadena1, string memory cadena2) public pure returns (int) { 
    bytes memory a = bytes(cadena1); 
    bytes memory b = bytes(cadena2); 
    uint longitud = a.length; 
    if (b.length < longitud){
      longitud = b.length; 
    }
    for (uint i = 0; i < longitud; i ++){
      if (a[i] < b[i]) return -1;
      else if (a[i] > b[i]) return 1;
    } 
    if (a.length < b.length) return -1;
    else if (a.length > b.length) return 1;
    else return 0; 
  }

}