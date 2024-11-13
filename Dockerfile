
# Use the official Microsoft ASP.NET 4.8 Runtime as the base image
#FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8.1
#mcr.microsoft.com/windows/servercore:ltsc2022
#FROM mcr.microsoft.com/windows/servercore/iis



WORKDIR /LogMonitor
COPY logmonitor/ /LogMonitor

#copy files from batch into batch dir

WORKDIR batch
 COPY batch/ /batch

#COPY logs/ /app/logs

RUN New-Item -Path 'C:\web\logs' -ItemType Directory

#run powershell commaand to execute batch exceute

RUN powershell -file "C:\batch\createschedule.ps1"
 

# Set the working directory inside the container
WORKDIR /inetpub/wwwroot

# Copy the published ASP.NET web application to the container
#COPY bin/app.publish/ .

COPY . .

RUN c:\windows\system32\inetsrv\appcmd.exe set config -section:system.applicationHost/sites /"[name='Default Web Site'].logFile.logTargetW3C:"File,ETW"" /commit:apphost

# Expose port 80 for the web application
EXPOSE 80

#WORKDIR /LogMonitor
ENTRYPOINT ["C:\\LogMonitor\\LogMonitor.exe","C:\\ServiceMonitor.exe", "w3svc"]

 
