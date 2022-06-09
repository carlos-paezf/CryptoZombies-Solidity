# Capítulo 11: Usando una interfaz

Continuando nuestro ejemplo previo con `NumberInterface`, una vez que que definimos la interfaz así:

```sol
contract NumberInterface {
    function getNum(address _myAddress) public view returns (uint);
}
```

Nosotros podemos usar este contrato como a continuación:

```sol
contract MyContract {
    address NumberInterfaceAddress = 0xab38...
    // ^ La dirección del contrato FavoriteNumber en Ethereum
    NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);
    // Ahora `numberContract` está apuntado a otro contrato 

    function someFunction() public {
        // Ahora podemos llamar `getNum` desde este contrato:
        uint num = numberContract.getNum(msg.sender);
        // ... y hacer algo con `num` aquí
    }
}
```

De esta manera, tu contrato puede interactuar con cualquier otro contrato en el blockchain Ethereum, siempre y cuando ellos expongan aquellas funciones como `public` o `external`.

## Ponlo a prueba

¡Vamos a configurar nuestro contrato para leer desde el contrato inteligente CryptoKitties!

1. Ya se ha guardado la dirección del contrato CryptoKitties en nuestro código, bajo el nombre de `ckAddress`, en la siguiente línea, crea un `KittyInterface` llamado `kittyContract`, e inicializalo con `ckAddress`, justo como hicimos con el anterior `numberContract`.

```sol
contract ZombieFeeding is ZombieFactory {
    address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
    KittyInterface kittyContract = KittyInterface(ckAddress);
    ...
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/11](https://cryptozombies.io/en/lesson/2/chapter/11)
