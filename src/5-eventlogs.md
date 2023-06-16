# Analysis of Event Logs

Event logs in Windows are a centralized depository for the operating system and various applications to routinely store information about different activity seen on the system, and when it happened. The most major event logs maintained by Windows are the Security log and the System log. The Security log primarily keeps track of user logons, "Run as administrator" executions, and other sensitive data access. The system log contains low-level system information such as logs from device drivers. 

I used these log sources in order to build a skeleton for the timeline of events. I noted when users logged on and logged off, as well as when the computer shut off (properly or not). 

I analyzed the event logs by extracting the SYSTEM and SECURITY logs from the case image and by using a program called Event Log Explorer, which gave me a finer-tuned control over filtering and viewing the logs. In all following screenshots, the application's timezone has been changed to Pacific time to reflect the local time of the case. All times shown are in Pacific (PST).

## Event Log Explorer

![A screenshot of Event Log Explorer showing the details of a user logon.\label{logon-elex}](./images/logon-elex.png)

Figure \ref{logon-elex} shows Event Log Explorer with filtered Security logs. One highlighted log is the login of the yeatsw account on November 7th, 2020 at 4:20 PM. There are additional "logins" shown in the logs, however these are routine logons by system services, not users.

## Security Log 

I extracted the following timeline items from the Security logs, grouped by day:

- 2020-11-07 @ 11:24 AM: User WillyB cleared the Security event logs
- 2020-11-07 @ 4:14 PM: User WillyB logged off
- 2020-11-07 @ 4:20 PM: User yeatsw logged in
- 2020-11-07 @ 5:01 PM: User yeatsw logged off
- 2020-11-07 @ 5:02 PM: User yeatsw logged in
\
- 2020-11-08 @ 7:16 AM: User yeatsw's session was terminated
- 2020-11-08 @ 7:16 AM: User yeatsw logged in
\
- 2020-11-11 @ 8:46 PM: User yeatsw's session was terminated
- 2020-11-11 @ 8:46 PM: User yeatsw logged in
\
- 2020-11-16 @ 10:24 AM: User yeatsw's session was terminated
- 2020-11-16 @ 10:24 AM: User yeatsw logged in
- 2020-11-16 @ 10:58 AM: A dirty log was not written to the Event Log
- 2020-11-16 @ 3:36 PM: User yeatsw logged in
\
- 2020-11-23 @ 2:24 PM: User yeatsw's session was terminated
- 2020-11-23 @ 2:24 PM: User yeatsw logged in
- 2020-11-23 @ 2:59 PM: User yeatsw's session was terminated
- 2020-11-23 @ 2:59 PM: User yeatsw logged in
- 2020-11-23 @ 3:31 PM: A dirty log was not written to the Event Log
\
- 2020-11-24 @ 4:09 AM: User yeatsw logged in 
\
- 2020-12-05 @ 4:00 AM: User yeatsw's session was terminated
- 2020-12-05 @ 4:00 AM: User yeatsw logged in
\
- 2020-12-07 @ 8:16 PM: User yeatsw's session as terminated
- 2020-12-07 @ 8:16 PM: User yeatsw logged in 
- 2020-12-07 @ 8:34 PM: User yeatsw's session as terminated
- 2020-12-07 @ 8:34 PM: User yeatsw logged in 
- 2020-12-07 @ 9:57 PM: User yeatsw's session as terminated
- 2020-12-07 @ 9:57 PM: User yeatsw logged in
- 2020-12-07 @ 10:36 PM: User yeatsw's session as terminated
- 2020-12-07 @ 10:36 PM: User yeatsw logged in
- 2020-12-07 @ 10:45 User yeatsw logged off
- 2020-12-07 @ 10:48 PM: User john.mccrae logged in
- 2020-12-07 @ 10:50 PM: User john.mccrae logged off
- 2020-12-07 @ 10:52 PM: User Ted.Roethke logged in
- 2020-12-07 @ 10:54 PM: User Ted.Roethke logged off
- 2020-12-07 @ 10:54 PM: User yeatsw logged in
\
- 2020-12-13 @ 6:07 AM: User yeatsw logged off
- 2020-12-13 @ 6:09 AM: User yeatsw logged in
- 2020-12-13 @ 6:13 AM: User yeatsw logged off
- 2020-12-13 @ 9:11 AM: User yeatsw logged in 
\
- 2021-03-07 @ 5:23 PM: A dirty log was not written to the Event Log

A "session terminated" log means that the account was forcefully logged out by the operating system. This is usually because the account is trying to log in again and the previous session was not logged out of first.

A log of "A dirty log was not written to the Event Log" indicates that there was an improper shutdown of the system. Because there were dirty logs at the time of the shutdown, these were dropped instead of written to the event logs.

## System Log

I extracted the following timeline items from the System logs, grouped by day:

- 2022-11-07 @ 11:19 AM: System started
    - Implied by 12:00 PM log of "The system uptime is 2444 seconds."
- 2020-11-07 @ 11:24 AM: The System Event Logs were cleared
- 2020-11-07 @ 12:00 PM: "The system uptime is 2444 seconds."
- 2020-11-07 @ 3:46 PM: Other Event Logs were cleared
- 2020-11-07 @ 4:13 PM: Computer joined to byzantiumus.com domain
- 2020-11-07 @ 4:14 PM: User WillyB restarted the computer
- 2020-11-07 @ 4:36 PM: Service "Mozilla Maintenance" was registered
- 2020-11-07 @ 5:01 PM: User yeatsw restarted the computer
\
- 2020-11-16 @ 10:21 AM: "Shutdown unexpected"
- 2020-11-16 @ 10:57 AM: The system was started and the Last Shutdown Time was incorrect
- 2020-11-16 @ 10:59 AM: The system rebooted from a bug check
\
- 2020-11-19 @ 1:02 AM: System was put to sleep
\
- 2020-11-23 @ 2:23 PM: System resumed from sleep.
- 2020-11-28 @ 2:58 PM: Dirty shutdown
- 2020-11-23 @ 3:30 PM: Unexpected restart of the system.
\
- 2020-11-24 @ 4:10 AM: "The start type of the Auto Time Zone Updater service was changed from demand start to disabled."
\
- 2020-12-07 @ 10:45 PM: Clean system shutdown by kernel
- 2020-12-07 @ 10:47 PM: System start
- 2020-12-07 @ 10:50 PM: Clean system shutdown by kernel
- 2020-12-07 @ 10:52 PM: System start
\
- 2020-12-13 @ 6:07 AM: Clean system shutdown by kernel
- 2020-12-13 @ 6:08 AM: System start
\
- 2020-12-13 @ 6:13 AM: System went to sleep
- 2020-12-13 @ 6:14 AM: System resumed from sleep
\
- 2021-03-07 @ 5:22 PM: System restarting from a dirty shutdown
- 2021-03-07 @ 5:23 PM: The last shutdown time was incorrect

These restarts are a mixture of clean shutdowns and dirty shutdowns. I correlated these with the other evidence in order to extract more information, such as what was occurring on the system that might have led to the dirty shutdown.
