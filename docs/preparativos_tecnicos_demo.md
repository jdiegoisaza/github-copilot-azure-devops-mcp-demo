# PREPARATIVOS TECNICOS PARA LAS DEMOS

## OBJETIVO

Esta guia resume los preparativos tecnicos necesarios para:

- quien va a presentar la demo,
- quienes van a replicarla despues,
- y el equipo administrador que debe dejar listo el entorno.

El foco es:

- `GitHub Copilot` en `Visual Studio Code`
- `Azure DevOps MCP Server`

## RECOMENDACION PRACTICA

Para una sesion de replicacion, la ruta mas simple hoy es:

1. `Visual Studio Code`
2. `GitHub Copilot Chat`
3. `Azure DevOps MCP remoto`

La razon es simple:

- el `MCP remoto` no requiere instalar un servidor local,
- la configuracion es minima con `mcp.json`,
- y Microsoft lo documenta oficialmente para `VS Code` y `Visual Studio`.

Si no puedes usar el remoto, el plan B razonable es el `Azure DevOps MCP local`.

## ESTADO DE SOPORTE A 17 DE ABRIL DE 2026

- `Azure DevOps MCP remoto`: `public preview`
- `Azure DevOps MCP local`: `generally available`
- Entornos oficialmente soportados para el remoto: `Visual Studio Code` y `Visual Studio`

## 1. PREPARATIVOS COMUNES PARA TODOS

### Cada participante necesita

- Un equipo con `Visual Studio Code` instalado.
- Una cuenta de `GitHub` con acceso a un plan de `GitHub Copilot`.
- Acceso al proyecto de `Azure DevOps` que se usara en la demo.
- Permisos reales para ver:
  - work items,
  - repositorios,
  - pull requests,
  - pipelines,
  - pruebas, si las van a mostrar.

### Preparativos de cuentas

- Confirmar que la cuenta que usaran en Azure DevOps pertenece al proyecto correcto.
- Si van a usar `MCP remoto`, confirmar que la organizacion de Azure DevOps esta conectada a `Microsoft Entra ID`.
- Confirmar que la identidad con la que inician sesion en Azure DevOps coincide con la que usaran para autenticar el MCP.

## 2. PREPARATIVOS PARA TI COMO EXPOSITOR

### Entorno recomendado

- `Visual Studio Code` actualizado.
- `GitHub Copilot` habilitado y probado antes de la sesion.
- Un repositorio de demo ya abierto.
- Un proyecto de Azure DevOps con:
  - una iteracion activa,
  - 3 a 5 work items visibles,
  - 1 PR visible,
  - 1 pipeline reciente,
  - 1 archivo de codigo facil de explicar.

### Lo que debes tener validado antes de entrar

- Copilot abre sin pedir login.
- El chat funciona.
- El MCP responde una consulta simple.
- El proyecto correcto aparece.
- Los datos de demo no son sensibles.

## 3. PREPARATIVOS PARA QUIENES VAN A REPLICAR

### Minimo indispensable

- `VS Code`
- acceso a `GitHub Copilot`
- acceso al proyecto de `Azure DevOps`

### Muy recomendable

- usar el mismo proyecto de demo o un proyecto sandbox,
- tener un repositorio propio o clonado,
- tener una cuenta de Entra activa si van a usar `MCP remoto`,
- hacer la prueba en una red corporativa que no bloquee autenticacion.

## 4. CONFIGURACION DE GITHUB COPILOT EN VS CODE

## Paso 1. Verificar acceso a Copilot

Cada persona debe tener uno de estos escenarios:

- plan individual con Copilot, o
- licencia asignada por la organizacion o la empresa.

## Paso 2. Iniciar sesion en VS Code

En `Visual Studio Code`:

1. Abrir `Accounts`.
2. Iniciar sesion con `GitHub`.
3. Confirmar que la cuenta es la correcta para usar Copilot.

## Paso 3. Confirmar que Copilot esta activo

Abrir el chat de Copilot en VS Code y probar algo simple:

`Explain this file.`

Si responde, Copilot ya esta funcional.

## Nota importante

GitHub documenta que, en `Visual Studio Code`, cuando configuras Copilot por primera vez, las extensiones necesarias se instalan automaticamente.

## 5. CONFIGURACION RECOMENDADA: AZURE DEVOPS MCP REMOTO

## Cuando conviene usarlo

Usalo si:

- quieres la ruta mas simple para una capacitacion,
- la organizacion de Azure DevOps esta conectada a `Microsoft Entra ID`,
- y quieres evitar instalar un servidor local en cada equipo.

## Prerrequisitos oficiales

