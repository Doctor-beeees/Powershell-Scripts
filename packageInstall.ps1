

#locations to the share and path the package will be installed
$packagePath = ""
$localPath = ""

#test if the share is accessable
if( -not (test-path $packagePath) ) {
    Write-Output "Failed to access package at $packagePath"
    Write-Host "Failed to access package at $packagePath"
    return
}

#package is copied over to designated local path
Copy-Item -Path $packagePath -Destination $localPath -Force


#the install arguments to designate how to install eg silently no restart
$arguments = "" 

#the install package name goes here
$exe = ""

#checks the package has made it locally
if( -not (test-path $localPath $exe) ) {
    Write-Output "Failed to locate $exe"
    Write-Host "Failed to locate $exe"
    return
}

#begins proccess of install, pusged to that directory for insances where msi exec is used. waits a few minutes before starting install
Write-Output "Everything checks out... Beginning install..."
Write-Host "Everything checks out... Beginning install..."
Push-Location $localPath 
Start-Process $localPath  $argumentsWestlaw -startsleep 240s


