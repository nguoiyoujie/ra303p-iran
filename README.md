# Red Alert 3.03 "s" series

-------

 - [About the Project](#about-the-project)
 - [Building the Project](#building-the-project)
 - [Features Documentation](#features-documentation) 
 - [Credits](#credits) 

-------

### About the Project

This is an extension of the "p"/"r" series by Iran, whose project this is forked
from. This extension contains several features made to extend the functions 
available to a modder or mission writer.

Of note, addition of new technotypes are possible with decent functionality, as 
well as customization of properties in rules.ini normally locked behind code.

[Link](./README_p.md) is the original Readme from the "p" series, for historicity.

-------

### Building the Project

Windows binaries of the tools to modify `ra95.dat` are in `tools/`. Users of
other OSes can find the tools' source at in the
[`nasm-patcher`](https://github.com/cnc-patch/nasm-patcher) repo.  RA-specific
patches are in `src/`. Just run `build.cmd` from the root directory with
`ra95.dat` present to compile the tools and apply the patches.

**Instructions**

1. Clone or pull this repository
2. Ensure `ra95.dat` exists on the local repository space
3. Run `build.cmd` or `build_pause.cmd`
4. Copy the generated `ra95.exe` file to a RA game directory of your choice.

-------

### Features Documentation

You may find the features documentation [here](./docs/features.md).

-------

### Credits

** Authors of the original patch **

*In alphabetical order*

 - hifi
 - iran
 - sonarpulse

** Helpers of the original patch **

 - *CCHyper*: Sharing his vast analysed Red Alert engine database with me and
   code contributions.  Also extended the excutable with a game icon.
 - *FunkyFr3sh*: Lots of testing, suggestions, game knowledge, language packs,
   expansion maps converted to .MPR and much more. You're awesome, dude!
 - *Nyerguds*: Contributions to the patch and sharing C&C95 engine knowledge.
 - *AlexB*: Various ideas and addresses used for Arda's fixes taken from his
   Arda project. In Additional lots of information taken from the Arda manual.
 - *Allen262*: C&C95 desert and winter theater conversions, testing, map fixes,
   DOS graphics conversions, beta unit recreations, generic cameos for units
   which don't have cameos.
 - *Merri*: Started work on the desert theater conversion which Allen262
   based his finished conversion on, also made the game strings editor used
   by Iran and FunkyFr3sh for language packs and strings fixes
 - *ehy*: Suggestions and bug reporting.
 - *Lovehandles*: Testing high resolution patches for in-game LAN dialogs.
   Which took about 4 hours or so. ;-) And more helpful testing.
 - *r34ch*: Reporting map bugs and game bugs.
 - *Plotkite_Wolf*: RedAlertLauncher background image.
 - *djohe*: Making useful test maps and reporting game bugs, testing too.

