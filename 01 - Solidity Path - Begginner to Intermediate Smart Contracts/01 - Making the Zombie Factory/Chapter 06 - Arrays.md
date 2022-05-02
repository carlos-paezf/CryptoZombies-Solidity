# Capitulo 06: Arrays

Cuando tu quieres una colección de algo, tu puedes usar un `array`. Existen 2 tipos de arreglos en Solidity: Arreglos **Fijos** y Arreglos **Dinámicos**.

```sol
// Arreglo con un tamaño fijo de 2 elementos
uint[2] fixedArray;
// Otro arreglo fijo que puede contener 5 strings:
string[5] stringArray;
// Un arreglo dinámico - No tiene un tamaño fijo, puede mantenerse creciendo:
uint[] dynamicArray;
```

Tu puedes crear también un arreglo de structs. Usando el ejemplo de estructura de persona del capitulo anterior:

```sol
// Arreglo dinámico, puede mantenerse añadiendo elementos
Person[] people;
```

¿Recuerdas que las variables de estado son almacenadas permanentemente dentro del Blockchain? Entonces crear un arreglo dinámico de estructuras como esta, puede ser útil para almacenar datos en tu contrato, como un tipo de base de datos.

## Arreglos Públicos

Tu puedes declarar un arreglo como `public`, y Solidity creará automáticamente un método `getter` para el arreglo. La sintaxis luce así:

```sol
Person[] public people;
```

Otros contratos tendrán la oportunidad de acceder al arreglo, pero no escribir sobre él. Entonces, esto es patrón muy útil para almacenar data pública dentro de tu contrato.

## Ponte a prueba

Queremos almacenar una armada de zombis en nuestra aplicación. Y nosotros queremos mostrar todos los zombis a otras apps, por lo tanto lo haremos público.

1. Crear un arreglo público de la estructura `Zombie`, y lo llamamos `zombies`.

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
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 01 de Mayo de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/6](https://cryptozombies.io/en/lesson/1/chapter/6)
