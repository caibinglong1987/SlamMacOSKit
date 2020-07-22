# SlamMacOSKit - Fast Closure based Swift Package for MacOS Development.

## Description

Like many things in life, ***Slam*** started out as one thing and morphed into another.

At first, Slam was a demonstration of what I like to call "Closure Programming".  I believe that Closures are the next step in Object-Oriented Programming. While they will not replace subclassing, they can be used much more efficiently to connect standard functionality (especially user interface) with custom code.  Rather than constantly overriding functions, closures can be defined for the function to invoke.  All with little Interface Builder use.  This makes Closures are a better tool for wiring an interface than the target-action pattern used by Cocoa & Cocoa Light.  Also the Delegate & Data Source design patterns can be done easier with Closures. 

So Slam became a Lab for developing Closure based user interface Elements.  Elements that soon became useful to me in creating real-world apps for the Mac, iPhone, iPad and Apple TV.

Slam name and first motto reflect this origin: ___"Slam for Fast Closure app development."___

Once enough elements were created, Slam started needing other functionality to implement real MacOS & iOS apps.  Channeling the spirit of the original MacApp framework, Slam became a collection of advanced Mac & iOS object classes.  The concept of a Task was implemented, and patterns were written to connect elements that launch tasks (Menu items, Toolbar items, Buttons) with the controller code that defined these tasks (App controllers, View controllers, Document controllers).  Soon we had classes that implement cut/copy functionality,  menu/toolbar task handling, scripting & bookmarking, and even undoable tasks.  The more that Slam was used, the more abilities the Framework developed, the more features the apps had, all while shrinking the actual new code for an app.

At that point, it became apparent many of the elements and tasks were no longer OS specific.  While the implementation of a button, menu item, table list or view controller is different on a Mac vs. an iPhone, interaction with these elements was being done in a general manner using non-OS specific protocols and closures.  The app-specific functionality of controllers could be taken out of the NSViewControllers & UIViewControllers and put into abstract Protocols.  Thus the division between SlamKit (abstract protools & data structures) and SlamMacOSKit (Mac based User Interfaces that use the protocols).  The concept of Tasks, user interface independent operations, developed.  SlamMacOSKit had reached its latest morph, into a Swift Package.

I do not know what the next morph for Slam will be, but I am sure there will be one. And it will be interesting.

## Installation

Since SlamMacOSKit is a Swift Package, the IDE or Make file of a project must reference SlamMacOSKit's repository:

https://github.com/magesteve/SlamMacOSKit

To clone SlamMacOSKit, the following Terminal command should be used:

% git clone https://github.com/magesteve/SlamMacOSKit

## Documentation

All public classes, protocols, properties & functions have inline documentation (DOxygen style).  Further explanation of the Framework, refer to the SlamMacOSKit repository and/or any example projects.  

## Requirements

SlamMacOSKit provides the user interface support for SlamKit on the Mac. is targeted for the last versions of the Swift programming languages, Swift 5.2. 

The Mac OS Target is MacOS 10.13.

SlamMacOSKit is dependent on the SlamKit Swift Package. Normal installation of SlamMacOSKit should automatically also install SlamKit, but in case it does not, the following is the SlamKit Repository:

https://github.com/magesteve/SlamKit

### Steve Sheets, magesteve@mac.com

Originally from Silicon Valley, Steve has been embedded in the software industry for over 35 years. As an expert in user interface and design, he started developer desktop applications for companies like Apple and AOL, moved into mobile development, and is now working in the virtual reality and Augment Reality space.  He has taught Objective-C & Swift development classes (MoDev, Learning Tree), as well as given talk on variety of developer topics (DC Mac Dev group, Capital One Swift Conference).  He is an avid game player, swordsman and an occasional game designer

## License

SlamMacOSKit provides the user interface support for SlamKit on the Mac. is available under the MIT license. The intent of the project is to be always Open Source, and freely available. Please keep me informed of any uses!
