# Barrette 🛠️  
**Ataques DoS para Pruebas de Seguridad**

## Descripción  
**Barrette** es una herramienta diseñada para **realizar pruebas de ataques de Denegación de Servicio (DoS)** con el propósito de ayudar a profesionales de ciberseguridad a identificar vulnerabilidades en servidores, aplicaciones y redes.  

Esta herramienta se centra en **entornos educativos y autorizados**, proporcionando un entorno controlado para evaluar la resistencia frente a amenazas de este tipo. Es ideal para realizar auditorías de seguridad, pruebas de capacitaciones en ciberseguridad.

---
# Imagen
[![Captura de pantalla](ruta/a/tu/imagen.png)](https://raw.githubusercontent.com/agoralatam/barrette/refs/heads/main/image/imagen.png)
---
## Características Principales  
- **Protocolos Soportados**:  
  - **TCP**   
  - **UDP**
  - **ICMP**

- **Tipos de Ataques**:
  - **ICMP Land Attack**
  - **SYN Land Attack**
  - **TCP Land Attack**
  - **UDP Land Attack**
  - **SYN Flood Attack**
  - **ICMP Smurf Attack**
  - **TCP Smurf Attack**
  - **UDP Smurf Attack**
  - **Ping Death Attack** 
---

## Requisitos del Sistema  
- **Sistema Operativo**: Linux  
- **Permisos:** Root
---

## Instalación y uso
1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/tu_usuario/barrette.git
   ```
3. **Entrar a el directorio**:
  ```bash 
   cd tu_repositorio
  ```
3.  **Otorgar permisos**:
  ```bash 
   chmod 777 * && chmod 777 modules_attack/*
  ```
4. **Instalación de dependencias:***
  ```bash 
   bash install.sh
  ```
5. **Ejecución**
  ```bash 
   bash barrette.sh -a IP_OBJETIVO -t NUMERO_DE_HILOS -p PUERTO --TIPO-DE-ATAQUE
  ```
