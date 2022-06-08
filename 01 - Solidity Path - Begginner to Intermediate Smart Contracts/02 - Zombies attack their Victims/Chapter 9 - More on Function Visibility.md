# Capítulo 9: Más sobre Visibilidad de Funciones

¡El código de nuestra sección anterior tiene un error!

Si tu intentas compilarlo, el compilador arrojará un error.

El problema es que nosotros estamos intentando llamar la función `_createZombie` dentro de `ZombieFeeding`, pero `_createZombie` es una función privada dentro de `ZombieFactory`. Esto significa que ninguno de los contratos heredados de `ZombiesFactory` puede acceder a ella.

## Internal y External

Además de `public` y `private`, Solidity tiene 2 tipos más de visibilidad para las funciones `internal` y `external`.

`internal` es lo mismo que `private`, excepto que también es accesible para los que hereden de este contrato. (¡Hey, este suena como el que queremos aquí!)

`external` es similar a `public`, excepto que esta función SOLO puede ser llamada fuera del contrato, ellos no pueden se llamados por otra función dentro del contrato. Nosotros vamos a hablar de por qué tu podrías llegar a querer usar `external` vs `public` luego.

Para declarar funciones `internal` o `external`, la sintaxis es la misma a `private` y `public`.

```sol
contract Sandwich {
    uint private sandwichesEaten = 0;

    function eat() internal {
        sandwichesEaten++;
    }
}

contract BLT is Sandwich {
    uint private baconSandwichesEaten = 0;

    function eatWithBacon() public returns (string memory) {
        baconSandwichesEaten++;
        // Nosotros podemos llamar aquí la función eat() porque es interna 
        eat();
    }
}
```

## Ponlo a prueba

1. Cambia `_createZombie()` de `private` a `internal` para que otro contrato puede acceder a este.

```sol
contract ZombieFactory {
    function _createZombie(string memory _name, uint _dna) internal {
        ...
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/9](https://cryptozombies.io/en/lesson/2/chapter/9)
