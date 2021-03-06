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
By Default, this function automatically determines the Windows Time Zone from
the host's public IP address.

Optionally, a IANATimeZone can be specified, such as 'America/New_York' to be
converted into a Windows time zone.

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
