//
//  Prototype2AppDelegate.m
//  Prototype2
//
//  Created by Ryan George on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Prototype2AppDelegate.h"
#import "MainMenuViewController.h"

@implementation Prototype2AppDelegate

@synthesize window, firstView;


#pragma mark -
#pragma mark Application lifecycle

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
	[window makeKeyAndVisible];
	MainMenuViewController *mainView = [[MainMenuViewController alloc] initWithNibName:@"MainMenuViewController" bundle:nil];
	self.firstView = mainView;
	[window addSubview:firstView.view];
	
	[mainView release];
}

-(void)switchView:(UIView *)view1 toView:(UIView *)view2
{
	[view1 removeFromSuperview];
	[window addSubview:view2];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
	[firstView release];
    [super dealloc];
}


@end
