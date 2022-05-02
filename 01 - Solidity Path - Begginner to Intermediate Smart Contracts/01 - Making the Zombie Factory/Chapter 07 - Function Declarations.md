# Capitulo 07: Declaración de Funciones

Una declaración de función en Solidity luce de la siguiente manera:

```sol
function eatHamburgers(string memory _name, uint _amount) public {

}
```

Esta es una función llamada `eatHamburgers`, la cual toma 2 parámetros: Un `string` y un `uint`. Por ahora es cuerpo de la función esta vació. Tenga en cuenta que nosotros especificamos que la visibilidad de la función es `public`. Nosotros también estamos proveyendo instrucciones acerca de que la variable `_name` debe ser almacenada en `memory`. Esto es requerido para todas las referencias como arrays, structs, mappings, y strings.

¿Que es un tipo de referencia que pides?

Bueno, hay 2 maneras de pasar parámetros como argumento de una función en Solidity:

- Por valor, lo cual significa que el compilador de Solidity crea un nueva copia del valor del parámetro y lo entrega a la función. Esto le permite a tu función modificar el valor sin preocuparse de que cambie el valor del parámetro inicial.
- Por referencia, lo cual implica que tu función es llamada con una referencia de la variable original. Por lo tanto, si tu función cambia el valor de la variable que recibe, el valor de la variable original se modificara.

> ***Nota de los autores:* Es una convención (pero no es requerida) iniciar los nombres variables de los parámetros de una función con underscore `_`, con el fin de diferenciarlas con las variables globales. Vamos a estar usando dicha convención a través de todo el tutorial.**

Tu podrías llamar la función de esta manera:

```sol
eatHamburgers("vitalik", 100);
```

## Ponte a prueba

En nuestra aplicación, nosotros necesitaremos poder crear algunos zombis. Vamos a crear una función para ello.

1. Crear una función de tipo `public` llamada `createZombie`. Esta deberá tomar 2 parámetros: `_name` (un `string`), y `_dna` (un `uint`). No te olvides de pasar el primer argumento por valor pasando la palabra reservada `memory`.

Deja el cuerpo vacío por ahora, lo completaremos luego.

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

    function createZombie(string memory _name, uint _dna) public {

    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 02 de Mayo de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/7](https://cryptozombies.io/en/lesson/1/chapter/7)
