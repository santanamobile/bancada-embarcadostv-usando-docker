# Usando docker para montar ambiente de desenvolvimento

Este repositório contem as demonstrações apresentadas no episódio 07 (2023-05-12)

[Link do episódio](https://www.youtube.com/live/4ZYx-0j3Dug)

## DEMOS

- demo01 - ESP-IDF (ESP32)
- demo02 - ESPhome (platform.io)
- demo03 - Yocto (Variscite/VAR-SOM-MX6)

### Demo 01 - ESP-IDF

O objetivo inicial era demonstrar o uso do container esp-idf para definir um target e compilar um dos exemplos do repositório mas acabei incluindo uma action do Github.

### Demo 02 - ESPHome (estava previsto mas não foi apresentado)

Seria demonstrado o uso do container esphome que utiliza platform.io como compilador para o projeto.

### Demo 03 - Deploy no Digital Ocean + Bônus: Infra as Code com terraform

Esta demonstração faz o deploy de um ambiente de desenvolvimento da Variscite num VPS da DigitalOcean e compila uma imagem Yocto para uma de suas placas, neste caso a VAR-SOM-MX6.

## Reference

- [IDF Docker Image](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-docker-image.html)
- [Getting Started with the ESPHome Command Line](https://esphome.io/guides/getting_started_command_line.html)
- [Yocto Project Quick Build](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html)
- [VAR-SOM-MX6 - Yocto Dunfell 3.1 based on FSL Community BSP 3.1 with 5.4.24_2.1.0 Linux release](https://variwiki.com/index.php?title=Yocto_Build_Release&release=RELEASE_DUNFELL_V1.1_VAR-SOM-MX6)
- [VAR-SOM-MX6 - Docker](https://variwiki.com/index.php?title=Docker_Guide&release=RELEASE_DUNFELL_V1.1_VAR-SOM-MX6)

## Author

- [@santanamobile](https://www.github.com/santanamobile)

## License

[MIT](https://choosealicense.com/licenses/mit/)
