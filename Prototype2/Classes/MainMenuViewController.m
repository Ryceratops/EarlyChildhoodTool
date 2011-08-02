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
	//collect data button, defining the button
	UIButton *collectDataButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	//designate where the button is (first x, y) and how large the button will be (second x, y)
	collectDataButton.frame = CGRectMake(348, 512, 100, 100);
	//set the button's title
	[collectDataButton setTitle:(NSString *)@"Collect Data" 
					   forState:(UIControlState)UIControlStateNormal];
	//define an image for the button
	UIImage *collectDataImage = [UIImage imageNamed:@"Projects.png"];
	//set a image for the button
	[collectDataButton setImage:collectDataImage forState:UIControlStateNormal];
	//set how the button can be interacted with (touch up inside) and 
	//what function/action hapens when the button is pressed
	[collectDataButton addTarget:self action:@selector(gotoCollectData:) forControlEvents:UIControlEventTouchUpInside];
	//add the button to the view
	[self.view addSubview:collectDataButton];
	
	//settings button, defining the button
	UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	//designate where the button is (first x, y) and how large the button will be (second x, y)
	settingsButton.frame = CGRectMake(348, 312, 100, 100);
	//set the button's title
	[settingsButton setTitle:(NSString *)@"Settings" 
					forState:UIControlStateNormal];
	//define an image for the button
	UIImage *settingsImage = [UIImage imageNamed:@"Settings.png"];
	//set the image for the button
	[settingsButton setImage:settingsImage forState:UIControlStateNormal];
	//set how the button can be interacted with (touch up inside) and 
	//what function/action hapens when the button is pressed
	[settingsButton addTarget:self action:@selector(gotoSettings:) forControlEvents:UIControlEventTouchUpInside];
	//add the button to the view
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
    return YES;
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
