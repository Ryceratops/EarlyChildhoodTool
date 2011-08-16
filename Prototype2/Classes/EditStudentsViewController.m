    //
//  EditStudentsViewController.m
//  Prototype2
//
//  Created by Ryan George on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Prototype2AppDelegate.h"
#import "EditStudentsViewController.h"
#import "AddStudentViewController.h"
#import "SettingsViewController.h"
#import "MainMenuViewController.h"


@implementation EditStudentsViewController

-(NSString *)filePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"database.sql"];
}

-(void) openDB
{
	//---create database---
	if(sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK)
	{
		sqlite3_close(db);
		NSAssert(0, @"Database failed to open");
	}
}

//---retrive rows from a specific table--
-(void)getAllRowsFromTableNamed:(NSString *) tableName
 {
 //retrieve rows
 NSString *qsql = @"SELECT * FROM STUDENTS";
 sqlite3_stmt * statement;
 
 if(sqlite3_prepare_v2( db, [qsql UTF8String], -1, &statement, nil) == SQLITE_OK)
 {
 while(sqlite3_step(statement) == SQLITE_ROW)
 {
 //---identifies and ties the first row to a string--- 
 char *firstName = (char *)sqlite3_column_text(statement, 0);
 NSString *field1Str = [[NSString alloc] initWithUTF8String:firstName];
 
 //---identifies and ties the second row to a string--- 
 char *lastName = (char *)sqlite3_column_text(statement, 1);
 NSString *field2Str = [[NSString alloc] initWithUTF8String:lastName];
 
 //preps to display all referenced row information---
 NSString *str = [[NSString alloc] initWithFormat:@"%@ %@", field1Str, field2Str];
 
	 textView.text = [[NSString alloc] initWithFormat:str];
	 NSLog(str);
	 
 [field1Str release];
 [field2Str release];
 [str release];
 }
 }
 //---deletes the compiled statement from memory---
 sqlite3_finalize(statement);
	 
 }

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

-(void)viewDidLoad
{
	[self openDB];
	[self getAllRowsFromTableNamed:@"Students"];
	sqlite3_close(db);
	[super viewDidLoad];
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
