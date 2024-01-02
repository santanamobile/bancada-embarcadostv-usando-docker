# Demo 01 - ESP-IDF

O objetivo inicial era apenas demonstrar o uso do container esp-idf para definir um target e compilar um dos exemplos do repositório mas acabei incluindo actions do Github.

## Obtendo os fontes

Vamos utilizar o clássico hello_world do conjunto de exemplos do esp-idf.

'''bash
    git clone <https://github.com/espressif/esp-idf.git>
    cp -av ~/src/esp-idf/examples/get-started/hello_world .
    cd hello_world
'''

Em seguida vamos executar o container disponibilizado no Docker Hub

'''bash
    docker run --rm -v $PWD:/project -w /project --device /dev/ttyUSB0 -it espressif/idf
'''

Estou assumindo que existe um esp32 plugado no equipamento e que a porta é a /dev/ttyUSB0.

Uma vez que o container foi iniciado de forma interativa, é preciso configurar o build para o target adequado.

'''bash
    idf.py set-target esp32
    idf.py app
    idf.py flash monitor
'''

Se tudo correr bem, ao fim da execução o firmware gerado será gravado na placa e no terminal serão exibidas as mensagens.
