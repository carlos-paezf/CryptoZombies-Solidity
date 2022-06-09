# Capitulo 6: Import

¡Wow! Vas a notar que se ha limpiado el código del editor, y ahora tu tienes 2 nuevos tabs en la parte superior del editor.

Nuestro código se estaba volviendo un poco largo, por lo tanto nosotros lo separamos en múltiples archivos para hacerlo más manejable. Así es como normalmente tu manejaras bases de código largos en tus proyectos de Solidity.

Cuando tu tienes múltiples archivos y tu quieres importar uno dentro de otro, Solidity usa la palabra reservada `import`.

```sol
import "./someothercontract.sol";

contract newContract is SomeOtherContract {

}
```

Entonces, si nosotros tenemos un archivo llamado `someothercontract.sol` en el mismo directorio que este contrato (esto es el porque del uso de `./`), este será importado por el compilador.

## Ponlo a prueba

Ahora que hemos configurado la estructura de múltiples archivos, nosotros necesitamos usar `import` para leer el contenido de otros archivos:

1. Importa `zombiefactory.sol` dentro de nuestro nuevo archivo `zombiefeeding.sol`

```sol
pragma solidity >=0.5.0 <0.6.0;

import "./zombiefactory.sol";


contract ZombieFeeding is ZombieFactory {
    
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/6](https://cryptozombies.io/en/lesson/2/chapter/6)
