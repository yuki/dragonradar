# Dragon Radar

Proyecto para aprender a hacer un [Radar del Dragón](https://dragonball.fandom.com/wiki/Dragon_Radar) de la serie Dragon Ball y retomar la programación en iOS.


## TODO

Cómo tiene que ser la aplicación:

- [ ] Si hay partida empezada, muestra el radar directamente.
    - [ ] Si no: pantalla de crear juego
- [x] Pantalla de crear juego
    - [x] Elegir kms de distancia
    - [ ] Bucle para las 7 bolas que hace
        - [ ] Randomize de coordenadas
- [x] Ver histórico de partidas?
- [ ] Pantalla del radar:
    - [x] Radar
    - [ ] Botón del radar que hace un bucle de ¿5? zooms distintos: ARRAY de zooms
    - [ ] Botón para ver estadísticas de la partida:
        - [ ] Cuándo se empezó el juego
        - [ ] Ver cuál de las 7 bolas se han conseguido y cuándo
        - [ ] Opción para terminar el juego
    - [ ] DURANTE EL JUEGO:
        - [x] Ver mapa
        - [x] Mostrar las bolas
        - [ ] Cómo conseguir la bola?
            - [ ] Al estar cerca?
            - [ ] Al hacer click en ella comprueba la distancia y si está a menos de 10 metros marcarla como cogida?
            - [ ] Al coger la última bola, que aparezca un pop-up para pedir el deseo a Shenron
- [x] Dataset del juego:
    - [x] UUID
    - [x] Datetime de creación del juego
    - [x] ARRAY de 7 posiciones con:
        - [ ] Número de bola? (O lo saco de la posición del ARRAY?)
        - [x] Geo-posición
        - [x] Cuándo se ha cogido la bola
    - [x] Datetime de cuándo se ha terminado el juego.
        - [ ] Debería coincidir con la última bola conseguida?
    - [x] Deseo pedido al Dragón Shenron
