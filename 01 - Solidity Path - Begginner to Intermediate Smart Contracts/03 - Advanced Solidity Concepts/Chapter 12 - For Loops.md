# Capítulo 12: Ciclo For

En el capitulo anterior, mencionamos algunas veces que tu deberías usar el ciclo `for` para construir el contenido de un arreglo en una función, en lugar de simplemente guardar el arreglo en `storage`.

Miremos por qué.

Para nuestra función `getZombiesByOwner`, una implementación ingenua sería almacenar un `mapping` de propietarios de armadas zombies en el contrato `ZombieFactory`:

```sol
mapping (address => uint[]) public ownerToZombies;
```

Entonces cada vez que creamos un nuevo zombie, simplemente usamos `ownerToZombies[owner].push(zombieId)` para añadirlo a la matriz de zombies de ese propietario. Y `getZombiesByOwner` sería una función muy sencilla

```sol
function getZombiesByOwner(address _owner) external view returns (uint[] memory) {
    return ownerToZombies[_owner];
}
```

## El problema con este enfoque

Este enfoque es tentador por su simplicidad. Pero vamos a mirar que pasa si después añadimos una función para transferir un zombie desde un dueño a otro (¡la cual vamos a añadir definitivamente en una lección posterior).

La función de transferencia necesita que:

1. Empujar el zombie al arreglo `ownerToZombies` del nuevo dueño.
2. Remover el zombie del arreglo `ownerToZombies` del antiguo dueño.
3. Mover cada zombie en el arreglo del propietario anterior, un lugar hacia arriba para llenar el agujero, y luego...
4. ... reducir el tamaño del arreglo en 1.

El paso 3 sería extremadamente costoso en términos de gas, ya que tenemos que hacer una escritura por cada zombie cuya posición ha sido movida. Si un dueño tiene 20 zombies y cambia el primero, tenemos que hacer 19 escrituras para mantener el orden del arreglo.

Ya que la escritura en el `storage` es una de las operaciones más costosas en Solidity, cada llamada de la función de transferencia sería demasiado costoso en términos de gas. Y aún peor, esto costaría una cantidad de gas diferente cada vez que es llamada, dependiendo de cuantos zombies el usuario tiene en su armada, y el indice del zombie transferido. Entonces el usuario no sabría cuanto gas enviar.

> *Nota de los autores: Por supuesto, nosotros movemos el último zombie en el arreglo para llenar el espacio perdido y reducir el tamaño del arreglo en 1. Pero entonces cambiaríamos el orden de nuestra armada zombie cada vez que hacemos una transacción.*

Ya que las funciones `view` no consumen gas cuan son llamadas externamente, podemos simplificarlas usando un ciclo for en `getZombiesByOwner` para iterar el arreglo entero de zombies y construir un arreglo de los zombies que pertenecen al dueño especifico. Entonces nuestra función `transfer` será muy barata, ya que no necesitamos reorganizar ningún arreglo en `storage`, y de manera un tanto contraria a la intuición, este enfoque es más barato en general.

## Uso del ciclo `for`

La sintaxis del ciclo for en Solidity es similar a JavaScript.

Observemos un ejemplo donde queremos hacer un arreglo de números pares:

```sol
function getEvens() pure external returns(uint[] memory) {
    uint[] memory evens = new uint[](5);
    // Mantener un registro del indice de la nueva matriz
    uint counter = 0;
    // Iterar desde 1 hasta 10 con un ciclo for:
    for (uint i = 1; i <= 10; i++) {
        // Si `i` es par...
        if (i % 2 == 0) {
            // Lo añadimos a nuestro arreglo
            evens[counter] = i;
            // Incrementamos el contador al siguiente indice en `evens`
            counter++;
        }
    }
    return evens;
}
```

Esta función retornara un arreglo con el contenido `[2, 4, 6, 8, 10]`.

## Ponte a prueba

Finalizaremos nuestra función `getZombiesByOwner` escribiendo un ciclo `for` que itere todos los zombies en nuestra DApp, comparemos sus dueños para mirar si tienen una coincidencia, y añadirlos a nuestro array `result` antes de retornarlo.

1. Declara un `uint` llamado `counter` y ajustalo a `0`. Usaremos esta variable para mantener un registro del indice nuestro arreglo `result`.
2. Declara un ciclo `for` que inicie desde `uint i = 0` y que vaya hasta `i < zombies.length`. Esto iterara sobre cada zombie en nuestro arreglo.
3. Dentro del ciclo `for`, haremos una sentencia `if` que verifique si `zombieToOwner[i]` es igual a `_owner`. Esto comparara las 2 direcciones para mirar si tenemos una coincidencia.
4. Dentro de la sentencia `if`:
    1. Añadimos el ID del zombie en nuestro arreglo `result` asignado un 1 a `result[counter]`.
    2. Incrementamos `counter` en 1 (mirar el ciclo for del ejemplo anterior).

De esta manera, la función devolverá ahora todos los zombies que sean propiedad de `_owner` son gastar gas.

```sol
contract ZombieHelper is ZombieFeeding {
    ...
    function getZombiesByOwner(address _owner) external view returns (uint[] memory) {
        uint[] memory result = new uint[](ownerZombieCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < zombies.length; i++) {
            if (zombieToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}
```

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 17 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/12](https://cryptozombies.io/en/lesson/3/chapter/12)
