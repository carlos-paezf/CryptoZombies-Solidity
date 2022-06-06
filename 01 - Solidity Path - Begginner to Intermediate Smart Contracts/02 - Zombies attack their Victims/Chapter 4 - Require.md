# Capitulo 4: Require

En la lección 1, nosotros hicimos que los usuarios puedan crear nuevos zombies al llamar la función `createRandomZombie` e ingresando un nombre. Sin embargo, si un usuario se mantiene llamando la función para crear un cantidad de zombies para su armada, el juego no sería muy divertido.

Vamos a hacer que cada jugador pueda solo llamar una vez la función. De esta manera los nuevos jugadores la llamaran cuando ellos inicien el juego, con el fin de crear el zombie inicial en su armada.

¿Cómo podemos hacer que la función solo sea llamada una vez por persona?

Para esto nosotros usamos `require.require`, la cual arroja un error y detiene la ejecución si alguna condición no es verdadera.

```sol
function sayHiToVitalik(string memory _name) public returns (string memory) {
    // Compara si `_name` es igual a `Vitalik`. Arroja un error en caso de que no sea correcto.
    // (Nota al lado: Solidity no tiene comparación nativa de string, por lo 
    // comparamos sus hash keccak256 para mirar si los string son iguales)
    require(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodedPacked("Vitalik")));
    // Si lo anterior es verdadero, prosigue la función:
    return "Hi!";
}
```

Si tu llamas esta función con `sayHiToVitalik("Vitalik")`, esta va a retornar "Hi!". Si tu la llamas con otra entrada, esta va a arrojar un error y no se ejecutara.

De este modo `require` es muy útil para verificar ciertas condiciones que deben ser verdaderas antes de ejecutar una función.

## Ponlo a prueba

En nuestro juego zombie, no queremos que nuestro usuario pueda crear zombies de manera ilimitada en su armada al llamar repetidamente la función `createRandomZombie`, esto haría que el juego no fuera divertido.

Vamos a usar `require` para asegurarnos que la función consiga ejecutarse solo una vez por usuario, cuando ellos creen su primer zombie.

1. Poner la sentencia `require` en el inicio de `createRandomZombie`. La función debe asegurarse de que `ownerZombieCount[msg.sender]` sea igual a `0`, y arrojar un error de otra manera.

> *Nota de los editores: No importa cual termino se pone primero, ambos ordenes son equivalentes. Sin embargo dado que nuestro verificador de respuesta es muy básico, esté solo va a aceptar una respuesta como correcta. Por lo tanto la expectativa será poner `ownerZombieCount[msg.sender]` de primeras.*

```sol
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {
    ...
    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        ...
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/4](https://cryptozombies.io/en/lesson/2/chapter/4)
