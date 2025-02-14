![Podman](https://img.shields.io/badge/podman-%23892CA0?style=for-the-badge&logo=podman&logoColor=white) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

# Flexnet Server
Containerized Network License Manager (NLM) license server for Autodesk products

## PT-BR

### 1. ARQUIVO DE LICENÇA

:warning: Trocar o arquivo dummy 'ACD2025enlicense.lic' no diretório '.Podman' pela licença real

### 2. BUILD
```
podman build -t ifes/flexnetserver .
```
### 3. RUN
```
podman run -d --rm --mac-address <ENDERECO MAC NA LICENCA> --hostname <HOSTNAME NA LICENCA> --name flexnetserver -p 2080:2080 -p 27000-27009:27000-27009 ifes/flexnetserver
```




## EN-US

### 1. LICENSE FILE

:warning: Replace the dummy file 'ACD2025enlicense.lic' in the '.Podman' directory with the actual license

### 2. BUILD
```
podman build -t ifes/flexnetserver .
```

### 3. RUN
```
podman run -d --rm --mac-address <MAC ADDRESS IN LICENSE> --hostname <HOSTNAME IN LICENSE> --name flexnetserver -p 2080:2080 -p 27000-27009:27000-27009 ifes/flexnetserver
```

## Network License Manager (NLM) Docs
- [Plan your network license](https://www.autodesk.com/support/download-install/admins/network-deploy/setting-up-license-server)

- [Linux Autodesk Network License Manager Readme](https://damassets.autodesk.net/content/dam/autodesk/www/files/linux/readme.html)

