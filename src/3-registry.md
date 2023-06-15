# Analysis of Registry

The Windows registry is a common database for Windows itself and all applications to store their settings and small log entries. The registry maintains backups and a recent record of changes to the registry. Additionally, changes made to the registry are held in intermediate files and only written to the actual registry at system shutdown. These unwritten changes are referred to as "dirty" registry hives. Because of this behavior, the registry is especially valuable in forensic analysis because it can capture unique states of the computer (such as an incomplete shut down), and because the registry's keys are difficult to forge. Registry keys are written in heirarchical form and they look like a file path.

The registry keys of the case image were analyzed by extracting the hive files from the virtual disk copy via Autopsy and importing them into the common registry inspection tool called Registry Explorer. In some instances, such as with the HKEY_LOCAL_MACHINE\\SOFTWARE key, the hive contained dirty registry keys - values that hadn't been recorded to the final registry before abrupt system shutdowns. Windows only "commits" registry keys to the hive during clean shutdowns; otherwise, they're kepy in .LOG files duuring execution. These dirty registry keys were recovered by extracting the SOFTWARE.LOG files from the case image and applying them to the dirty hive through Registry Explorer. By doing this, not only did I have a record of what changes were made to the registry before the abrupt system shutdown, but I was also able to see any unusually deleted registry keys.

## Last User to Log In

This registry key is found in HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Authentication\\LogonUI\\LastLoggedOnUser.

The last user to log in on this PC was the domain user account `yeatsw` under the Byzantium domain.

## Last Time the Computer Was Shut Down

This registry key is found in HKLM\\SYSTEM\\CurrentControlSet\\Control\\Windows\\ShutdownTime.

Times of write are stored by Windows as binary FILETIME formats. Registry Explorer contains a Data Interpreter tool that will translate these formats to the relevant time and time zone. The last time the computer was shutdown was December 13th, 2020 at 6:07 AM PST. The fact that the last shutdown time was several months before the dumping of the PC, and the fact that the SYSTEM hive was also dirty, supports the implication that the computer was improperly shut down, either by pulling the plug or something similar.

## Last Write Time On NTUSER.DAT

NTUSER.DAT's last write time can be found in the properties of the file itself. NTUSER.DAT (along with a file called USRCLASS.DAT) contain special registry keys called shellbags (for more information, see [Analysis of Shellbags]). The write times of these indicate either the last log in of the user, or intentional tampering of the files. However, intentional tampering of the files would be corroborated by additional evidence found in the shellbags themselves.

The user john.mccrae's last write time on NTUSER.DAT was December 7th, 2020 at 10:50 PM PST.

The user Ted.Roethke's last write time was Decmeber 7th, 2020 at 10:54 PM PST.

The user WillyB's last write time was November 7th, 2020 at 4:14 PM PST.

The user yeatsw's last write time was March 7th, 2021 at 5:22 PM PST.

All user's files are shown in Figures \ref{mccrae-ntuser} through \ref{yeatsw-ntuser}, and all had LOG files present that indicate improper shutdowns at various times.

## Information about Any Connected USB Devices

These registry keys are found in  HKLM\\SYSTEM\\CurrentControlSet\\Enum\\USBSTOR.

Each key will be the name of the USB device. Each of those keys has a subkey that seems like random letters and numbers. That subkey is either the serial number of the device, or if Windows cannot detect that, then it is a fake identifier consisting of random letters and numbers. These two identifiers can be differentiated by the presence of an ampersand ("&" symbol) in the second to last position in the string. The real serial numbers can be used to cross-reference with any physical removable media found in a crime scene. However, no such removable media was recovered in this case. I was also able to obtain the last time that the device was plugged in by noting the last time that the registry key for the USB device waas written.

There were two USB flash drives previously in the PC. The "last write time" of the flash drives' keys indicate the last time they were plugged in, which was March 7th, 2021 at 5:06 PM PST for one and November 18th at 11:50 PM PST for the other. Note that the timestamps in Figure \ref{usb-registry} are shown in timezone UTC.

## Paths to Installed Executables

This registry key can be found in HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths.

This key provides the relevant information for installed software on the system (such as the path to the executable). Because of this, we can use it as a directory listing of the installed software.

As shown in Figure \ref{installed-exe}, the one executable of note is that Thunderbird is installed on the system. Mozilla Thunderbird is an email client, which implies that there are emails to inspect on the system. The executables with unusual names are legitimate Microsoft programs.

## Recovered Deleted Registry Keys

Because of the abrupt shutdown, I was able to recover some registry keys that had been deleted. As shown in Figure \ref{nvidia-keys}, they all consisted of NVIDIA drivers or utilities for NVIDIA graphics cards. The PC in the case was large (coloquially known as a "tower") and was able to accomodate a standalone graphics card. This implies that there was an NVIDIA graphics card installed in the system that was removed prior to it being improperly shut off and dumped. The last write time on these keys was March 7th, 2021 at 5:24 PM PST.
