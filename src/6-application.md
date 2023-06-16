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

An image was attached to the message, which was a JFIF of two Canadian passports named `chepcolhmclgoecn.jfif.` The image was inspected and no hidden files were found.

![](./images/case/chepcolhmclgoecn.jfif)

### Subject: Guess what I got in the mail today?

- 2020-11-23 @ 2:45 PM PST: yeatsw says to gonne:
    - That he has received something in the mail
    - That they will be in the tropics "every soon"
    - He also attached two images, described below
- 2020-11-23 @ 2:58 PM PST: gonne implies to yeatsw that it "must've cost a small fortune"
- 2020-11-23 @ 3:03 PM PST: yeatsw tells gonne that he performed a SQL injection attack to add 2 fake birth certificate records and then got themselves new passports with the new identities
- 20202-11-23 @ 3:24 PM PST: gonne says to yeats:
    - Affirming that she is in love with him
    - Mentioning that she's not looking forward to getting married
    - Mentioning that they need "to be more careful at work" to keep their relationship a secret

This email thread implies that they will be assuming fake identities as Canadian citizens and getting married. Yeats also admits to hacking the British Columbia's systems in order to plant the fake birth certificates.

Two images were attached to the original message, both of which contained hidden files that I carved out of the original files. The two files were `sunset.jpg` and `mandw1.jpg`. Both are pictured in Figures \ref{sunset} and \ref{mandw1}.

I extracted the same image of two Canadian passports out of `sunset.jpg`, pictured in Figure \ref{chep}. Additionally, I extracted a copy of a Canadian birth certificate  from `mandw1.jpg`, pictured in \ref{birth-cert}.

### Subject: leaving now

- 2020-12-05 @ 4:46 AM PST: yeatsw tells gonne:
    - To meet him in Redmond, Washington "at that Indian restaurant ... at 11ish"
    - That he is flying into Vancouver before driving down so that their registration matches their passports
    - That they are meeting the Commissioner at 4.
- 2020-12-05 @ 5:22 PM PST: gonne affirms this to yeatsw

In these emails, Yeats and Gonne are planning on meeting up in order to get married and are planning their arrival so that their papers are more realistic. This is corroborated by the next email message that contains a wedding photo.

No other files were attached to these messages.

### Subject: We're actually doing this

- 2020-12-07 @ 8:15 PM PST: gonne asks yeatsw when he is heading out
    - There is also implications that something happened to Jack
- 2020-12-07 @ 8:48 PM PST: yeatsw tells gonne:
    - Refers to her under her new married name
    - That "Jack got what he deserved"
    - That he's flying out on Sunday and arriving in Bauerfield International Airport (VLI), in Vanuatu, a Pacific island near Australia.
    - That their mail server was going to be moved to AWS but not to use it for awhile because their firewall will alert on domains that have recently changed
    - That he got some bank accounts set up with Bitcoin

In this email thread, it is confirmed that they got married. There is indication that something happened to their Rose City co-founder Jack in the public eye. Additionally, Yeats is planning to fly out to a small Pacific island, presumably as part of their ongoing plan. Yeats additionally set up some bank accounts for them, and tells Gonne that he'll send her the info.

There is an image attached to the email, `23C5D-5FCEFE00-9-35F8C2C0` without an extension. By inspecting the binary data of the file, I saw that it was another JFIF by the starting hex sequence of `FF D8 FF E0 xx xx 4A 46 49 46 00`. This picture depicts Yeats and Gonne at their wedding. I found no hidden files in this image.

### Subject: No accounting for taste

- 2020-12-07 @ 10:44 PM PST: yeatsw tells gonne that they made "a few quid" with Bitcoin

There was an image attached to the message, `balcony.jpg`, pictured in Figure \ref{balcony}. A ZIP file was hidden inside of it, identified by the magic bytes `PK......`. 

Microsoft Office documents are actually ZIP folders in disguise. I was able to identify what kind of Office document it was by looking at the data inside. Because there is an `xl` in the data, this means that this is a spreadsheet. I isolated the ZIP data in my hex editor and saved the resulting file as `hidden.xlsx`. Opening the spreadsheet, the file contained bank account information, pictured in \ref{xlsx-bank}.

