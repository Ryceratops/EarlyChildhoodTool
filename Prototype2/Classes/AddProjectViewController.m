    //
//  AddProjectViewController.m
//  Prototype2
//
//  Created by Ryan George on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddProjectViewController.h"
#import "Prototype2AppDelegate.h"
#import "MainMenuViewController.h"
#import "SettingsViewController.h"


@implementation AddProjectViewController

-(IBAction)gotoSettings:(id)sender
{
	Prototype2AppDelegate *delegate = (Prototype2AppDelegate *)[[UIApplication sharedApplication]delegate];
	SettingsViewController *mainView = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
	[delegate switchView:self.view toView:mainView.view];
}

-(IBAction)gotoMainMenu:(id)sender
{
	Prototype2AppDelegate *delegate = (Prototype2AppDelegate *)[[UIApplication sharedApplication]delegate];
	MainMenuViewController *mainView = [[MainMenuViewController alloc] initWithNibName:@"MainMenuViewController" bundle:nil];
	[delegate switchView:self.view toView:mainView.view];
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
