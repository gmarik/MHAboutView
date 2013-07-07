//
//  MailComposerController.h
//  MHAboutView
//
//  Created by Maryan Hratson on 2013-07-01.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

typedef void (^MHComposeMail)(MFMailComposeViewController *email);

@interface MailComposerController : UIViewController<MFMailComposeViewControllerDelegate>

-(void)mail: (MHComposeMail) block;

@end
