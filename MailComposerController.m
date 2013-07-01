//
//  MailComposerController.m
//  MHAboutView
//
//  Created by Maryan Hratson on 2013-07-01.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import "MailComposerController.h"


@implementation MailComposerController

-(void)mail:(MHComposeMail) composeMailBlock {
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;

    composeMailBlock(picker);

    [self.parentViewController presentModalViewController:picker animated:YES];
}


// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}

@end
