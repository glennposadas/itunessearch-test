# iSearch.

This document contains instructions on how to build and run the project **iSearch**

---

## Getting Started

You'll need the following software installed on your mac machine.

1. Xcode - You can download it from the App Store on your mac.
2. Sourcetree - [Download link](https://www.sourcetreeapp.com/)
3. Cocoapods - [Guide](https://guides.cocoapods.org/using/getting-started.html)

---

## Clone the project / repository

Use these steps to clone from SourceTree, our client for using the repository command-line free. Cloning allows you to work on your files locally.
Cloning the project on to your local machine is simple. If you don't yet have SourceTree, [download and install first](https://www.sourcetreeapp.com/). If you prefer to clone from the command line, see [Clone a repository](https://confluence.atlassian.com/x/4whODQ). 

1. You’ll see the clone button under the **Source** heading. Click that button.
2. Now click **Check out in SourceTree**. You may need to create a SourceTree account or log in.
3. When you see the **Clone New** dialog in SourceTree, update the destination path and name if you’d like to and then click **Clone**.
4. Open the directory you just created to see your repository’s files.

Now that you're more familiar with your Bitbucket repository, go ahead and add a new file locally. You can [push your change back to Bitbucket with SourceTree](https://confluence.atlassian.com/x/iqyBMg), or you can [add, commit,](https://confluence.atlassian.com/x/8QhODQ) and [push from the command line](https://confluence.atlassian.com/x/NQ0zDQ).

---

## Installing Cocoapods

CocoaPods manages library dependencies for your Xcode projects.

The dependencies for your projects are specified in a single text file called a Podfile. CocoaPods will resolve dependencies between libraries, fetch the resulting source code, then link it together in an Xcode workspace to build your project.

Ultimately the goal is to improve discoverability of, and engagement in, third party open-source libraries by creating a more centralised ecosystem.

For more thorough guide, see [Cocoapods website](https://guides.cocoapods.org/using/getting-started.html).

1. Open up your **Terminal**
2. Type in `sudo gem install cocoapods` and press enter.
3. After installing the Cocoapods, navigate to your project folder where you can see the file named **Podfile**.
4. When you are in the same folder of **Podfile**, type in `pod install`.

---

## Building the project

Build and running the project on to your simulator is easy. Make sure you are using `.xcworkspace` (white icon) and NOT `.xcodeproject` (blue icon). 
There's a difference between these two project files.

Now click on the **PLAY** button in your Xcode. Or simple press `CMD` + `R` to run the project on to your selected simulator or device. When running the project on to your real device, you will need to setup some certificates on your local machine.

---

## TestFlight

Inviting an internal user (a user under your Apple Developer Account) is quite not simple. I've written a wiki for this:
[A Thorough Guide In Testing Apps Via TestFlight For Clients, Bosses, and Testers](https://github.com/glennposadas/TestFlight-Guide/wiki/A-Thorough-Guide-In-Testing-Apps-Via-TestFlight---For-Clients,-Bosses,-and-Testers).

--

## Support

Should there be questions or tech support, contact me: hello@glennvon.com
