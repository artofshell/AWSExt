$ArgumentCompleter = @{
    ### Command to dynamically retrieve all appropriate commands to register with:
    ### (Get-Command -Module AWSPowerShell -ParameterName BucketName).Name.ForEach({ "'{0}'," -f $PSItem }) | Set-Clipboard
    CommandName = @(
        'Copy-S3Object',
        'Enable-RSLogging',
        'Get-S3ACL',
        'Get-S3Bucket',
        'Get-S3BucketLocation',
        'Get-S3BucketLogging',
        'Get-S3BucketNotification',
        'Get-S3BucketPolicy',
        'Get-S3BucketReplication',
        'Get-S3BucketRequestPayment',
        'Get-S3BucketTagging',
        'Get-S3BucketVersioning',
        'Get-S3BucketWebsite',
        'Get-S3CORSConfiguration',
        'Get-S3LifecycleConfiguration',
        'Get-S3Object',
        'Get-S3ObjectMetadata',
        'Get-S3PreSignedURL',
        'Get-S3Version',
        'Import-EC2Instance',
        'Import-EC2Volume',
        'New-S3Bucket',
        'Read-S3Object',
        'Remove-S3Bucket',
        'Remove-S3BucketPolicy',
        'Remove-S3BucketReplication',
        'Remove-S3BucketTagging',
        'Remove-S3BucketWebsite',
        'Remove-S3CORSConfiguration',
        'Remove-S3LifecycleConfiguration',
        'Remove-S3MultipartUploads',
        'Remove-S3Object',
        'Restore-S3Object',
        'Set-S3ACL',
        'Test-S3Bucket',
        'Write-S3BucketLogging',
        'Write-S3BucketNotification',
        'Write-S3BucketPolicy',
        'Write-S3BucketReplication',
        'Write-S3BucketRequestPayment',
        'Write-S3BucketTagging',
        'Write-S3BucketVersioning',
        'Write-S3BucketWebsite',
        'Write-S3CORSConfiguration',
        'Write-S3LifecycleConfiguration',
        'Write-S3Object'
    );
    ParameterName = 'BucketName';
    ScriptBlock = {
        <#
        .SYNOPSIS
        Auto-complete the -BucketName parameter value for Amazon Web Services (AWS) cmdlets.
    
        .NOTES
        Created by Trevor Sullivan <trevor@trevorsullivan.net>
        https://trevorsullivan.net
        https://twitter.com/pcgeek86
        #>
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        $ItemList = Get-S3Bucket | Where-Object { $PSItem.BucketName -match $wordToComplete } | ForEach-Object {
            $CompletionText = $PSItem.BucketName;
            $ToolTip = $PSItem.BucketName;
            $ListItemText = $PSItem.BucketName;
            $CompletionResultType = [System.Management.Automation.CompletionResultType]::ParameterValue;

            New-Object -TypeName System.Management.Automation.CompletionResult -ArgumentList @($CompletionText, $ListItemText, $CompletionResultType, $ToolTip);
        }
    
        ### Return the fresh completion results
        return $ItemList;
    }
}

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter;