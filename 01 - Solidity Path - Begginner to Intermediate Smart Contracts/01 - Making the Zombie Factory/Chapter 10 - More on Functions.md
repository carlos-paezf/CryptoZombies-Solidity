# Capitulo 10: Más sobre funciones

En este capitulo, nosotros vamos a aprender más acerca del valor de retorno (***return values***) de una función y de los modificadores de la misma.

## Valor de Retorno

Para retornar un valor de una función, la declaración luce así:

```sol
string greeting = "What's up dog";

function sayHello() public returns (string memory) {
    return greeting;
}
```

En Solidity, la declaración de una función contiene el tipo de valor de retorno (en este caso `string`).

## Modificadores de Función

La anterior función actualmente no cambia el estado en Solidity, es decir, no cambia ningún valor o no escribe nada.

Entonces, en este caso nosotros podemos declararla como una función observadora (***view***), lo que significa que solo puede ver los datos pero no modificarlos:

```sol
function sayHello() public view returns (string memory) { ... }
```

Solidity también contiene funciones puras (***pure***), lo cual significa que no tiene acceso a ninguna data de la aplicación. Considera el siguiente ejemplo:

```sol
function _multiply(uint a, uint b) private pure returns (uint) {
    return a * b;
}
```

Esta función ni siquiera lee el estado de la app, y retorna un valor que solo depende de los parámetros de la función. Entonces en este caso, nosotros debemos declarar esta función como pura.

> ***Nota de los autores:* Podría ser muy difícil de recordar cuando marcar las funciones como `pure`/`view`. Afortunadamente el compilador de Solidity is bueno emitiendo alertas que te permiten saber cuando tu debes usar alguno de los modificadores.**

## Ponte a Prueba

Nosotros vamos a querer una función que genere un número random de DNA desde un string.

1. Crea una función privada llamada `_generateRandomDna`. Esta va a tomar un parámetros llamado `_str` (un `string`), y retornará un `uint`. No olvides configurar la ubicación del parámetro `_str` en memoria.
2. Esta función va a observar alguna de las variables de nuestro contrato, pero no la modificara, por lo tanto marca la función como `view`.
3. El cuerpo de la función será vacío hasta este punto, la llenaremos luego.

```sol
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna (string memory _str) private view returns (uint) {
        
    } 
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 06 de Mayo de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/10](https://cryptozombies.io/en/lesson/1/chapter/10)
