//
//  MHAboutViewController.m
//  MHAboutView
//
//  Created by Maryan Hratson on 2013-06-29.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import "MHAboutViewController.h"
#import "UIApplication+VersionInfo.h"
#import "MailComposerController.h"


@implementation MHAboutViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    __weak typeof(self) __self = self;

    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {

//        section.headerTitle = @"Version Information";

        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {

            staticContentCell.cellStyle = UITableViewCellStyleValue1;

            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.text = UIApplication.bundleName;
            cell.detailTextLabel.text = UIApplication.versionBuild;
        }];

        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {

            staticContentCell.cellStyle = UITableViewCellStyleDefault;

            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"What's New";
        }];
    }];

    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
//        section.headerTitle = @"Feedback";

        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {

            staticContentCell.cellStyle = UITableViewCellStyleSubtitle;

            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.text = @"Contact Us";
            cell.detailTextLabel.text = __self.contactEmail;
            
        } whenSelected:^(NSIndexPath *indexPath) {
            [__self composeMailTo:__self.mailToRecipients withBody: __self.mailBody  andSubject: __self.mailSubject];
        }];

        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {

            staticContentCell.cellStyle = UITableViewCellStyleDefault;

            //            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.text = @"Review In The App Store";
        } whenSelected:^(NSIndexPath *indexPath) {
            // TODO: open appstore inline
            [UIApplication.sharedApplication openURL:__self.reviewURI];
        }];

    }];

    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {

//        section.headerTitle = @"App Store";

        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {

            staticContentCell.cellStyle = UITableViewCellStyleDefault;

            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"More Apps From The Developer";
        } whenSelected:^(NSIndexPath *indexPath) {
            [UIApplication.sharedApplication openURL:__self.reviewURI];
        }];
    }];
}

-(void)composeMailTo:(NSArray*)recipients withBody: (NSString *)body andSubject: subject {

    MFMailComposeViewController *email = [[MFMailComposeViewController alloc] init];
    email.mailComposeDelegate = self;

    [email setToRecipients:recipients];
    [email setMessageBody: body isHTML:false];
    [email setSubject:subject];

    [self presentModalViewController:email animated:YES];
}

-(NSArray *)mailToRecipients {
    return @[@"App@Contact.me"];
}

-(NSString*)mailBody {
    return [NSString stringWithFormat:@"Hi %@ App, \n\n\n\n My device info:\n %@", UIApplication.bundleName, self.deviceInfo];
}
-(NSString*)mailSubject {
    return [NSString stringWithFormat:@"%@ feedback", UIApplication.versionBuild];
}

// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self dismissModalViewControllerAnimated: YES];
}

-(NSString*)deviceInfo
{
    UIDevice *d = [UIDevice currentDevice];
    return [NSString stringWithFormat:@"- %@\n- %@ %@\n- %@", UIApplication.machineName, d.systemName, d.systemVersion, UIApplication.versionFull];
}

-(NSDictionary *)aboutViewInfo {
 return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"MHAboutViewInfo"];
}

#pragma mark info
-(NSURL *)developerURI {
    return [NSURL URLWithString: self.aboutViewInfo[@"DeveloperURI"]];
}
-(NSURL *)reviewURI {
    return [NSURL URLWithString: self.aboutViewInfo[@"ReviewURI"]];
}

-(NSString *)contactEmail {
    return self.aboutViewInfo[@"ContactEmail"];
}

-(NSString *)changelogFileName {
    return self.aboutViewInfo[@"ChangelogFileName"];
}

@end
