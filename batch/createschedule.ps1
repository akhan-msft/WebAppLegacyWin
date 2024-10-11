## runs the console application every 5 minutes
Register-ScheduledTask -Xml (gc 'C:\batch\BATCH_JOB.xml' | out-string) -TaskName "JournalEntryConsoleApp" -Force;