# segmentation-labelling
Self-contained instructions and assets to install, set up and run the [Hitatchi semantic segmentation editor](https://github.com/Hitachi-Automotive-And-Industry-Lab/semantic-segmentation-editor) from scratch.

## Installation

### Docker Desktop

First, you need to install Docker and Docker Compose on your computer. This is a one-time thing that will likely serve you well in the future, as a lot of free software is distributed as docker images. The easiest way to do this is to [install Docker Desktop](https://docs.docker.com/desktop/) (~650MB). **If you are on Windows, please note the `System Requirements > WSL v2 Backend` instructions. You may need to follow these first.** 

Open the installer, check both boxes during configuration, close and log out, log back in, then accept the license agreement. The docker desktop engine should (hopefully) launch without issue.

![Install Docker Desktop](./static/1-install-docker-desktop.PNG)
![Configure Docker Desktop](./static/2-configure-docker-desktop.PNG)
![Close and Log Out](./static/3-close-and-log-out.PNG)
![Accept License Agreement](./static/4-accept-license-agreement.PNG)
![Start Engine](./static/5-start-engine.PNG)
![Docker Desktop Running](./static/6-docker-desktop-running.PNG)

### Git Bash (Optional, but recommended)

[Install Git Bash](https://git-scm.com/downloads). This is also a one-time installation that will give a Unix terminal to your Windows computer. This is good, because you can run the same commands that a software engineer or data person would run on Linux, which takes most of the pain out of dealing with Windows specific quirks (mostly avoid PowerShell / CMD, batch scripts).

Here's what I picked during the installation:

![Git Bash](./static/8-git-bash.PNG)
![Git Bash 3](./static/10-git-bash-3.PNG)
![Git Bash 4](./static/11-git-bash-4.PNG)
![Git Bash 5](./static/12-git-bash-5.PNG)
![Git Bash 6](./static/13-git-bash-6.PNG)
![Git Bash 7](./static/14-git-bash-7.PNG)
![Git Bash 8](./static/15-git-bash-8.PNG)
![Git Bash 9](./static/16-git-bash-9.PNG)
![Git Bash 10](./static/17-git-bash-10.PNG)
![Git Bash 11](./static/18-git-bash-11.PNG)
![Git Bash 12](./static/19-git-bash-12.PNG)
![Git Bash 13](./static/20-git-bash-13.PNG)

### Verify Docker

You can verify the installation by opening Git Bash (or PowerShell if you didn't bother with it) and running `docker run hello-world`. It should download an image, and print a "Hello from Docker" message.

![Docker Hello World (Git Bash)](./static/7b-docker-hello-world-git-bash.png)
![Docker Hello World (PowerShell)](./static/7-docker-hello-world.PNG)


### Download this repository

Now you need the application code (a "recipe" for docker). Everything that is necessary is in this repository, copied over from the original. So you want to "clone" (download) it to a folder on your computer. Then you're almost done.



#### Option 1 - If you downloaded Git Bash and want to do this with a GUI
- Open your "Git GUI" app 
- Select "Clone an existing repository"
- Fill in the fields in the image below (the repository will be downloaded to the target folder). *see image below*.
    - The source location should be `https://github.com/SlapDrone/segmentation-labelling.git`
    - The target directory is wherever you want to save it locally

![Clone Repo](./static/21-clone-repo.PNG)
![Clone Repo 2](./static/22-clone-repo-2.PNG)

#### Option 2 - If you want to do this on the command line (Git Bash or PowerShell)
- Navigate to where you want to save it (You'll be at `C:\Users\YourName` when you open your shell. You can just put it here, or elsewhere by `cd`-ing to another directory, and/or creating a new one with `mkdir`).
- Run `git clone https://github.com/SlapDrone/segmentation-labelling.git`. This will download the repository to a folder `segmentation-labelling`.

## Install and run the app

Once you have this repository on your computer, it's dead simple. In a Git Bash terminal, go to wherever you cloned this repository (I put mine in `~/projects/segmentation-labelling`, so can go there with `cd ~/projects/segmentation-labelling`).

 Just run the `app` script (in Git Bash) with a single argument: a directory containing `.pcd` files that you want to annotate. For example, this should work out of the box:

```bash
./app ./samples
```

![Run App 1](./static/23-run-app-1.PNG)



This will run the app in your browser on the [samples](./samples) directory, which contains [a sample pointcloud](./samples/sample.pcd).

You should see a bunch of output, Docker will download the app if it's the first time you've run it. Then it will launch it and generate a bunch of nice colourful output saying that things have been started.

![Run App 2](./static/24-run-app-2.PNG)

Open your browser and type in to `localhost:81`. After a few seconds of loading you should see the app.

![Seg Editor Homepage](./static/25-seg-editor-homepage.PNG)
![Seg Editor Example](./static/26-seg-editor-example.PNG)

If you want to close the app again, just open the Git Bash terminal that you are running it from and hit `Ctrl+C`.

## Notes

The annotations available, and the associated icons, are set in the [settings.json](./settings.json) file in this repository. You can add your own annotations and icons there and select them in the app (see screenshow below). You can edit the json in any (decent) text editor. I use [VSCode](https://code.visualstudio.com/). The available icons can be viewed and searched [here](https://pictogrammers.com/library/mdi/). 

![Classes Sets](./static/27-classes-sets.PNG)
![Icons](./static/28-icons.PNG)
