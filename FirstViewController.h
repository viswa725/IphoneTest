//
//  FirstViewController.h
//  testing
//
//  Created by Viswa Gopisetty on 03/08/14.
//  Copyright (c) 2014 Viswa Gopisetty. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

#import <QuartzCore/QuartzCore.h>

@interface FirstViewController : UIViewController
{
    AVCaptureSession *session;
    NSTimer *timerAppBG;
}
-(void)applicationWillResign;

@end
