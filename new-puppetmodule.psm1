Function New-PuppetModule
{
<#
 .SYNOPSIS
 Function to create the folder structure for a new Puppet class.

.DESCRIPTION
 Function to create the folder structure for a new Puppet class.

.PARAMETER Path
 Path to the Puppet modules folder

.PARAMETER Name
 Mane of the Puppet module

.PARAMETER Files
 Create a 'files' folder in the Module

.PARAMETER Templates
 Create a 'templates' folder in the Module

.PARAMETER Lib
 Create a 'lib' folder in the Module

.PARAMETER Tests
 Create a 'tests' folder in the Module

.PARAMETER Spec
 Create a 'spec' folder in the Module

.PARAMETER Full
 Create all standard module folders

.INPUTS
 IO.DirectoryInfo

.OUTPUTS
 None

.EXAMPLE
 PS> New-PuppetModule -Path c:\Users\Documents\Fred\puppet\modules -Name newmodule -Files -Templates

.EXAMPLE
 PS> New-PuppetModule -Path c:\Users\Documents\Fred\puppet\modules -Name newmodule -Full

 .NOTES
 Version: 1.0 - First draft
 Date: 31/10/2013
 Tag: puppet,module
 Module layout determined from http://docs.puppetlabs.com/puppet/3/reference/modules_fundamentals.html
#>
 [CmdletBinding(DefaultParameterSetName='Individual')]

Param
 (
 [Parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]
 [IO.DirectoryInfo]$Path,

[Parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]
 [String]$Name,

[Parameter(Mandatory=$false,ParameterSetName='Individual')]
 [Switch]$Files,

[Parameter(Mandatory=$false,ParameterSetName='Individual')]
 [Switch]$Templates,

[Parameter(Mandatory=$false,ParameterSetName='Individual')]
 [Switch]$Lib,

[Parameter(Mandatory=$false,ParameterSetName='Individual')]
 [Switch]$Tests,

[Parameter(Mandatory=$false,ParameterSetName='Individual')]
 [Switch]$Spec,

[Parameter(Mandatory=$false,ParameterSetName='Full')]
 [Switch]$Full
 )

try {

# --- Check that the path to the Puppet modules folder exists
 if (!($Path.Exists)){

throw "Please supply the correct path to the Puppet modules folder"
 }

# --- Ensure module name is lower case and no spaces
 $Name = ($Name -replace " ","_").ToLower()

# --- Check if the module already exists
 $NewModulePath = Join-Path -Path $Path -ChildPath $Name

 if (Test-Path $NewModulePath){

throw "Puppet module $Name already exists"
 }

 # --- Create module folder, default manifests folder and init.pp file
 New-Item -Path $NewModulePath -ItemType Directory | Out-Null

$ManifestsPath = (Join-Path -Path $NewModulePath -ChildPath "manifests")

New-Item -Path $ManifestsPath -ItemType Directory | Out-Null
 New-Item -Path (Join-Path -Path $ManifestsPath -ChildPath "init.pp") -ItemType File | Out-Null

# --- Create the module subfolders depending on which have been requested
 switch ($PsCmdlet.ParameterSetName)
 {
 "Individual" {

 if ($PSBoundParameters.ContainsKey('Files')){

New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "files") -ItemType Directory | Out-Null
 }

if ($PSBoundParameters.ContainsKey('Templates')){

New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "templates") -ItemType Directory | Out-Null
 }

if ($PSBoundParameters.ContainsKey('Lib')){

New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "lib") -ItemType Directory | Out-Null
 }

if ($PSBoundParameters.ContainsKey('Tests')){

New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "tests") -ItemType Directory | Out-Null
 }

if ($PSBoundParameters.ContainsKey('Spec')){

New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "spec") -ItemType Directory | Out-Null
 }

break
 }

 "Full" {

 New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "files") -ItemType Directory | Out-Null
 New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "templates") -ItemType Directory | Out-Null
 New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "lib") -ItemType Directory | Out-Null
 New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "tests") -ItemType Directory | Out-Null
 New-Item -Path (Join-Path -Path $NewModulePath -ChildPath "spec") -ItemType Directory | Out-Null

break
 }
 }
 }

catch [Exception]{

throw "Unable to create new Puppet module"
 }
}
