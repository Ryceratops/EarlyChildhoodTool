//
//  Prototype2AppDelegate.h
//  Prototype2
//
//  Created by Ryan George on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface Prototype2AppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
	MainMenuViewController *firstView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (retain, nonatomic) MainMenuViewController *firstView;

-(void)switchView:(UIView *)view1 toView:(UIView *)view2;

@end

