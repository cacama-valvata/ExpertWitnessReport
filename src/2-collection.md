# Collection of Digital Evidence

Senior digital forensics analyst Dave Nevin, from the Oregon Forensics Laboratory, collected the physical hard disk drive from the PC that was found by the Lake Oswego Police Department. He then produced a raw *forensics copy*—a bit for bit digital copy of the hard drive.

He did this with a write-blocker device and a software program called FTK Imager. A write-blocker device is a piece of physical hardware that goes in between the copying computer and the hard drive to be copied. Operating systems such as Windows attempt to write to connected hard drives as a way to detect if they are present in the system. This write procedure may accidentally overwrite information stored on the hard drive. By using a write-blocker, Dave is able to read the information from the hard drive without introducing any new artifacts into the evidence.

Dave then used FTK Imager to make an exact copy of the hard drive's contents into files stored on his workstation laptop. FTK Imager will read all of the bytes of the hard drive and make an identical copy of these bytes into files that represent a virtual (digital-only) hard drive. This process will produce an identical copy to the hard drive that was pulled from the PC. 

Dave then verified that the digital copy exactly matched the contents of the hard drive by comparing the two's hash values. Hash values are strings of data that result from repeatedly performing a condensing operation on the input until a short enough output remains. Because these hash values are derived from the input itself, they are effectively a unique "thumbprint" to distinguish pieces of inputs from each other. If the physical and the digital hard drive's hash values did not match, Dave would know that some corruption had occurred during the copying of the drive. In that case, Dave would have copied the drive again until the hash values matched.

Finally, Dave transferred the virtual hard drive and its corresponding hash value to me, before transferring the physical evidence back to Oregon Forensics Laboratory's safekeeping.

# Preliminary Checks

Prior to performing my analysis, I conducted some preliminary checks on the hard drive copy I was given. First I opened the drive copy in FTK Imager, and produced hash values for it. I checked that these hash values matched the hash values I was given by Dave Nevin, and they were identical:

- MD5: 0a36e3259c650a63e359ec1a4a0c362c
- SHA1: b4f6567f2d3453a1d0d0b6258cad1bfbcb50de56

![Calculated hashes compared against the reported hashes in FTK Imager.](./images/drive-hashes.png)

I then connected the drive copy to my Windows workstation laptop so that it couldn't be written or modified ("read-only" mode), and ran an antivirus scan using Windows Defender.

I did this by "mounting" the image as a drive on Windows through FTK Imager in "read-only" mode, and then running a targeted scan through Defender to look at only the files on the drive. There were zero threats found on the drive.

![Mounting the image as a drive through FTK Imager.](./images/ftk-mounting.png)

![Zero threats found on the case image.](./images/defender-threats.png)
