    //
//  FourLines.m
//  Prototype2
//
//  Created by Ryan George on 8/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FourLines.h"


@implementation FourLines
@synthesize field1;
@synthesize field2;
@synthesize field3;

#pragma mark NSCoding

-(void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:field1 forKey:kField1Key];
	[encoder encodeObject:field2 forKey:kField2Key];
	[encoder encodeObject:field3 forKey:kField3Key];
}

-(id)initWithCoder:(NSCoder *)decoder
{
	if(self = [super init])
	{
		self.field1 = [decoder decodeObjectForKey:kField1Key];
		self.field2 = [decoder decodeObjectForKey:kField2Key];
		self.field3 = [decoder decodeObjectForKey:kField3Key];
	}
	return self;
}

#pragma mark -
#pragma mark NSCopying
-(id)copyWithZone:(NSZone *)zone
{
	FourLines *copy = [[[self class] allocWithZone:zone] init];
	copy.field1 = [[self.field1 copy] autorelease];
	copy.field2 = [[self.field2 copy] autorelease];
	copy.field3 = [[self.field3 copy] autorelease];
	
	return copy;
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
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
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