### Subject: Go

- 2021-03-07 @ 5:17 PM PST: yeatsw tells gonne:
    - That the money has been moved
    - That he's driving down to an airport from Astoria
    - The name of the island and the coordinates of where to stay
    - That he is going to delete his server and throw his PC away, and that she should throw her laptop "in the river" as well

Additionally, there are two JPGs attached to the message containing boarding passes, `UABoard SFO-MEX-m.jpg` and `UABoard MEX-VLI-m.jpg`. These are pictured in Figures \ref{boarding-1}-\ref{boarding-2}. I found no hidden files within these images.

## The Phishing Email Impersonating Byzantium

Rose City was also subject to a serious phishing email that frauded them out of $13 million. This email is reproduced below.

```
Ms. Gonne:

Just wanted to drop a quick note thanking you for selecting us to build your new corporate headquarters. It is very exciting for us to work on another LEED Platinum facility, and we’re especially eager to work on our first cross laminated timber facility.

I have faxed a copy of an invoice to your purchasing department for the 22% up-front costs, for a total of $13,150,800, as agreed in the contract.

Please note that we have recently changed banks; this should be reflected on the invoice but worth verifying, considering the amount. Our new account is through Green Dot Bank, account # 1456874801, routing # 124302529. We will begin the permitting process as soon as payment is received.

Looking forward to seeing you on Thursday.

Thanks again,

Ted

 

Theodore Roethke

Sr. Vice President, Corporate Accounts US
Byzantium Construction
p: 503-626-6000, ext. 476
m: 503-641-7789
a: 815 SW Park Ave, Portland, OR 97205
w: www.byzantiumus.com
e: Ted.Roethke@byzantiumus.com
```

While I was unable to obtain the headers for the email, the signature at the bottom contains links matching the domain that Yeats set up for his and Gonne's email communication. This implies that Yeats may have been the one to send the phishing email, and then transferred the money offshore.

## Web History

Autopsy also analyzed the case image for web history. The URLs include visits to byzantiumus.com, and the title of the webpage implies that this is a Zentyal server, which is a web interface for email. This is the email server that Yeats set up for his and Gonne's email communication, and also possibly for sending the phishing email as Ted.Roethke@byzantiumus.com. These URLs are shown in Figure \ref{web-history}.

Some URLs were last accessed on 2020-12-07 @ 10:06 PM PST, and some were last accessed on 2020-03-07 @ 5:21 PM PST. One interesting URL is `/sysinfo/View/Halt` visited on 2020-03-07 @ 5:21 PM PST. This timing aligns with Yeats' plan to delete his servers and dump the PC.

In addition, the user yeatsw opened several images in his browser:

- 2020-11-23 @ 2:25 PM PST: D:\\ balcony1.jpg
- 2020-11-23 @ 2:41 PM PST: C:\\ Users\\ yeatsw\\ Desktop\\ sunset.jpg
- 2020-11-23 @ 2:42 PM PST: C:\\ Users\\ yeatsw\\ Desktop\\ mandw1.jpg
- 2020-12-07 @ 10:42 PM PST: C:\\ Users\\ yeatsw\\ Desktop\\ balcony.jpg

## Recent Files

Autopsy also extracted Windows "Recent files" metadata from the case image. On Windows, this provides links to the real folder elsewhere on the system. From these list of links we can compile a list of user-created content and the last time of access.

- 2020-11-16 @ 3:37 PM PST: C:\\ Users\\ yeatsw\\ Canada
- 2020-11-23 @ 2:25 PM PST: D:\\ balcony1.jpg
- 2020-11-23 @ 2:25 PM PST: D:\\ 
- 2020-11-23 @ 2:32 PM PST: C:\\ Users\\ yeatsw\\ Desktop\\ mandw.jpg
- 2020-11-23 @ 2:42 PM PST: C:\\ Users\\ yeatsw\\ Desktop\\ mandw1.jpg
- 2020-11-23 @ 2:41 PM PST: C:\\ Users\\ yeatsw\\ Desktop\\ sunset.jpg
- 2020-12-07 @ 10:42 PM PST: C:\\ Users\\ yeatsw\\ Desktop\\ balcony.jpg
