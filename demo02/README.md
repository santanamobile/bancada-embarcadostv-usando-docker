# Demo 02 - ESPHome (não apresentado)

Antes de tudo, uma ressalva, seria demonstrado o uso do esphome mas o tempo estava curto.

O ESPHome é um framework open-source para desenvolvimento de firmware para dispositivos baseados em ESP8266, ESP32, LibreTiny e RP2040, sendo que estes dois últimos ainda estão em desenvolvimento.
Este framework simplifica a criação de firmware personalizado para esses microcontroladores, permitindo a configuração por meio de arquivos YAML.

Você pode utilizar o ambiente em containers docker de duas formas: por linha de comando ou interface web.

Iremos utilizar linha de comando nesta demonstração.

## Criar arquivo yaml via assistente

O comando abaixo vai executar um assistente para criação do arquivo yaml com as especificações do usuário.

Os exemplos levam em consideração que existe um esp32 plugado ao equipamento que está executando o container e que está na porta /dev/ttyUSB0.

'''bash
    docker run --rm -v "${PWD}":/config -it ghcr.io/esphome/esphome wizard demo02.yaml
'''

Este comando fará o download do container não estiver disponível no sistema e executará o assistente.

Na primeira execução do comando abaixo será feito o download do compilador e bibliotecas necessárias para a compilação.

'''bash
    docker run --rm -v "${PWD}":/config -it ghcr.io/esphome/esphome compile demo02.yaml
'''

A sintaxes permitidas para o container esphome são: 'config', 'compile', 'upload', 'logs', 'discover', 'run', 'clean-mqtt', 'wizard', 'mqtt-fingerprint', 'version', 'clean', 'dashboard', 'vscode', 'update-all', 'idedata', 'rename'.

Para gravar o firmware no esp32 utilizamos o comando

'''bash
    docker run --rm -v "${PWD}":/config --device /dev/ttyUSB0 -it ghcr.io/esphome/esphome upload demo02.yaml
'''

Ou ainda, podemos utilizar o comando abaixo para compilar e gravar logo em seguida.

'''bash
    docker run --rm -v "${PWD}":/config --device /dev/ttyUSB0 -it ghcr.io/esphome/esphome run demo02.yaml
'''
