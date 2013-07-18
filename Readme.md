About MHAboutView
================

[MHAboutView] is a generic, reusable about view for your iOS app.

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
- About view [!](/Docs/AboutView.png)
- Contact us [!](/Docs/ContactUs.png)
- Changelog  [!](/Docs/Changelog.png)

## Installation

```
git clone --recursive https://github.com/gmarik/MHAboutView.git
cd MHAboutView
open MHAboutView.xcodeproj
```

To see the demo app select and run `MHAboutView Demo` scheme.

##Configuration

[MHAboutView] expects app's `Info.plist` to have `MHAboutViewInfo` entry with dictionary describing contact email, urls and changelog filename, ie:


    <key>MHAboutViewInfo</key>
    <dict>
      <key>ReviewURI</key>
      <string>https://itunes.apple.com/us/app/regularly.me/id615302436</string>
      <key>DeveloperURI</key>
      <string>https://itunes.apple.com/us/artist/maryan-hratson/id615302439</string>
      <key>ContactEmail</key>
      <string>Hi@Appna.me</string>
      <key>ChangelogFileName</key>
      <string>Changelog.html</string>
    </dict>


## Dependencies

[MHAboutView] depends on [JMStaticContentTableViewController]


- [MHAboutView]:https://github.com/gmarik/MHAboutView
- [JMStaticContentTableViewController]:https://github.com/????/JMStaticContentTableViewController
