# Capitulo 05: Estructuras

Algunas veces necesitas un tipo de data más complejo. Por tal razón, Solidity provee `structs`:

```sol
struct Person {
    uint age;
    string name;
}
```

Las estructuras te permiten crear más tipos de data complicados que tienen muchas propiedades.

> ***Nota de los autores:** Note que nosotros introducimos un nuevo tipo, `string`. Los strings son usados para una data UTF-8 con un largo arbitrario. Ejemplo: `string greeting = "Hello world!"`*

## Ponte a prueba

En nuestra aplicación, nosotros vamos a crear algunos zombis. Y los zombis tendrán múltiples propiedades, esto es un caso perfecto para usar una estructura.

1. Crea una estructura llamada `Zombie`.
2. Nuestra estructura `Zombie` va a tener 2 propiedades: `name` (un `string`) and `dna` (un `uint`).

```sol
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }
} 
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 01 de Mayo de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/5](https://cryptozombies.io/en/lesson/1/chapter/5)
