    //
//  MainMenuViewController.m
//  Prototype2
//
//  Created by Ryan George on 8/1/11.
//  Copyright 2011 SOMETHING. All rights reserved.
//

#import "MainMenuViewController.h"
#import "Prototype2AppDelegate.h"
#import "CameraViewController.h"
#import "SettingsViewController.h"

@implementation MainMenuViewController

-(void)viewDidLoad
{
	//collect data button
	UIButton *collectDataButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	collectDataButton.frame = CGRectMake(348, 512, 100, 100);
	[collectDataButton setTitle:(NSString *)@"Collect Data" 
				 forState:(UIControlState)UIControlStateNormal];
	UIImage *collectDataImage = [UIImage imageNamed:@"Projects.png"];
	[collectDataButton setImage:collectDataImage forState:UIControlStateNormal];
	[collectDataButton addTarget:self action:@selector(gotoCollectData:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:collectDataButton];
	
	//settings button
	UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	settingsButton.frame = CGRectMake(348, 312, 100, 100);
	[settingsButton setTitle:@"Settings" 
			  forState:UIControlStateNormal];
	UIImage *settingsImage = [UIImage imageNamed:@"Settings.png"];
	[settingsButton setImage:settingsImage forState:UIControlStateNormal];
	[settingsButton addTarget:self action:@selector(gotoSettings:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:settingsButton];
}

-(void)gotoCollectData:(id)sender
{
	Prototype2AppDelegate *delegate = (Prototype2AppDelegate *)[[UIApplication sharedApplication]delegate];
	CameraViewController *cameraView = [[CameraViewController alloc] initWithNibName:@"CameraViewController" bundle:nil];
	[delegate switchView:self.view toView:cameraView.view];
}

-(void)gotoSettings:(id)sender
{
	Prototype2AppDelegate *delegate = (Prototype2AppDelegate *)[[UIApplication sharedApplication]delegate];
	SettingsViewController *settingsView = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
	[delegate switchView:self.view toView:settingsView.view];
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
