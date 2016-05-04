$ArgumentCompleter = @{
    ### Command to dynamically retrieve all appropriate commands to register with:
    ### (Get-Command -Module AWSPowerShell -Name *IAM* -ParameterName GroupName).ForEach({ "'{0}'," -f $PSItem }) | Set-Clipboard;
    CommandName = @(
        'Add-IAMUserToGroup',
        'Get-IAMAttachedGroupPolicies',
        'Get-IAMGroup',
        'Get-IAMGroupPolicies',
        'Get-IAMGroupPolicy',
        'New-IAMGroup',
        'Register-IAMGroupPolicy',
        'Remove-IAMGroup',
        'Remove-IAMGroupPolicy',
        'Remove-IAMUserFromGroup',
        'Unregister-IAMGroupPolicy',
        'Update-IAMGroup',
        'Write-IAMGroupPolicy'
    );
    ParameterName = 'GroupName';
    ScriptBlock = {
        <#
        .SYNOPSIS
        Auto-complete the -GroupName parameter value for Amazon Web Services (AWS) cmdlets.
    
        .NOTES
        Created by Trevor Sullivan <trevor@trevorsullivan.net>
        https://trevorsullivan.net
        https://twitter.com/pcgeek86
        #>
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        $ItemList = Get-IAMGroups | Where-Object { $PSItem.GroupName -match $wordToComplete } | ForEach-Object {
            $CompletionText = $PSItem.GroupName;
            $ToolTip = $PSItem.GroupName;
            $ListItemText = $PSItem.GroupName;
            $CompletionResultType = [System.Management.Automation.CompletionResultType]::ParameterValue;

            New-Object -TypeName System.Management.Automation.CompletionResult -ArgumentList @($CompletionText, $ListItemText, $CompletionResultType, $ToolTip);
        }
    
        return $ItemList;
    }
}

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter;