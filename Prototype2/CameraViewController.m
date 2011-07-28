    //
//  CameraViewController.m
//  Prototype2
//
//  Created by Ryan George on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"


@implementation CameraViewController

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
			summaryScroll;

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
