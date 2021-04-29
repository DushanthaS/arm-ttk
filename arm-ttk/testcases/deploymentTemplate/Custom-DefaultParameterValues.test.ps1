<#
.Synopsis
 Ensures that all parameters adheres to a standard
.Description
 ARM templates must not have a defaultValue property
#>
param(
   # The Template Object
   [Parameter(Mandatory = $true, Position = 0)]
   [PSObject]
   $TemplateObject,

   # The Template JSON Text
   [Parameter(Mandatory = $true, Position = 0)]
   [PSObject]
   $TemplateText
)


 foreach ($parameter in $TemplateObject.parameters.psobject.properties) {
   # Write-Output $parameter.Value.psobject.Properties.Name
   #Write-Output $parameter.Value.psobject.Properties.psobject.ImmediateBaseObject.Name

   if($parameter.Value.psobject.Properties.Name -eq "defaultValue" -and 
   
   $parameter.Name -ne "logicAppISEid" -and 
   $parameter.Name -ne "logicAppISEname"
   
   ){
      Write-Error "ARM templates must not have a defaultValue property for the parameter `"$($parameter.Name)`"" -ErrorId Parameter.DefaultValuePresent -TargetObject $parameter
  }
 }