//
//  MHAboutViewController.m
//  MHAboutView
//
//  Created by Maryan Hratson on 2013-06-29.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import "MHAboutViewController.h"
#import "UIApplication+VersionInfo.h"


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

    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {

//        section.headerTitle = @"Version Information";

        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {

            staticContentCell.cellStyle = UITableViewCellStyleValue1;

            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.text = @"Regularly.me";
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

            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Contact Us";
            cell.detailTextLabel.text = @"App@Contact.me";
            
        }];

        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {

            staticContentCell.cellStyle = UITableViewCellStyleDefault;

            //            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.text = @"Review In The App Store";
        }];

    }];

    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {

//        section.headerTitle = @"App Store";

        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {

            staticContentCell.cellStyle = UITableViewCellStyleDefault;

            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"More Apps From The Developer";
        }];
    }];
}

@end