Segun Microsoft:

- organizacion activa de Azure DevOps conectada a Entra,
- pertenencia al proyecto,
- acceso a los recursos a consultar,
- entorno soportado como `Visual Studio Code`.

## Paso 1. Crear el archivo de configuracion

En el repositorio o carpeta de trabajo, crear:

`.vscode/mcp.json`

Con este contenido:

```json
{
  "servers": {
    "ado-remote-mcp": {
      "url": "https://mcp.dev.azure.com/{organization}",
      "type": "http"
    }
  },
  "inputs": []
}
```

Reemplaza `{organization}` por el nombre real de la organizacion de Azure DevOps.

Ejemplo:

```json
{
  "servers": {
    "ado-remote-mcp": {
      "url": "https://mcp.dev.azure.com/contoso",
      "type": "http"
    }
  },
  "inputs": []
}
```

## Paso 2. Abrir Copilot en VS Code

1. Guardar el archivo.
2. Abrir `GitHub Copilot Chat`.
3. Cuando lo solicite, autenticarse con la cuenta `Microsoft Entra`.
4. Elegir la cuenta que tiene acceso al proyecto.

## Paso 3. Validar que el MCP responde

Probar con alguno de estos prompts:

- `List the projects in my Azure DevOps organization.`
- `Show my assigned work items.`
- `What pull requests require my review?`

Si devuelve datos reales, ya esta listo.

## Configuracion recomendada para capacitacion

Si quieres limitar el alcance y simplificar la demo, Microsoft documenta estas dos opciones:

### A. Restringir toolsets

```json
{
  "servers": {
    "ado-remote-mcp": {
      "url": "https://mcp.dev.azure.com/{organization}",
      "type": "http",
      "headers": {
        "X-MCP-Toolsets": "repos,wiki,wit,pipelines,testplan"
      }
    }
  },
  "inputs": []
}
```

### B. Forzar modo solo lectura

```json
{
  "servers": {
    "ado-remote-mcp": {
      "url": "https://mcp.dev.azure.com/{organization}",
      "type": "http",
      "headers": {
        "X-MCP-Readonly": "true"
      }
    }
  },
  "inputs": []
}
```

### C. Recomendacion combinada para taller

Si quieres el montaje mas seguro para una demo:

```json
{
  "servers": {
    "ado-remote-mcp": {
      "url": "https://mcp.dev.azure.com/{organization}",
      "type": "http",
      "headers": {
        "X-MCP-Toolsets": "repos,wit,pipelines,testplan",
        "X-MCP-Readonly": "true"
      }
    }
  },
  "inputs": []
}
```

Esta configuracion es ideal para replicacion:

- baja riesgo,
- evita modificaciones accidentales,
- reduce el numero de herramientas cargadas.

## 6. CONFIGURACION ALTERNATIVA: AZURE DEVOPS MCP LOCAL

## Cuando conviene usarlo

Usalo si:

- no puedes usar el remoto,
- quieres un entorno mas controlado,
- o tu organizacion todavia no tiene lista la ruta con Entra para el remoto.

## Prerrequisitos oficiales

Segun Microsoft Learn y el repositorio oficial:

- `VS Code`
- `Node.js 20+`
- carpeta o repo abierto en VS Code

## Paso 1. Instalar Node.js

Cada participante debe instalar `Node.js 20` o superior.

Verificacion:

```powershell
node --version
npx --version
```

## Paso 2. Crear `.vscode/mcp.json`

Usa esta configuracion recomendada por el repositorio oficial:

```json
{
  "inputs": [
    {
      "id": "ado_org",
      "type": "promptString",
      "description": "Azure DevOps organization name (e.g. 'contoso')"
    }
  ],
  "servers": {
    "ado": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@azure-devops/mcp", "${input:ado_org}"]
    }
  }
}
```

## Paso 3. Iniciar el servidor

1. Guardar el archivo.
2. Hacer clic en `Start` sobre la configuracion MCP.
3. Abrir `GitHub Copilot Chat`.
4. Cambiar a `Agent Mode`.
5. Ir a `Select Tools`.
6. Habilitar las herramientas MCP disponibles.

## Paso 4. Autenticarse

La primera vez que se ejecute una herramienta de Azure DevOps:

- se abrira el navegador,
- pedira login con cuenta Microsoft,
- y esa cuenta debe coincidir con la organizacion de Azure DevOps seleccionada.

## Paso 5. Validar

Probar:

`List ADO projects`

o:

`List my work items for project 'Contoso'`

## Opcional: cargar solo ciertos dominios

Si quieres simplificar la experiencia, el repositorio oficial recomienda usar `domains`.

Ejemplo:

```json
{
  "inputs": [
    {
      "id": "ado_org",
      "type": "promptString",
      "description": "Azure DevOps organization name (e.g. 'contoso')"
    }
  ],
  "servers": {
    "ado_with_filtered_domains": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@azure-devops/mcp", "${input:ado_org}", "-d", "core", "work", "work-items", "repositories", "pipelines"]
    }
  }
}
```

Dominios disponibles segun el repositorio:

- `core`
- `work`
- `work-items`
- `search`
- `test-plans`
- `repositories`
- `wiki`
- `pipelines`
- `advanced-security`

## Recomendacion para un taller

Usa solo:

- `core`
- `work`
- `work-items`
- `repositories`
- `pipelines`

Asi reduces ruido y facilitas la replicacion.

## 7. CONFIGURACION MINIMA DEL PROYECTO DE DEMO

Para que la demo sea replicable, el proyecto de Azure DevOps debe tener al menos:

- una organizacion accesible,
- un proyecto visible para los participantes,
- una iteracion activa,
- work items asignables,
- un repo con codigo,
- un PR visible,
- una pipeline reciente.

Si quieres mostrar QA:

- test plan o resultados de pruebas visibles.

## 8. CONFIGURACION DE PERMISOS

## Para exponer la demo

Con acceso de lectura suele bastar si la demo es de consulta.

## Para replicar la demo

Necesitan como minimo:

- acceso al proyecto,
- acceso al repo,
- acceso a work items,
- acceso a PRs,
- acceso a pipelines,
- acceso a pruebas, si las van a consultar.

## Recomendacion

Para capacitacion, usa:

- proyecto sandbox,
- permisos de lectura,
- y `readonly` en remoto si es posible.

## 9. VALIDACION RAPIDA POST-CONFIGURACION

Cada participante deberia poder ejecutar estas cuatro pruebas:

### Prueba 1. Copilot

`Explain this file.`

### Prueba 2. MCP

`Show my assigned work items.`

### Prueba 3. PRs

`What pull requests require my review?`

### Prueba 4. Pipelines

`List recent failed pipeline runs for this project.`

Si esas cuatro funcionan, el entorno esta listo para la demo principal.

## 10. PROBLEMAS MAS COMUNES

### Problema 1. Copilot no responde

Revisar:

- licencia o plan activo,
- sesion iniciada en GitHub,
- politica organizacional que permita chat.

### Problema 2. MCP remoto no devuelve datos

Revisar:

- que la organizacion de Azure DevOps este conectada a Entra,
- que la cuenta tenga permisos,
- que el nombre de la organizacion en la URL sea correcto.

### Problema 3. MCP local no arranca

Revisar:

- `Node.js 20+`,
- archivo `.vscode/mcp.json`,
- si `npx` esta disponible,
- si VS Code detecto la configuracion MCP.

### Problema 4. Se autentica con la cuenta equivocada

Revisar:

- cerrar sesion del navegador si hay multiples cuentas,
- repetir autenticacion con la cuenta que corresponde a Azure DevOps.

## 11. RECOMENDACION FINAL DE MONTAJE

Si tu objetivo es una demo en cliente y luego replicacion por participantes:

### Para ti como expositor

- usa `MCP remoto` en `VS Code`,
- con `readonly`,
- y con toolsets limitados.

### Para participantes

- si tienen Entra y acceso al proyecto, usa tambien `MCP remoto`,
- si no lo tienen listo, usa la ruta de `Copilot` sola o `MCP local` como fase dos.

## 12. FUENTES OFICIALES

- GitHub Docs, `What is GitHub Copilot?`
  - https://docs.github.com/en/copilot/overview-of-github-copilot/about-github-copilot
- GitHub Docs, `Installing the GitHub Copilot extension in your environment`
  - https://docs.github.com/en/copilot/how-tos/personal-settings/installing-the-github-copilot-extension-in-your-environment
- GitHub Docs, `Asking GitHub Copilot questions in your IDE`
  - https://docs.github.com/en/copilot/how-tos/chat-with-copilot/chat-in-ide
- Microsoft Learn, `Set up the remote Azure DevOps MCP Server (preview)`
  - https://learn.microsoft.com/en-us/azure/devops/mcp-server/remote-mcp-server?view=azure-devops
- Microsoft Learn, `Manage Azure DevOps by using MCP Server`
  - https://learn.microsoft.com/en-us/training/modules/manage-ado-mcp-server/
- Repositorio oficial Microsoft, `azure-devops-mcp`
  - https://github.com/microsoft/azure-devops-mcp
