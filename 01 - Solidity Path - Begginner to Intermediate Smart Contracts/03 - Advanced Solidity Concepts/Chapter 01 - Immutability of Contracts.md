# Capítulo 1: Inmutabilidad de Contratos

Hasta ahora, Solidity se ha mantenido similar a otros lenguajes como JavaScript. Pero hay varias formas en las que las DApps de Ethereum son diferentes a las aplicaciones normales.

Para empezar, después de desplegar un contrato de Ethereum, este es **inmutable**, lo cual significa que este nunca puede ser modificado o actualizado de nuevo.

El código inicial que tu despliegas al contrato, este se mantiene allí, permanentemente, en el blockchain. Esta es una de las razones que la seguridad es una gran preocupación en Solidity. Si hay una falla en el código del contrato,, no hay forma de que lo corrijas después. Tu podrías decirle a los usuarios que empiecen a usar una dirección de contrato diferente en que se halla solucionado el error.

Pero esto es también una característica de los contratos inteligentes. El código es ley. Si tu lees el código de un contrato inteligentes y lo verificas, tu puedes asegurarte de que cada ves que llames una función, esta va a hacer exactamente lo que el código dice que hará. Nadie puede cambiar después la función y que obtengamos resultados inesperados.

## Dependencias Externas

En la lección 2, nosotros codificamos la dirección de contrato de CryptoKitties dentro de nuestra DApp. Pero que pasaría si ¿el contrato CryptoKitties tiene un bug y alguien destruye todos los gatitos?

Esto es improbable, pero si esto pasa, nuestra APP sería completamente inútil, nuestra DApp podría apuntar a un dirección codificada que ya no devolverá ningún gatito. Nuestros zombies no podrán alimentarse de gatitos y nosotros no podríamos modificar nuestro contrato para arreglarlo.

Por esta razón, en vez de codificar en "duro" la dirección de contrato de CryptoKitties dentro de nuestra DApp, nosotros deberíamos tener una función `setKittyContractAddress` que nos permita cambiar esta dirección en un futuro, en caso de que algo pase en el contrato de CryptoKatties.

## Ponlo a prueba

Vamos a actualizar nuestro código de la Lección 2 para cambiar la dirección de contrato de CryptoZombies.

1. Borramos la linea de código donde hardcodiamos `ckAddress`.
2. Cambiamos la línea donde creamos `kittyContract` para declarar la variable, es decir, no la establezca igual a nada.
3. Crear una función llamada `setKittyContractAddress`. Este tomará un argumento, `_address` (un `address`), y será una función `externa`.
4. Dentro de la función, añadimos una línea de código que configure `kittyContrat` igual a `KittyInterface(_address)`.

```sol
contract ZombieFeeding is ZombieFactory {

    KittyInterface kittyContract;

    function setKittyContractAddress(address _address) external {
        kittyContract = KittyInterface(_address);
    }
    ...
}
```

> *Nota de los editores: Si tu nota una agujero de seguridad con esta función, no te preocupes, lo arreglaremos en el siguiente capítulo ;)*

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/1](https://cryptozombies.io/en/lesson/3/chapter/1)
