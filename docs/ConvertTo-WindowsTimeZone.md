---
external help file: WinTZ-help.xml
Module Name: WinTZ
online version:
schema: 2.0.0
---

# ConvertTo-WindowsTimeZone

## SYNOPSIS
Takes an IANA time zone and converts it to a Windows time zone.

## SYNTAX

```
ConvertTo-WindowsTimeZone [[-IANATimeZone] <String>] [<CommonParameters>]
```

## DESCRIPTION
IANA time zones are returned by most web endpoints.
We can translate any
given IANA time zone (e.g.
America/New_York) into a proper Windows time zone
(e.g.
Eastern Standard Time).

This function leverages the unicode.org windowsZones.xml file to translate
IANA to Windows time zones.

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-WindowsTimeZone 'America/New_York'
```

Returns the Windows time zone 'Eastern Standard Time'

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
Default value: (Get-IANATimeZone)
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
