# Capitulo 08: Trabajando con Estructuras y Arrays

## Creando nuevas estructuras

¿Recuerdas nuestra estructura `Person` de un ejemplo anterior?

```sol
struct Person {
    uint age;
    string name;
}

Person[] public people;
```

Ahora nosotros vamos a aprender como crear nuevas personas y añadirlas a nuestro array.

```sol
// Crear una nueva persona
Person person1 = Person(172, "Satoshi");

// Añadir la persona al array
people.push(satoshi);
```

Nosotros podemos combinar la sintaxis y mantener más limpio el código en una sola línea:

```sol
people.push(Person(16, "Vitalik"));
```

Note que `array.push()` añade algo al final del array, por lo tanto los elementos están en el orden en el que fueron añadidos. Mira el siguiente ejemplo:

```sol
uint[] numbers;
numbers.push(5);
numbers.push(10);
numbers.push(15);
// numbers ahora equivale a [5, 10, 15]
```

## Ponte a Prueba

¡Vamos a hacer que nuestra función `createZombie` haga algo!

1. Ponemos en el cuerpo de la función que cree un nuevo `Zombie`, y lo añadimos al arreglo de `zombies`. El `name` y `dna` para el nuevo Zombie deben venir de los argumentos de la función.
2. Vamos a hacer lo anterior en una sola línea para mantener limpio el código.

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

    function createZombie (string memory _name, uint _dna) public {
        zombies.push(Zombie(_name, _dna));
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Mayo de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/8](https://cryptozombies.io/en/lesson/1/chapter/8)
