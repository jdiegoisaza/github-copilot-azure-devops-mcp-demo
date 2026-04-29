$OrganizationUrl = "https://dev.azure.com/juandiego-13"
$ProjectName = "fast_Api"
$RepoName = "portal-servicios-demo"
$Process = "Agile"

az devops login --organization $OrganizationUrl


az devops configure --defaults organization=$OrganizationUrl
az devops configure --defaults project=$ProjectName

az devops project create `
  --name $ProjectName `
  --description "Proyecto demo para Desarrollo Potenciado por Datos" `
  --process $Process `
  --source-control git `
  --visibility private

az repos create `
  --name $RepoName `
  --project $ProjectName `
  --org $OrganizationUrl

az boards area project create `
  --name "Producto" `
  --project $ProjectName `
  --org $OrganizationUrl

az boards area project create `
  --name "Backend" `
  --project $ProjectName `
  --org $OrganizationUrl

az boards area project create `
  --name "Frontend" `
  --project $ProjectName `
  --org $OrganizationUrl

az boards area project create `
  --name "QA" `
  --project $ProjectName `
  --org $OrganizationUrl

az boards iteration project create `
  --name "Release 1" `
  --project $ProjectName `
  --org $OrganizationUrl

az boards iteration project create `
  --name "Sprint 0 - Setup" `
  --path "\$ProjectName\Iteration\Release 1" `
  --project $ProjectName `
  --org $OrganizationUrl

az boards iteration project create `
  --name "Sprint 1 - Desarrollo" `
  --path "\$ProjectName\Iteration\Release 1" `
  --project $ProjectName `
  --org $OrganizationUrl

az boards iteration project create `
  --name "Sprint 2 - Integracion" `
  --path "\$ProjectName\Iteration\Release 1" `
  --project $ProjectName `
  --org $OrganizationUrl

az boards iteration project create `
  --name "Sprint 3 - Pruebas" `
  --path "\$ProjectName\Iteration\Release 1" `
  --project $ProjectName `
  --org $OrganizationUrl

Write-Host "Proyecto base creado."
Write-Host "Siguientes pasos:"
Write-Host "1. Importar azure_devops_workitems_demo.csv desde Boards > Queries > Import work items"
Write-Host "2. Crear el repo local y subir README, codigo base y azure-pipelines-demo.yml"
Write-Host "3. Crear 1 PR abierto y 1 PR completado"
Write-Host "4. Configurar branch policies sobre main"
