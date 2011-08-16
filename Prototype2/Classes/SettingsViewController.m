    //
//  SettingsViewController.m
//  Prototype2
//
//  Created by Ryan George on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "FourLines.h"
#import "MainMenuViewController.h"
#import "AddStudentViewController.h"
#import "AddProjectViewController.h"
#import "EditStudentsViewController.h"
#import "Prototype2AppDelegate.h"


@implementation SettingsViewController
@synthesize field1;
@synthesize field2;
@synthesize field3;

-(NSString *)dataFilePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains
	(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return[documentsDirectory stringByAppendingPathComponent:kFileName];
}

-(void)applicationWillTerminate:(NSNotification *)notification
{
	FourLines *fourLines = [[FourLines alloc] init];
	fourLines.field1 = field1.text;
	fourLines.field2 = field2.text;
	fourLines.field3 = field3.text;
	
	NSMutableData *data = [[NSMutableData alloc] init];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[archiver encodeObject:fourLines forKey:kDataKey];
	[archiver finishEncoding];
	[data writeToFile:[self dataFilePath] automatically:YES];
	[fourLines release];
	[archiver release];
	[data release];
}

#pragma mark -
-(void)viewDidLoad
{
	NSString *filePath = [self dataFilePath];
	
	if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
	{
		NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
		NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
		FourLines *fourLines = [unarchiver decodeObjectForKey:kDataKey];
		[unarchiver finishedDecoding];
		
		field1.text = fourLines.field1;
		field2.text = fourLines.field2;
		field3.text = fourLines.field3;
		
		[unarchiver release];
		[data release];
	}
	
	UIApplication *app = [UIApplication sharedApplication];
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(applicationWillTerminate:) 
												 name:UIApplicationWillTerminateNotification 
											   object:app];
	[super viewDidLoad];
}

-(IBAction)gotoAddStudent:(id)sender
{
	Prototype2AppDelegate *delegate = (Prototype2AppDelegate *)[[UIApplication sharedApplication]delegate];
	AddStudentViewController *mainView = [[AddStudentViewController alloc] initWithNibName:@"AddStudentViewController" bundle:nil];
	[delegate switchView:self.view toView:mainView.view];
}

-(IBAction)gotoMainMenu:(id)sender
{
	Prototype2AppDelegate *delegate = (Prototype2AppDelegate *)[[UIApplication sharedApplication]delegate];
	MainMenuViewController *mainView = [[MainMenuViewController alloc] initWithNibName:@"MainMenuViewController" bundle:nil];
	[delegate switchView:self.view toView:mainView.view];
}

-(IBAction)gotoAddProject:(id)sender
{
	Prototype2AppDelegate *delegate = (Prototype2AppDelegate *)[[UIApplication sharedApplication] delegate];
	AddProjectViewController *mainView = [[AddProjectViewController alloc] initWithNibName:@"AddProjectViewController" bundle:nil];
	[delegate switchView:self.view toView:mainView.view];
}

-(IBAction)gotoEditStudents:(id)sender
{
	Prototype2AppDelegate *delegate = (Prototype2AppDelegate *)[[UIApplication sharedApplication] delegate];
	EditStudentsViewController *mainView = [[EditStudentsViewController alloc] initWithNibName:@"EditStudentsViewController" bundle:nil];
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


- (void)dealloc 
{
	[field1 release];
	[field2 release];
	[field3 release];
    [super dealloc];
}


@end
