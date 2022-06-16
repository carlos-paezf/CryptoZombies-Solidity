# Capítulo 7: Funciones públicas y seguridad

Vamos a modificar `feedAndMultiply` para tomar nuestro timer de recuperación dentro de la cuenta.

Mirando hacia atrás la función, tu puedes ver que la hemos hecho `public` en la lección anterior. Un importante práctica de seguridad es examinar todas tus funciones `public` y `external`, e intentar la manera en la que los usuarios podrían abusar de ellas. Recuerda, a no ser que las funciones tengan un modificador como `onlyOwner`, cualquier usuario puede llamarlas y pasarle cualquier información que ellos quieran.

Reexaminando esta función en particular, el usuario debería llamar la función directamente y pasarla en cualquier `_targetDna` o `_species` que ellos quieran. Esto no es muy parecido a un juego, ¡queremos que ellos sigan nuestras reglas!

En una inspección más cercana, esta función solo necesita ser llamada por `feedOnKitty()`, entonces la manera más sencilla de prevenir estos hechos, es hacerla `internal`.

## Ponte a prueba

1. Actualmente `feedAndMultiply` es una función `public`. Vamos a hacerla `internal` para que este contrato sea más segura. No queremos que nuestros usuarios estén en la libertad de llamar esta función con cualquier ADN que quieran
2. Haremos que `feedAndMultiply` tome nuestro `cooldownTime` dentro de la cuenta. Primero, después de buscar `myZombie`, añadimos una sentencia `require` que verifique `_isReady()` y pasarle `myZombie`. De esta manera los usuario pueden ejecutar solo esta función si el tiempo de recuperación de un zombie ha sido superado.
3. Al final de la función vamos a llamar `_triggerCooldown(myZombie)`, para que la alimentación active el tiempo de recuperación del zombie.

```sol
contract ZombieFeeding is ZombieFactory {
    ...
    function feedAndMultiply(uint _zombieId, uint _targetDna, string memory _species) internal {
        ...
        require(_isReady(myZombie));
        ...
        _triggerCooldown(myZombie);
    }
}
```

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/7](https://cryptozombies.io/en/lesson/3/chapter/7)
