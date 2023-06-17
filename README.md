# ExpertWitnessReport

This contains material and an automatic build of an Expert Witness Report on a fake missing persons case. I played the role of a Digital Forensics Analyst investigating an image of a hard drive recovered from a dumped PC presumably belonging to the missing person.

I analyzed the registry keys on the system, the shellbags of the users present on the system, the system's event logs, and application data found through Autopsy. In each relevant section, I detail more about each component's relevancy to the case as well as how to interpret information found in each component.

This project was the cumulative final for Oregon State Unversity's Digital Forensics class.

## Building

The PDF is built from Markdown/LaTeX source files using Pandoc as the rendering engine. The `make` script graciously makes use of [Robert Detjens' Pandoc container](https://github.com/detjensrobert/arch-pandoc-container) with a full TexLive environment. Github Actions is configured to automatically build a new PDF on changes to the repository for public viewing, but the `makefile` can be run locally as well.
