# Capitulo 11: Keccak256 y Typecasting

Queremos que nuestra función `_generateRandomDna` retorne un `uint` semi-random. ¿Como podemos conseguir esto?

Ethereum tiene una función hash llamada `keccak256`, la cual es una versión de SHA3. Una función hash es básicamente el mapeo de un input dentro de un numero hexadecimal random de 256 bits. A pequeño cambio en el input puede causar un gran cambio en el hash.

Esto es usado con muchos propósitos en Ethereum, pero justo ahora nosotros vamos a usarlo para generar un número pseudo-aleatorio.

También es importante, `keccak256` esperar un simple parámetro de tipo `bytes`. Esto significa que nosotros tenemos que empaquetar cualquier parámetro antes de llamar a `keccak256`.

Ejemplo:

```sol
// 6e91ec6b618bb462a4a6ee5aa2cb0e9cf30f7a052bb467b0ba58b8748c00d2e5
keccak256(abi.encodePacked("aaaab"));
// b1f078126895a1424524de5321b339ab00408010b7cf0e6ed451514981e58aa9
keccak256(abi.encodePacked("aaaac"));
```

Como puedes ver, los valores retornados son totalmente diferentes, aunque solo 1 carácter cambia en el input.

> ***Nota de los autores:* La seguridad de la generación de números random es un problema muy difícil en Blockchain. Nuestro método es inseguro, pero la seguridad no es la máxima prioridad para nuestro ADN Zombi, por lo que está bien para nuestros propósitos.**

## Typecasting

Algunas veces tu necesitas convertir entre tipos de datos. Toma el siguiente ejemplo:

```sol
uint8 a = 5;
uint b = 6;
// Arroja un error por qué a * b retorna un uint no un uint8
uint8 c = a * b;
// Nosotros tenemos que tipar b como uint8 para que funcione
uint8 c = a * uint8(b);
```

En el ejemplo anterior, `a * b` retorna un `uint`, pero nosotros intentamos almacenar el valor como `uint8`, lo cual ocasionará potenciales problemas. Cuando hacemos el casteo a `uint8`, funcionará y el compilador no arrojará ningún error.

## Ponte a Prueba

¡Vamos a llenar el cuerpo de nuestra función `_generateRandomDna`! Esto es lo que debes hacer:

1. La primera línea del código debe tomar el hash `keccak256` de `abi.encodePacked(_str)` para generar un hexadecimal pesudo-aleatorio, tiparlo como `uint`, y finalmente almacenar el resultado en un `uint` llamado `rand`.
2. Nosotros queremos que nuestro ADN sea solo de 16 dígitos (¿Recuerdas nuestro `dnaModulus`?). Por lo tanto, la segunda línea de código debe retornar el módulo `dnaModulus` (`%`) del anterior valor.

```sol
pragma solidity ^0.4.25;

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

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }
}
```
