---
external help file: WinTZ-help.xml
Module Name: WinTZ
online version:
schema: 2.0.0
---

# Set-WindowsTimeZone

## SYNOPSIS
Sets the Windows time zone.

## SYNTAX

```
Set-WindowsTimeZone [[-IANATimeZone] <String>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This prompt adds the following functionality:

- Invocation ID count (how many times a command was executed)
- The custom output of the current directory, with optional trimming if the current directory is determined to be too long.
- Posh-Git integration
- Built-in timers for each command executed in the console
- The current local time
- A custom ASCII symbol placed before the cursor

## EXAMPLES

### EXAMPLE 1
```
Set-WindowsTimeZone -Force
```

Sets the Windows time zone based on public IP address, without prompting for
confirmation.

### EXAMPLE 2
```
Set-WindowsTimeZone -IANATimeZone 'America/New_York'
```

Sets the Windows time zone to 'Eastern Standard Time', which is derived from
the IANA time zone 'America/New_York', and prompts the user for confirmation.

## PARAMETERS

### -IANATimeZone
IANA time zone string.
Reference: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Controls whether or not the user is prompted to change the time zone.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
