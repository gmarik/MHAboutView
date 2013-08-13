About MHAboutView
================

[MHAboutView] is a generic, reusable "About view" for your iOS app.

Features
------------

- app name and version info.
- email feedback with `MFMailComposeViewController`
- email body includes app and version info aswell
- links to the app's review and developer's pages
- configurable via Info.plist
- easy customization with [JMStaticContentTableViewController]
- Changelog using WebView

Screenshots
------------
- About view ![about view](/Docs/AboutView.png)
- Contact us ![contacts us](/Docs/ContactUs.png)
- Changelog  ![Changelog](/Docs/Changelog.png)

## Installation

```
git clone --recursive https://github.com/gmarik/MHAboutView.git
cd MHAboutView
open MHAboutView.xcodeproj
```

To see the demo app select and run `MHAboutView Demo` target.

## Dependencies

[MHAboutView] depends on [JMStaticContentTableViewController]

##Configuration

Once installed, configuration is pretty straightforward:

1. add `MHAboutView.xcodeproject` to your app's project or workspace
2. add `MHAboutView` project to `Target Dependencies` in `Build Phases`
3. add `libMHAboutView.a` library to `Link Binary With Libraries` in `Build Phases`
4. ensure `Other Linker Flags` includes `-ObjC` flag in `Build Settings` section
5. [MHAboutView] expects app's `Info.plist` to have `MHAboutViewInfo` entry with dictionary describing contact email, urls and changelog filename, ie:

        <key>MHAboutViewInfo</key>
        <dict>
          <key>ReviewURL</key>
          <string>https://itunes.apple.com/us/app/regularly.me/id615302436</string>
          <key>DeveloperURL</key>
          <string>https://itunes.apple.com/us/artist/maryan-hratson/id615302439</string>
          <key>ContactEmail</key>
          <string>Hi@Appna.me</string>
          <key>ChangelogFileName</key>
          <string>Changelog.html</string>
        </dict>

    see `MHAboutView Demo` target as an example.

6. Adding MHAboutView into the app is like this:

        MHAboutViewController *about = [[MHAboutViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: about];
        self.window.rootViewController = nav;

    Note that it depends on navigation controller to function properly.

    see `MHAboutView Demo/MHAppDelegate.m`  as an example.


[MHAboutView]:https://github.com/gmarik/MHAboutView
[JMStaticContentTableViewController]:https://github.com/????/JMStaticContentTableViewController
