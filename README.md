# Proyecto de Prueba Técnica de QA

Este repositorio contiene la solución a una prueba técnica de Quality Assurance, que abarca la automatización de pruebas para Front-end, API y la validación de algoritmos de lógica.

## Requisitos Previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- **Ruby**: Versión 3.0 o superior
- **Bundler**: Para gestionar las dependencias de Ruby (`gem install bundler`)
- **Google Chrome**: Necesario para la ejecución de las pruebas de Front-end con Selenium
- **ChromeDriver**: Debe estar instalado y accesible en el PATH del sistema

## Estructura del Proyecto

El proyecto está organizado en tres módulos principales, cada uno con sus propias dependencias y pruebas:

### Frontend
Contiene las pruebas de automatización web (UI) para una aplicación de demostración.

- `features/`: Escenarios de prueba BDD escritos en Gherkin
- `features/step_definitions/`: Implementación de los pasos de Cucumber
- `features/support/`: Configuración del entorno de pruebas (Selenium, hooks)
- `pages/`: Abstracciones de las páginas web siguiendo el patrón Page Object Model (POM)

### API
Contiene las pruebas para una API REST pública (reqres.in).

- `features/`: Escenarios BDD para la validación de los endpoints
- `features/step_definitions/`: Implementación de los pasos de API
- `clients/`: Clientes HTTP para interactuar con la API
- `contracts/`: Esquemas JSON para la validación de contratos de respuesta

### Logic
Contiene implementaciones de algoritmos y sus pruebas unitarias.

- `lib/`: Clases y módulos con la lógica de los algoritmos
- `spec/`: Pruebas unitarias con RSpec para validar la lógica

## Ejecución de Pruebas

### Opción 1: Usando Rakefile (Recomendado)

Desde la raíz del proyecto, puedes ejecutar todas las suites de pruebas con comandos simples:

```bash
# Ejecutar todas las pruebas (Frontend, API y Logic)
rake test_all

# Ejecutar solo pruebas de Frontend
rake test:frontend

# Ejecutar solo pruebas de API
rake test:api

# Ejecutar solo pruebas de Logic
rake test:logic
```

### Opción 2: Ejecución Individual por Módulo

#### Pruebas de Front-end

Estas pruebas validan la interfaz de usuario de la aplicación de demostración.

**Ejecución estándar:**
```bash
cd frontend
bundle install
bundle exec cucumber
```

**Ejecución con reporte HTML:**
```bash
cd frontend
bundle exec cucumber -p html_report
```
El reporte se generará en `reports/frontend.html`

#### Pruebas de API

Estas pruebas validan la creación y consulta de usuarios en la API de reqres.in.

**Ejecución estándar:**
```bash
cd api
bundle install
bundle exec cucumber
```

**Ejecución con reporte HTML:**
```bash
cd api
bundle exec cucumber -p html_report
```
El reporte se generará en `reports/api.html`

#### Pruebas de Lógica

Estas pruebas validan el correcto funcionamiento de los algoritmos implementados.
```bash
cd logic
bundle install
bundle exec rspec
```

## Tecnologías Utilizadas

- **Ruby**: Lenguaje de programación principal
- **Cucumber**: Framework BDD para pruebas de aceptación
- **RSpec**: Framework de pruebas unitarias
- **Selenium WebDriver**: Automatización de navegadores web
- **HTTParty/Faraday**: Cliente HTTP para pruebas de API
- **JSON Schema**: Validación de contratos de API