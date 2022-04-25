# Capitulo 04: Operaciones Matemáticas

Las operaciones matemáticas en Solidity son las más básicas. Las siguientes operaciones son las mismas para la mayoría de los lenguajes de programación:

- Adicción / Suma: `x + y`
- Sustracción / Resta: `x - y`
- Multiplicación: `x * y`
- División: `x / y`
- Modulo / Residuo: `x % y` (*Por ejemplo, `13 % 5` is `3`, por qué si tu divides 5 entre 13, 3 es el residuo*)

Solidity también soporta un operador exponencial (ejm. "x elevado a la potencia y", `x^y`):

```sol
uint x = 5 ** 2; // Igual a 5^2 = 25
```

## Ponte a prueba

Para estar seguros de que nuestro ADN Zombi es de solo 16 caracteres, vamos a crear otro `uint` igual a 10^16. De esta manera nosotros podemos usar después es operador módulo para calcular un entero de 16 dígitos.

1. Creamos un `uint` llamado `dnaModulus`, y lo seteamos a 10 a la potencia de `dnaDigits`.

```sol
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 25 de abril de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/4](https://cryptozombies.io/en/lesson/1/chapter/4)
