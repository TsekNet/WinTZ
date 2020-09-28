---
external help file: WinTZ-help.xml
Module Name: WinTZ
online version:
schema: 2.0.0
---

# Get-IANATimeZone

## SYNOPSIS
Returns the IANA Time Zone based on public IP address.

## SYNTAX

```
Get-IANATimeZone [[-IPAddress] <String>] [<CommonParameters>]
```

## DESCRIPTION
There are two endpoints used to obtain the IANA Time Zone:

- ifconfig.me: Get the public IP address of the host
- ip-api.com: Translate the public IP into an IANA time zone

## EXAMPLES

### EXAMPLE 1
```
Get-IANATimeZone
```

Returns the IANA time zone for the current host.

### EXAMPLE 2
```
Get-IANATimeZone 8.8.8.8
```

Returns the IANA time zone for the IP address 8.8.8.8

## PARAMETERS

### -IPAddress
Specifies the IP address to get the IANA time zone for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: (Invoke-WebRequest -Uri 'https://ifconfig.me/ip' -ContentType 'text/plain').Content.Trim()
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### IANA time zone, as a string
## NOTES

## RELATED LINKS
