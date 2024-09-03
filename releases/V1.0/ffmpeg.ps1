#Downloading ffmpeg
wget https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip -outfile $Env:TEMP\ffmpeg.zip
#wget https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z -outfile $Env:TEMP\ffmpeg.zip

#Unpacking ffmpeg
Expand-Archive -Path $Env:TEMP\ffmpeg.zip -DestinationPath $Env:C:\"Program Files"\
Rename-Item -Path (Get-ChildItem -Path $Env:C:\"Program Files"\ -Filter "ffmpeg-*").FullName  -NewName "ffmpeg"

#Deleting unnecessary files
Remove-Item -Path $Env:TEMP\ffmpeg.zip

#Adding ffmpeg to the current systems' environment variables
$oldpath = Get-ItemProperty -Path "hklm:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -Name "Path"
$newpath = $oldpath.Path += ";C:\Program Files\ffmpeg\bin"
Set-ItemProperty -Path "hklm:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -Name "Path" -Value $newpath

#Adding ffmpeg to the current user's environment variables
#$oldpath = Get-ItemProperty -Path "HKCU:\Environment" -Name "Path"
#$newpath = $oldpath.Path += ";C:\Program Files\ffmpeg\bin"
#Set-ItemProperty -Path "HKCU:\Environment" -Name "Path" -Value $newpath

#Start-Process SystemPropertiesAdvanced