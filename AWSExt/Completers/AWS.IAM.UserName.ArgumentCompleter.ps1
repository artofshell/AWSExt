$ArgumentCompleter = @{
    ### Command to dynamically retrieve all appropriate commands to register with:
    ### (Get-Command -Module AWSPowerShell -Name *IAM* -ParameterName UserName).ForEach({ "'{0}'," -f $PSItem }) | Set-Clipboard;
    CommandName = @(
        'Add-IAMUserToGroup',
        'Disable-IAMMFADevice',
        'Enable-IAMMFADevice',
        'Get-IAMAccessKey',
        'Get-IAMAttachedUserPolicies',
        'Get-IAMGroupForUser',
        'Get-IAMLoginProfile',
        'Get-IAMMFADevice',
        'Get-IAMSigningCertificate',
        'Get-IAMSSHPublicKey',
        'Get-IAMSSHPublicKeyList',
        'Get-IAMUser',
        'Get-IAMUserPolicies',
        'Get-IAMUserPolicy',
        'New-IAMAccessKey',
        'New-IAMLoginProfile',
        'New-IAMUser',
        'Publish-IAMSigningCertificate',
        'Publish-IAMSSHPublicKey',
        'Register-IAMUserPolicy',
        'Remove-IAMAccessKey',
        'Remove-IAMLoginProfile',
        'Remove-IAMSigningCertificate',
        'Remove-IAMSSHPublicKey',
        'Remove-IAMUser',
        'Remove-IAMUserFromGroup',
        'Remove-IAMUserPolicy',
        'Sync-IAMMFADevice',
        'Unregister-IAMUserPolicy',
        'Update-IAMAccessKey',
        'Update-IAMLoginProfile',
        'Update-IAMSigningCertificate',
        'Update-IAMSSHPublicKey',
        'Update-IAMUser',
        'Write-IAMUserPolicy'
    );
    ParameterName = 'UserName';
    ScriptBlock = {
        <#
        .SYNOPSIS
        Auto-complete the -UserName parameter value for Amazon Web Services (AWS) cmdlets.
    
        .NOTES
        Created by Trevor Sullivan <trevor@trevorsullivan.net>
        https://trevorsullivan.net
        https://twitter.com/pcgeek86
        #>
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        $ItemList = Get-IAMUser | Where-Object { $PSItem.DomainName -match $wordToComplete } | ForEach-Object {
            $CompletionText = $PSItem.DomainName;
            $ToolTip = $PSItem.DomainName;
            $ListItemText = $PSItem.DomainName;
            $CompletionResultType = [System.Management.Automation.CompletionResultType]::ParameterValue;

            New-Object -TypeName System.Management.Automation.CompletionResult -ArgumentList @($CompletionText, $ListItemText, $CompletionResultType, $ToolTip);
        }
    
        return $ItemList;
    }
}

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter;