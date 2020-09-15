$currentAzContext = Get-AzContext 
$subscriptionID=$currentAzContext.Subscription.Id
$imageResourceGroup="<RSG-NAME>"
$location="uksouth"
$imageTemplateName="<AIB TEMPLATE NAME>"
$runOutputName="run1"

## UPLOAD THE IMAGE BUILDER TEMPLATE TO AZURE
New-AzResourceGroupDeployment `
   -ResourceGroupName $imageResourceGroup `
   -TemplateFile $templateFilePath `
   -api-version "2020-02-14" `
   -imageTemplateName $imageTemplateName `
   -runOutputName $runOutputName `
   -svclocation $location

## KICK OFF THE BUILD PROCESS
Invoke-AzResourceAction `
    -ResourceName $imageTemplateName `
    -ResourceGroupName $imageResourceGroup `
    -ResourceType Microsoft.VirtualMachineImages/imageTemplates `
    -ApiVersion "2020-02-14" `
    -Action Run


   #This has now kicked of a build into the AIB service which will do its stuff. To check the Image Build Process run the cmd below. 
   #It will go from Building, to Distributing to Complete, it will take some time.
   (Get-AzResource –ResourceGroupName $imageResourceGroup -ResourceType Microsoft.VirtualMachineImages/imageTemplates -Name $ImageTemplateName).Properties.lastRunStatus