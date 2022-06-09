# Capítulo 13: Bonus: Kitty Genes

Nuestra función lógica está completa ahora... pero vamos a añadirle una característica adicional.

Hagamos que los zombies hechos de gatitos tengan una característica que muestre que son gatos-zombies.

Para hacer esto, nosotros podemos añadir algún código especial de gatitos dentro de el ADN zombie.

Si tu recuerdas a la lección 1, nosotros actualmente solo estamos usando los primeros 12 dígitos de nuestros 16 dígitos de ADN para determinar la apariencia del zombie. Entonces vamos a usar los últimos 2 dígitos que no están siendo usados para manejar las características especiales.

Digamos que los gato-zombie tiene `99` como últimos 2 dígitos del ADN (ya que los gatos tienen 9 vidas). Entonces en nuestro código, diremos `if` un zombie viene de un gato, entonces configuramos los últimos 2 dígitos del ADN a `99`.

## Sentencia `if`

La sentencia `if` en Solidity luce idéntica que en JavaScript:

```sol
function eatBLT(string memory sandwich) public {
    // Recuerda que con los strings, nosotros tenemos que compararlos con sus hash keccak256
    // para verificar su equivalencia
    if (keccak256(abi.encodePacked(sandwich)) == keccak256(abi.encodePacked("BLT"))) {
        eat();
    }
}
```

## Ponlo a prueba

Vamos a implementar los genes gato en nuestro código zombie.

1. Primero, vamos a cambiar la definición de la función `feedAndMultiply` para que tome un tercer argumento: un `string` llamado `_species` el cual vamos a almacenarlo en `memory`.
2. Siguiente, después de calcular el nuevo ADN zombie, vamos a añadir una sentencia `if` comparando el hash `keccak256` de `_species` y el string `"kitty`. No podemos pasar directamente strings a `keccak256`. Por tal motivo, vamos a pasar `abi.encodePacked(_species)` como un argumento al lado izquierdo y `abi.encodePacked("kitty")` como un argumento al lado derecho.
3. Dentro de la sentencia `if`, nosotros queremos reemplazar los últimos 2 dígitos de ADN con `99`. Una manera de hacer esto es usando la lógica: `newDna = newDna - newDna % 100 + 99;`.

   > *Explicación: Asume que `newDna` es `334455`. Entonces `newDna % 100` es `55`, entonces `newDna - newDna % 100` is `334400`. Finalmente sumamos `99` para obtener `334499`*.

4. Por último, nosotros necesitamos cambiar el llamado de la función dentro de `feedOnKitty`. Cuando se llama `feedAndMultiply`, añadimos el parámetros `kitty` al final.

```sol
contract ZombieFeeding is ZombieFactory {
    ...
    function feedAndMultiply(uint _zombieId, uint _targetDna, string memory _species) public {
        ...
        if (keccak256(abi.encodePacked(_species)) == keccak256(abi.encodePacked("kitty"))) {
            newDna = newDna - newDna % 100 + 99;
        }
        ...
    }

    function feedOnKitty(uint _zombieId, uint _kittyId) public {
        ...
        feedAndMultiply(_zombieId, kittyDna, "kitty");
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/13](https://cryptozombies.io/en/lesson/2/chapter/13)
