$ArgumentCompleter = @{
    ### Command to dynamically retrieve all appropriate commands to register with:
    ### (Get-Command -Module AWSPowerShell -Name *R53D* -ParameterName DomainName).ForEach({ "'{0}'," -f $PSItem }) | Set-Clipboard;
    CommandName = @(
        'Disable-R53DDomainAutoRenew',
        'Disable-R53DDomainTransferLock',
        'Enable-R53DDomainAutoRenew',
        'Enable-R53DDomainTransferLock',
        'Get-R53DDomainAuthCode',
        'Get-R53DDomainAvailability',
        'Get-R53DDomainDetail',
        'Get-R53DTagsForDomain',
        'Invoke-R53DDomainTransfer',
        'Register-R53DDomain',
        'Remove-R53DTagsForDomain',
        'Update-R53DDomainContact',
        'Update-R53DDomainContactPrivacy',
        'Update-R53DDomainNameservers',
        'Update-R53DTagsForDomain'
    );
    ParameterName = 'DomainName';
    ScriptBlock = {
        <#
        .SYNOPSIS
        Auto-complete the -DomainName parameter value for Amazon Web Services (AWS) cmdlets.
    
        .NOTES
        Created by Trevor Sullivan <trevor@trevorsullivan.net>
        https://trevorsullivan.net
        https://twitter.com/pcgeek86
        #>
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        $ItemList = Get-R53DDomains | Where-Object { $PSItem.DomainName -match $wordToComplete } | ForEach-Object {
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