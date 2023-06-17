\pagebreak

# Analysis of Shellbags

"Shellbags" refer to special registry keys that record settings for each user after their login sessions. One of the most notable shellbag entries is remembering where on the screen a program was placed when it was closed. When the program is opened again, it is placed back in the same location on the screen as when it was closed. This usability measure can be used in forensic analysis to prove that a specific program was interacted with by a user. Similarly, shellbags also report which folders and file locations were opened with the File Explorer program. This can be used to prove that a user, and not just a process, interacted with a specific folder or file.

The two files that contain the shellbags registry keys are NTUSER.DAT and USRCLASS.DAT. NTUSER.DAT is responsible for settings related to:

- Network folders,
- Remote machines, and
- Remote folders.

In contrast, USRCLASS.DAT is responsible for settings related to:

- Desktop files,
- ZIP archives, and
- Local folders.

## User yeatsw's USRCLASS.DAT

![Record of files opened in the USRCLASS.DAT file.\label{usrclass}](./images/usrclass.png)

I found the most notable shellbags entries on the system in the USRCLASS.DAT of the user yeatsw. As shown in Figure \ref{usrclass}, a number of local files were opened by the user. The keys as a whole were last written on March 7th, 2021 at 5:16 PM PST. The specific folder which was accessed at this time was the D:/ drive, shown in Figure \ref{usb-shellbag}. Because this drive was accessed close in time to the last connection time of a USB flash drive (as previously identified in the system-wide registry keys), this D:/ drive may be that same flash drive.

![D:\\ drive opened in shellbags.\label{usb-shellbag}](./images/usb-shellbag.png)

Similarly, there were E:/ and F:/ drives that were first and last seen on November 7th, 2020 at 4:35 PM PST. This is shown in Figure \ref{ef-shellbag}.

![E:\\ and F:\\ drives opened in shellbags.\label{ef-shellbag}](./images/ef-shellbag.png)

The Downloads folder was first and last accessed on November 23rd, 2020 at 2:38 PM PST. Often, this folder is used to download and then run software installers. Therefore, I concluded that no new software was installed after this time.

Additionally, there is a Canada folder that was last accessed on November 23rd, 2020 at 2:38 PM PST via the Desktop. This was noteworthy because this is a user-created folder.

Most notably, the Mozilla Thunderbird Program Files were opened in File Explorer on November 23rd, 2020 at 2:41 PM PST. The Program Files is the system folder where applications like Thunderbird keep its program files and data. This corroborates the existence of Thunderbird on the system and implies that the files were directly accessed and possibly modified. These details are pictured in Figure \ref{thunderbird-shellbags}. Thunderbird's contents is discuessed further in the section [Analysis of Application Data].

![Thunderbird Program Files in shellbags.\label{thunderbird-shellbags}](./images/thunderbird-shellbags.png)
