# Capítulo 10: ¿Qué comen los Zombies?

¡Es tiempo de alimentar a nuestro zombies! ¿Y qué es lo que gusta comer a los zombies?

Bueno, da la casualidad que a los CryptoZombies les gusta comer... CryptoKitties (CryptoGatitos)! (Si, es en serio).

Para hacer esto, necesitamos leer el kittyDna del contrato inteligente CryptoKitties. Nosotros podemos hacer esto por qué la data de CryptoKitties está almacenada abiertamente en el blockchain. ¿Esto no hace genial al blockchain?

No te preocupes, nuestro juego actualmente no va a herir ningún CryptoKitty. Solo estamos leyendo la información de CryptoKitties, no estamos habilitados actualmente para eliminarlos.

## Interacción con otros contratos

Para que nuestro contrato hable con otro contrato de la blockchain del que no somos dueños, primero necesitamos definir una `interface`.

Miremos un simple ejemplo. Digamos que hay un contrato en el blockchain que luce de la siguiente manera:

```sol
contract LuckyNumber {
    mapping(address => uint) numbers;

    function setNum(uint _num) public {
        numbers[msg.sender] = _num;
    }

    function getNum(address _myAddress) public view returns (uint) {
        returns numbers[_myAddress];
    }
}
```

Este podría ser un contrato simple donde cualquiera puede almacenar sus números de suerte, y asociarlos con la dirección Ethereum. Juego cualquiera otra persona podría buscar el número de la suerte de esa persona usando su dirección.

Ahora vamos a decir que tenemos un contrato externo que quiere leer la data en este contrato usando la función `getNum`.

Primero, debemos definir una `interface` del contrato LuckyNumber:

```sol
contract NumberInterface {
    function getNum(address _myAddress) public view returns (uint);
}
```

Fíjate que esto luce como la definición de un contrato, con una pocas diferencias. Por un lado, nosotros solo declaramos las funciones con las queremos interactuar (en este caso `getNum`), y no mencionamos ninguna otra función o variables de estado.

Segundo, nosotros no estamos definiendo el cuerpo de funciones. En lugar de llaves curvas (`{` y `}`), nosotros simplificamos la terminación de la declaración de la función con un punto y coma (`;`).

Asi que parece el esqueleto de un contrato. Así es como el compilador sabe que es una interface.

Al incluir esta interface en el código de nuestra app, nuestro contrato sabe que las funciones del otro contrato lucen así, sabe como llamarlas y que tipo de respuesta a esperar.

Entraremos en el tema de llamar las funciones de otros contratos en la próxima lección, por ahora vamos a declarar nuestra interfaz del contrato CryptoKitties.

## Ponte a prueba

Hemos buscado el código de CryptoKitties para ti, y encontramos una función llamada `getKitty` que retorna toda la información de kitty, incluyendo sus "genes" (¡los cuales son los que nuestro juego zombie necesita para formar nuevos zombies!).

La función luce como la siguiente:

```sol
function getKitty(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
) {
    Kitty storage kit = kitties[_id];

    // Si esta variable es 0, entonces no es gestado
    isGestating = (kit.siringWithId != 0);
    isReady = (kit.cooldownEndBlock <= block.number);
    cooldownIndex = uint256(kit.cooldownIndex);
    nextActionAt = uint256(kit.cooldownEndBlock);
    siriginWithId = uint256(kit.siringWithId);
    birthTime = uint256(kit.birthTime);
    matronId = uint256(kit.matronId);
    sireId = uint256(kit.sireId);
    generation = uint256(kit.generation);
    genes = kit.genes;
}
```

La función luce un poco diferente a lo que estamos acostumbrados. Tu puedes ver que devuelve... un montón de valores diferentes. Si vienes de un lenguaje de programación como JavaScript, esto es diferente: in Solidity tu puedes retornar más de un valor de una función.

Ahora que sabemos que esta función luce así, nosotros podemos usarla para crear una interface:

1. Define una interfaz llamada `KittyInterface`. Recuerda, este luce tal cual como la creación de un nuevo contrato, nosotros usamos la palabra reservada `contract`.
2. Dentro de la interfaz, define la función `getKitty` (la cuál debe ser un copy/paste de la función anterior, pero con un punto y coma después de la sentencia `returns`, en lugar de todo lo que está dentro de las llaves.

```sol
contract KittyInterface {
    function getKitty(uint256 _id) external view returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    );
}
```

> *Nota personal: Para nuevas versiones del compilador, se puede usar la palabra reservada `interface`*
>
> ```sol
> interface KittyInterface { ... }
> ```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/10](https://cryptozombies.io/en/lesson/2/chapter/10)
