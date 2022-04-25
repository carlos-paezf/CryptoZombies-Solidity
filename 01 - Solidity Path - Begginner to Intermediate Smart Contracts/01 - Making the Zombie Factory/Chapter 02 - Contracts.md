# Capitulo 2: Contracts

Iniciamos con lo más básico:

El código de Solidity está encapsulado en ***contracts***. Un *contract* es un bloque de construcción fundamental para aplicaciones de Ethereum. Todas las variables y funciones pertenecen a un contrato y este será el punto inicial de nuestro proyecto.

Un contrato vacío llamado `HelloWorld` luce como:

```sol
contract HelloWorld {

}
```

## Versión Pragma

Todo los códigos fuente de Solidity deben iniciar con una "versión pragma", la cual es una declaración del compilador de Solidity que este código debe usar. Esto nos permite prever incidencias con futuras versiones de compilación, las cuales potencialmente podrían introducir cambios y romper nuestro código.

Para el alcance de este tutorial, nosotros queremos habilitar la compilación de nuestro código con cualquier compilador que este en el rango 0.5.0 (inclusivo) y 0.6.0 (exclusivo). Por lo tanto tendremos esto: `pragma solidity >=0.5.0 <0.6.0;`.

Poniendo lo anterior junto, tendremos el esqueleto de nuestro contrato inicial, la primera cosa que escribiremos al inicial el proyecto será:

```sol
pragma solidity >=0.5.0 <0.6.0;

contract HelloWorld {

}
```

## Ponte a prueba

Para iniciar creando nuestra armada zombi, vamos a crear un contrato base llamado `ZombieFactory`.

1. En la caja de la derecha, creamos nuestro contrato usando la versión de solidity `>=0.5.0 <0.6.0`.
2. Crear un contrato vacío llamado `ZombieFactory`.

```sol
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 19 de abril de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/2](https://cryptozombies.io/en/lesson/1/chapter/2)
