# parametrix-segmentation-labelling
Necessary assets to install, set up and run the segmentation editor

## Installation

### Docker Desktop

First, you need to install Docker and Docker Compose on your computer. This is a one-time thing that will likely serve you well in the future, as a lot of free software is distributed as docker images. The easiest way to do this is to [install Docker Desktop](https://docs.docker.com/desktop/) (~650MB). **If you are on Windows, please note the `System Requirements > WSL v2 Backend` instructions. You may need to follow these first.** 

Open the installer, check both boxes during configuration, close and log out, log back in, then accept the license agreement. The docker desktop engine should (hopefully) launch without issue.

### Git Bash (Optional, but recommended)

This is also a one-time installation that will give a Unix terminal to your windows computer. This is good, because you can run the same commands that a software engineer or data person would run on Linux, which takes most of the pain out of dealing with Windows specific quirks (mostly avoid PowerShell / CMD, batch scripts).

https://git-scm.com/downloads

### Verify Docker

You can verify the installation by opening Git Bash (or PowerShell if you didn't bother with it) and running `docker run hello-world`. It should download an image, and print a "Hello from Docker" message.
