//
//  Prototype2AppDelegate.h
//  Prototype2
//
//  Created by Ryan George on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraViewController;

@interface Prototype2AppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
	CameraViewController *firstView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (retain, nonatomic) CameraViewController *firstView;

@end

