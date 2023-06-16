# Analysis of Application Data

## Emails in Thunderbird

Autopsy extracted several email messages from the Thunderbird client on the case image. These are stepped through by email thread below. All email threads are included verbatim in [Appendix B: Emails]

'gonne` refers to gonne@byzantiumus.com

'yeatsw' refers to yeatsw@byzantiumus.com

### Hiding Files in Other Files

In the following email threads, Yeats and Gonne use a method to hide their real files in other files. This can be done by pasting the content of the hidden file on the end of the cover file. This is done in the binary data of the files. 

To extract the hidden file, I consulted a chart of [common file data signifiers](https://www.garykessler.net/library/file_sigs.html) and opened the files in a hex editor to inspect the raw binary. All of the files were JPGs and JFIFs, two very similar image formats. Both formats start their data with the hex sequence `FF D8 FF E0 xx xx 4A 46 49 46 00`. All of the images conformed to that. Additionally, the file format has a "trailer" sequence of `FF D9` that signifies the end of the file. 

I searched from within the hex editor for the first instance of that hex sequence. If the file is not hiding another file, then this sequence will be found at the end of the file. However, if it is in the middle of the file, then there is a file stitched on to the end of the cover file. In Figure \ref{hex-xlsx}, I highlight the trailer bytes as well as the header bytes for a new file (which indicates a Microsoft document). To extract this file, I deleted all of the content leading up to these new header bytes, and then saved the result as a new file of the detected type. In this example, the file was a spreadsheet and I saved the file with the extension `.xlsx`.

![](./images/hex-xlsx)

### Subject: ok?

- 2020-11-08 @ 6:16 AM PST: gonne checks in with yeats
- 2020-11-08 @ 7:28 AM PST: yeatsw mentions the old hard drive died and he had to reinstall "everything"
- 2020-11-08 @ 5:17 PM PST: gonne asks yeastw how much he thinks he'll "need" as a bonus
- 2022-11-11 @ 8:50 PM PST: yeatsw says to gonne:
    - "Canada is all taken care of, although we'll need to make a trip there soon."
    - "All that remains is my trip south of the equator. Will cost about $200k for the both of us."
    - "You can judge how much a bonus would be suspicious--be nice to make a down payment on the property."

This implies that Gonne and Yeats had pre-existing plans for something involving travel underway. It also implies that they were intending on using the bonus from Rose City as part of the plan, making a down payment on a property.

No other files were attached to the email thread.

### Subject: Guess what I got today?

- 2020-11-16 @ 3:43 PM PST: yeatsw says to gonne:
    - That they are all ready for their plan
    - That he has something else to send to her but doesn't "want to send that in the clear."
    - "Remember when we took CS373 together--the way we started sharing things after that lab? Yeah. Next time."

Yeats' final note indicates that next time he sends files, he is going to attempt to hide it in some fashion. He indicates to Gonne that this will be a hiding scheme that she already knows.

An image was attached to the message, which was a JFIF of two passports named `chepcolhmclgoecn.jfif.` The image was inspected and no hidden files were found.

### 

## The Phishing Email Impersonating Byzantium



## IDFK something else? 
