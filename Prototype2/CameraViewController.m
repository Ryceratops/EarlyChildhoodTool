    //
//  CameraViewController.m
//  Prototype2
//
//  Created by Ryan George on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"
#import "MainMenuViewController.h"
#import "Prototype2AppDelegate.h"


@implementation CameraViewController

@synthesize mainView;

@synthesize mainImage;
@synthesize choosePhoto;
@synthesize takePhoto;
@synthesize studentView, projectView, contentView, summaryView;
@synthesize studentButton, 
			projectButton, 
			contentButton, 
			summaryButton, 
			findPhoto, 
			saveButton, 
			tagsLabel, 
			documentCollect,
			studentScroll,
			projectScroll,	
			contentScroll,
			summaryScroll,
			userSelect;

-(void)viewDidLoad
{
	[studentScroll setScrollEnabled:YES];
	[studentScroll setContentSize:CGSizeMake(1334, 149)];
	
	[projectScroll setScrollEnabled:YES];
	[projectScroll setContentSize:CGSizeMake(880, 149)];
	
	[contentScroll setScrollEnabled:YES];
	[contentScroll setContentSize:CGSizeMake(1230, 149)];
	
	[summaryScroll setScrollEnabled:YES];
	[summaryScroll setContentSize:CGSizeMake(700, 149)];
	
	spacingStudentVariable = 0;
	spacingProjectVariable = 0;
	spacingContentVariable = 0;
}

-(IBAction)addStudent:(id)sender
{
	/*CGRect frame = CGRectMake(10, 10, 100, 30);
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = frame;
	[button setTitle:(NSString *)@"newButton" forState:(UIControlState)UIControlStateNormal];
	[button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
	[summaryScroll addSubview:button];*/
	
	NSString *title = [sender titleForState:UIControlStateNormal];
	NSString *newText = [[NSString alloc] initWithFormat:@"%@", title];
	UILabel *student1 = [[UILabel alloc] initWithFrame:CGRectMake((0 + spacingStudentVariable), 50, 110, 30)];
	student1.adjustsFontSizeToFitWidth = YES;
	student1.backgroundColor = [UIColor clearColor];
	student1.numberOfLines = 1;
	student1.text = newText;
	student1.textAlignment = UITextAlignmentCenter;
	[summaryScroll addSubview:student1];
	spacingStudentVariable += 100;
	[newText release];
	[student1 release];
}

-(void)buttonEvent:(id)sender
{
	NSLog(@"new button clicked!!!");
}

-(IBAction)addProject:(id)sender
{
	NSString *title = [sender titleForState:UIControlStateNormal];
	NSString *newText = [[NSString alloc] initWithFormat:@"%@", title];
	UILabel *newProject = [[UILabel alloc] initWithFrame:CGRectMake((0 + spacingProjectVariable), 70, 110, 30)];
	newProject.adjustsFontSizeToFitWidth = YES;
	newProject.backgroundColor = [UIColor clearColor];
	newProject.numberOfLines =1;
	newProject.text = newText;
	newProject.textAlignment = UITextAlignmentCenter;
	[summaryScroll addSubview:newProject];
	spacingProjectVariable += 100;
	[newText release];
	[newProject release];
}

-(IBAction)addContent:(id)sender
{
	NSString *title = [sender titleForState:UIControlStateNormal];
	NSString *newText = [[NSString alloc] initWithFormat:@"%@", title];
	UILabel *newContent = [[UILabel alloc] initWithFrame:CGRectMake((0 + spacingContentVariable), 90, 110, 30)];
	newContent.adjustsFontSizeToFitWidth = YES;
	newContent.backgroundColor = [UIColor clearColor];
	newContent.numberOfLines =1;
	newContent.text = newText;
	newContent.textAlignment = UITextAlignmentCenter;
	[summaryScroll addSubview:newContent];
	spacingContentVariable += 100;
	[newText release];
	[newContent release];
}



-(IBAction) capturePhoto:(id) sender
{
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	
	if((UIButton *) sender == choosePhoto)
	{
		picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	}
	else
	{
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	}
	
	[self presentModalViewController:picker animated:YES];

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	[picker dismissModalViewControllerAnimated:YES];
	mainImage.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

-(IBAction)toggleUser:(id) sender
{
	if(userSelect.selectedSegmentIndex == 1)
	{
		[studentView setHidden:YES];
		[projectView setHidden:YES];
		[contentView setHidden:YES];
		[summaryView setHidden:YES];
		
		[studentButton setHidden:YES];
		[projectButton setHidden:YES];
		[contentButton setHidden:YES];
		[summaryButton setHidden:YES];
		
		[tagsLabel setHidden:YES];
		[findPhoto setHidden:YES];
		[saveButton setHidden:YES];
		[documentCollect setHidden:YES];
	}
	else
	{
		[tagsLabel setHidden:NO];
		[studentButton setHidden:NO];
		[projectButton setHidden:NO];
		[contentButton setHidden:NO];
		[summaryButton setHidden:NO];
		[saveButton setHidden:NO];
		[findPhoto setHidden:NO];
		[documentCollect setHidden:NO];
	}

}

-(IBAction) showStudents:(id) sender
{	
	[studentView setHidden:NO];
	[projectView setHidden:YES];
	[contentView setHidden:YES];
	[summaryView setHidden:YES];
}
-(IBAction) showProjects:(id) sender
{
	[studentView setHidden:YES];
	[projectView setHidden:NO];
	[contentView setHidden:YES];
	[summaryView setHidden:YES];
}
-(IBAction) showContent:(id) sender
{
	[studentView setHidden:YES];
	[projectView setHidden:YES];
	[contentView setHidden:NO];
	[summaryView setHidden:YES];
}
-(IBAction) showSummary:(id) sender
{
	[studentView setHidden:YES];
	[projectView setHidden:YES];
	[contentView setHidden:YES];
	[summaryView setHidden:NO];
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
