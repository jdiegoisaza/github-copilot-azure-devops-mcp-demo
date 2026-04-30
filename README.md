# Desarrollo Potenciado por Datos

Si llegaron a este repositorio desde el taller, aqui van a encontrar una guia practica para replicar el entorno de demo y adaptar la idea a su propio contexto.

El foco del material es mostrar como combinar:

- GitHub Copilot
- Azure DevOps
- MCP Servers
- una narrativa de desarrollo apoyado en datos reales del trabajo

## Que van a encontrar

### Para empezar

- [`docs/paso_a_paso_ado_demo_detallado.md`](docs/paso_a_paso_ado_demo_detallado.md)
  - guia principal para montar el proyecto demo en Azure DevOps y preparar la replicacion
- [`docs/preparativos_tecnicos_demo.md`](docs/preparativos_tecnicos_demo.md)
  - configuracion tecnica recomendada para Copilot y Azure DevOps MCP
- [`docs/azure_devops_demo_blueprint.md`](docs/azure_devops_demo_blueprint.md)
  - estructura sugerida del proyecto, backlog, repo, pipeline y PRs

### Archivos listos para usar

- [`templates/azure_devops_workitems_demo.csv`](templates/azure_devops_workitems_demo.csv)
  - backlog de ejemplo para importar en Azure DevOps
- [`templates/azure_devops_workitems_demo_sin_rutas.csv`](templates/azure_devops_workitems_demo_sin_rutas.csv)
  - variante util cuando fallan `Area Path` o `Iteration Path`
- [`templates/mcp.remote.example.json`](templates/mcp.remote.example.json)
  - ejemplo de configuracion para Azure DevOps MCP remoto
- [`templates/mcp.local.example.json`](templates/mcp.local.example.json)
  - ejemplo de configuracion para Azure DevOps MCP local
- [`pipelines/azure-pipelines.yml`](pipelines/azure-pipelines.yml)
  - pipeline base para la demo
- [`scripts/crear_proyecto_ado_demo.ps1`](scripts/crear_proyecto_ado_demo.ps1)
  - script de apoyo para crear proyecto, areas e iteraciones

### Material de referencia del taller

- [`docs/demos_en_vivo.md`](docs/demos_en_vivo.md)
  - secuencia sugerida para reproducir la demo y los prompts
- [`docs/slides_texto_exacto.md`](docs/slides_texto_exacto.md)
  - texto visible usado en la presentacion
- [`docs/guion_expositor.md`](docs/guion_expositor.md)
  - guion oral de apoyo para quien quiera replicar la charla

## Por donde empezar

Si quieren replicar la demo, este es el orden recomendado:

1. Lean [`docs/paso_a_paso_ado_demo_detallado.md`](docs/paso_a_paso_ado_demo_detallado.md).
2. Revisen la estructura objetivo en [`docs/azure_devops_demo_blueprint.md`](docs/azure_devops_demo_blueprint.md).
3. Monten el proyecto en Azure DevOps con la UI o con [`scripts/crear_proyecto_ado_demo.ps1`](scripts/crear_proyecto_ado_demo.ps1).
4. Importen [`templates/azure_devops_workitems_demo.csv`](templates/azure_devops_workitems_demo.csv).
5. Si la importacion falla por rutas, usen [`templates/azure_devops_workitems_demo_sin_rutas.csv`](templates/azure_devops_workitems_demo_sin_rutas.csv).
6. Agreguen [`pipelines/azure-pipelines.yml`](pipelines/azure-pipelines.yml) al repo de demo.
7. Configuren Copilot y MCP con apoyo de [`docs/preparativos_tecnicos_demo.md`](docs/preparativos_tecnicos_demo.md).
8. Ensayen la secuencia con [`docs/demos_en_vivo.md`](docs/demos_en_vivo.md).

## Requisitos minimos

- `Visual Studio Code`
- acceso a `GitHub Copilot`
- acceso a un proyecto de `Azure DevOps`
- permisos para ver work items, repos, PRs y pipelines

## Notas importantes

- El material esta pensado para `Azure DevOps`, `GitHub Copilot` y `Visual Studio Code`.
- Si van a usar `Azure DevOps MCP remoto`, la organizacion debe estar conectada a `Microsoft Entra ID`.
- Si el remoto no es viable, la alternativa mas estable es `MCP local`.
- Para una demo o taller, conviene trabajar con un proyecto sandbox y datos no sensibles.
