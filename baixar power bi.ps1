Connect-PowerBIServiceAccount

 
$ws = Get-PowerBIWorkspace
$caminho = "C:\powerbi\"


foreach ($pasta in $ws) {
  $work = $pasta.Name
  $nome = $caminho + $work
  New-Item -Path $nome -ItemType Directory
}
foreach ($w in $ws) {
  $work = $w.Name
  $rel = Get-PowerBIWorkspace -Name $work
  $rel2 = Get-PowerBIReport -Workspace $rel
  foreach ($r in $rel2) {
    $arquivo = $caminho + $work + "\" + $r.Name + ".pbix"

    Export-PowerBIReport -Id $r.Id -OutFile $arquivo

    Write-Output $arquivo "Salvo"


  }
}