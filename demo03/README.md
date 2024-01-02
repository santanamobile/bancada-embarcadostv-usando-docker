# Demo 03 - Deploy no Digital Ocean + Bônus: Infra as Code com terraform

Esta demonstração utiliza um container disponibilizado pela Variscite para realizar um build do Yocto para uma de suas placas, neste caso a VAR-SOM-MX6.

Para tornar o processo de build mais rápido, lancei mão de um deploy de um VPS no Digital Ocean que realizou as seguintes etapas de forma automatizada:

- Deploy do VPS e configuração das credenciais de acesso
- Instalação dos pacotes necessáris, incluindo docker
- Criação de usuário (builder) para execução do container
- Clone do repositório dos Dockerfile do fabricante
- CLone do repositório das receitas
- Build do container

## Pre-requisitos

1. Uma conta na [DigitalOcean](https://www.digitalocean.com/). Será necessário criar uma [chave de API](https://docs.digitalocean.com/reference/api/create-personal-access-token/) no dashboard.
2. [Terraform](https://www.terraform.io/downloads.html) instalado em sua máquina local.

## Credenciais SSH

Gere o par de chaves com

```bash
ssh-keygen -f ssh-key -C "demo03@digitalocean"
```

## Etapas para o deploy

Para deploy do VPS siga estes passos:

1. Clone este repositório em sua máquina:

```bash
git git@github.com:santanamobile/bancada-embarcadostv-usando-docker.git
```

2. Acesse o diretório do projeto:

```bash
cd bancada-embarcadostv-usando-docker/demo03
```
3. Inicialize o terraform

```bash
terraform init
```

4. Configure a API do DigitalOcean:

- No diretório do projeto, copie o arquivo 'variables.tf.example' para 
'variables.tf'
- Em "do_token" insira o token da API DigitalOcean:

```hcl
do_token = "YOUR_DIGITALOCEAN_API_TOKEN"
```

Revise as variáveis e modifique os valores conforme necessário.
Você deve configurar a região, tamanho do droplet, token e nome da chave ssh na Digital Ocean.

## DEMO

1. Acesso o VPS como root

```bash
ssh root@<IP> -f ssh-key
```

2. Logue com usuário "builder"

```bash
sudo -u builder -H -s
```

3. Construa/Execute o container docker fornecido pela variscite:

```bash
cd ~/var-host-docker-containers
./run.sh -p -u 20.04 -w /home/builder/docker-yocto-build 
```

4. Após acessar o container, configure o ambiente do yocto, ie:

```bash
MACHINE=var-som-mx6 DISTRO=fslc-xwayland . setup-environment build_xwayland
```

5. Após configurar as preferências, construa a imagem desejada:

```bash
bitbake fsl-image-gui
```

## Finalizando

Para remover os recursos criados, execute o comando:

```bash
terraform destroy
```

Revise as informações e digite 'yes' para confirmar a remoção dos recursos.

Atenção neste momento, pois esta ação não pode ser desfeita, todos os recursos serão destruídos permanentemente.
