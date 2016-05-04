$ArgumentCompleter = @{
    ### Command to dynamically retrieve all appropriate commands to register with:
    ### (Get-Command -Module AWSPowerShell -Name *ec2* -ParameterName InstanceId).ForEach({ "'{0}'," -f $PSItem }) | Set-Clipboard;
    CommandName = @(
        'Add-EC2ClassicLinkVpc',
        'Add-EC2NetworkInterface',
        'Add-EC2Volume',
        'Confirm-EC2ProductInstance',
        'Dismount-EC2ClassicLinkVpc',
        'Dismount-EC2Volume',
        'Edit-EC2InstanceAttribute',
        'Edit-EC2InstancePlacement',
        'Get-EC2ClassicLinkInstance',
        'Get-EC2ConsoleOutput',
        'Get-EC2InstanceAttribute',
        'Get-EC2InstanceStatus',
        'Get-EC2PasswordData',
        'New-EC2Image',
        'New-EC2InstanceBundle',
        'New-EC2InstanceExportTask',
        'New-EC2Route',
        'Register-EC2Address',
        'Reset-EC2InstanceAttribute',
        'Restart-EC2Instance',
        'Send-EC2InstanceStatus',
        'Set-EC2Route',
        'Start-EC2Instance',
        'Start-EC2InstanceMonitoring',
        'Stop-EC2InstanceMonitoring'
    );
    ParameterName = 'InstanceId';
    ScriptBlock = {
        <#
        .SYNOPSIS
        Auto-complete the -InstanceId parameter value for Amazon Web Services (AWS) cmdlets.
    
        .NOTES
        Created by Trevor Sullivan <trevor@trevorsullivan.net>
        https://trevorsullivan.net
        https://twitter.com/pcgeek86
        #>
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        $ItemList = (Get-EC2Instance).Instances | Where-Object { $PSItem.KeyName -match $wordToComplete } | ForEach-Object {
            $CompletionText = $PSItem.InstanceId;
            $ToolTip = 'Instance named {0} with ID {1}' -f $PSItem.KeyName, $PSItem.InstanceId;
            $ListItemText = '{0}' -f $PSItem.KeyName;
            $CompletionResultType = [System.Management.Automation.CompletionResultType]::ParameterValue;

            New-Object -TypeName System.Management.Automation.CompletionResult -ArgumentList @($CompletionText, $ListItemText, $CompletionResultType, $ToolTip);
        }
    
        ### Return the fresh completion results
        return $ItemList;
    }
}

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter;