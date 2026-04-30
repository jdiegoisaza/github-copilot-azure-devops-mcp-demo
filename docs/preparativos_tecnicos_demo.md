# PREPARATIVOS TECNICOS

Si ustedes quieren replicar la demo del taller, esta guia les resume la configuracion tecnica minima y la ruta recomendada para que el entorno funcione con la menor friccion posible.

El foco es:

- `GitHub Copilot` en `Visual Studio Code`
- `Azure DevOps MCP Server`

## Recomendacion rapida

La ruta mas simple depende de sus cuentas:

- Si su organizacion usa `Microsoft Entra ID` y el proyecto esta bien integrado, usen `Azure DevOps MCP remoto`.
- Si esa ruta no esta lista o la autenticacion complica la sesion, usen `Azure DevOps MCP local`.

## Lo que necesita cada participante

- `Visual Studio Code`
- una cuenta de `GitHub` con acceso a `GitHub Copilot`
- acceso al proyecto de `Azure DevOps`
- permisos de lectura sobre:
  - work items
  - repositorios
  - pull requests
  - pipelines
  - pruebas, si las van a consultar

## Antes de empezar

Verifiquen estas tres cosas:

1. La cuenta de `GitHub` es la misma con la que van a usar Copilot en VS Code.
2. La cuenta de `Azure DevOps` tiene acceso real al proyecto de demo.
3. Si van a usar `MCP remoto`, la autenticacion se hara con una cuenta organizacional o invitada en `Microsoft Entra ID`.

## Ruta 1. GitHub Copilot en VS Code

### Paso 1. Iniciar sesion

En `Visual Studio Code`:

1. Abran `Accounts`.
2. Inicien sesion con su cuenta de `GitHub`.
3. Confirmen que esa cuenta tiene Copilot habilitado.

### Paso 2. Confirmar que Copilot funciona

Abrir el chat de Copilot y probar algo corto:

```text
Explain this file.
```

Si responde con una explicacion razonable, Copilot ya esta listo.

## Ruta 2. Azure DevOps MCP remoto

### Cuando conviene

Usen esta opcion si:

- quieren la configuracion mas corta para el taller
- su organizacion ya esta conectada a `Microsoft Entra ID`
- la cuenta que van a usar tiene acceso al proyecto

### Advertencia importante

Si intentan autenticarse con una cuenta personal de Microsoft que no ha sido invitada al tenant, el login puede fallar. Para esta ruta conviene usar:

- cuenta corporativa, o
- cuenta invitada al tenant correspondiente

### Paso 1. Crear `.vscode/mcp.json`

Pueden tomar como base:

- [`../templates/mcp.remote.example.json`](../templates/mcp.remote.example.json)

Configuracion recomendada para taller:

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

Reemplacen `{organization}` por el nombre real de su organizacion.

### Paso 2. Recargar VS Code

1. Guarden el archivo.
2. Ejecuten `Developer: Reload Window`.
3. Abran `GitHub Copilot Chat`.

### Paso 3. Entrar a Agent Mode

Para usar MCP con Copilot:

1. Cambien el chat de `Ask` a `Agent`.
2. Entren a `Tools`.
3. Verifiquen que el servidor MCP aparezca disponible.

### Paso 4. Validar

Prueben en este orden:

```text
List the projects in my Azure DevOps organization.
Show my assigned work items.
What pull requests require my review?
List recent failed pipeline runs for this project.
```

Si estas consultas devuelven datos reales, la configuracion quedo bien.

## Ruta 3. Azure DevOps MCP local

### Cuando conviene

Usen esta opcion si:

- el remoto no esta disponible
- la autenticacion con Entra no esta lista
- quieren un entorno mas controlado para laboratorio

### Paso 1. Instalar Node.js

Necesitan `Node.js 20+`.

Verificacion:

```powershell
node --version
npx --version
```

### Paso 2. Crear `.vscode/mcp.json`

Pueden tomar como base:

- [`../templates/mcp.local.example.json`](../templates/mcp.local.example.json)

Configuracion minima:

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

### Paso 3. Iniciar el servidor

1. Guarden el archivo.
2. Recarguen la ventana de VS Code.
3. Abran `GitHub Copilot Chat`.
4. Cambien a `Agent`.
5. Activen las tools del servidor MCP.

### Paso 4. Autenticarse

La primera vez que una tool intente consultar Azure DevOps:

- se abrira el navegador
- se pedira autenticacion
- la cuenta debe coincidir con la organizacion del proyecto

### Paso 5. Validar

Pueden probar:

```text
List ADO projects
Show my assigned work items.
```

## Configuracion minima del proyecto de demo

Para que la replicacion funcione, el proyecto de Azure DevOps deberia tener al menos:

- una iteracion activa
- work items visibles
- un repo con codigo
- un PR visible
- una pipeline reciente

La estructura sugerida esta en:

- [`azure_devops_demo_blueprint.md`](azure_devops_demo_blueprint.md)

## Validacion rapida del entorno

Cada participante deberia poder completar estas cuatro pruebas:

1. Copilot:

```text
Explain this file.
```

2. Work items:

```text
Show my assigned work items.
```

3. Pull requests:

```text
What pull requests require my review?
```

4. Pipelines:

```text
List recent failed pipeline runs for this project.
```

Si esas cuatro pruebas funcionan, el entorno ya esta listo para la demo principal.

## Problemas comunes

### Copilot no responde

Revisen:

- sesion iniciada en GitHub
- licencia activa
- politica corporativa que permita Copilot Chat

### El MCP remoto no devuelve datos

Revisen:

- nombre correcto de la organizacion en la URL
- permisos sobre el proyecto
- cuenta correcta en `Microsoft Entra ID`

### El MCP local no arranca

Revisen:

- `Node.js 20+`
- contenido de `.vscode/mcp.json`
- disponibilidad de `npx`
- que el servidor aparezca en `Tools`

### Copilot responde como chat normal y no usa tools

Revisen:

- que el chat este en `Agent`
- que las tools del MCP esten habilitadas
- que el servidor haya cargado sin errores

## Recomendacion final

Para un taller, conviene priorizar estabilidad sobre sofisticacion:

- `read-only` en el remoto
- toolsets limitados
- proyecto sandbox
- datos no sensibles
- prompts ya probados antes de la sesion
