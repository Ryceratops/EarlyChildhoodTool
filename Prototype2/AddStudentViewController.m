    //
//  AddStudentViewController.m
//  Prototype2
//
//  Created by Ryan George on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddStudentViewController.h"
#import "Prototype2AppDelegate.h"
#import "SettingsViewController.h"
#import "MainMenuViewController.h"


@implementation AddStudentViewController

@synthesize studentFirstName,studentLastName, studentPicture;
@synthesize firstNameField, lastNameField, pictureField, choosePhoto, takePhoto, pictureView;
@synthesize datePicker, currentDate;

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

//---create a table with fields---
-(void)createTableNamed:(NSString *)tableName
			 withField1:(NSString *)firstName
			 withField2:(NSString *)lastName
			 withField3:(NSString *)birthdate
			 withField4:(NSString *)image
{
	char* err;
	NSString *sql = [NSString stringWithFormat:
					 @"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT PRIMARY KEY, '%@' TEXT, '%@' TEXT, '%@' TEXT);",
					 tableName, firstName, lastName, birthdate, image];
	
	//--if statement when the table cannot be created---
	if(sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK)
	{
		sqlite3_close(db);
		NSAssert(0, @"table failed");
	}
}

//---inserts a record into a specified table---
-(void)insertRecordIntoTableName:(NSString *)tableName
					  withField1:(NSString *)field1
					 field1Value:(NSString *)field1Value
					  withField2:(NSString *)field2
					 field2Value:(NSString *)field2Value
					  withField3:(NSString *)field3
					 field3Value:(NSString *)field3Value
					  withField4:(NSString *)field4
					 field4Value:(NSString *)field4Value
{
	//---cmd line instructing sql what to do with the variables---
	NSString *sql = [NSString stringWithFormat:@"INSERT OR REPLACE INTO '%@' ('%@','%@','%@','%@') VALUES ('%@','%@','%@','%@')", tableName, field1, field2, field3, field4, field1Value, field2Value, field3Value, field4Value];
	
	//---if statement if error occurs upon updating table---
	char *err;
	if(sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err))
	{
		sqlite3_close(db);
		NSAssert(0, @"Error updating table.");
	}
	
}

//---retrive rows from a specific table--
/*-(void)getAllRowsFromTableNamed:(NSString *) tableName
 {
 //retrieve rows
 NSString *qsql = @"SELECT * FROM STUDENTS";
 sqlite3_stmt * statement;
 
 if(sqlite3_prepare_v2( db, [qsql UTF8String], -1, &statement, nil) == SQLITE_OK)
 {
 while(sqlite3_step(statement) == SQLITE_ROW)
 {
 //---identifies and ties the first row to a string--- 
 char *name = (char *)sqlite3_column_text(statement, 0);
 NSString *field1Str = [[NSString alloc] initWithUTF8String:name];
 
 //---identifies and ties the second row to a string--- 
 char *birthdate = (char *)sqlite3_column_text(statement, 1);
 NSString *field2Str = [[NSString alloc] initWithUTF8String:birthdate];
 
 //---identifies and ties the third row to a string--- 
 char *image = (char *)sqlite3_column_text(statement, 2);
 NSString *field3Str = [[NSString alloc] initWithUTF8String:image];
 
 //preps to display all referenced row information---
 NSString *str = [[NSString alloc] initWithFormat:@"%@ - %@ - %@", field1Str, field2Str, field3Str];
 
 //NSLog(str);
 
 [field1Str release];
 [field2Str release];
 [field3Str release];
 [str release];
 }
 //---deletes the compiled statement from memory---
 sqlite3_finalize(statement);
 }
 }*/

-(IBAction)addStudent
{	
	studentFirstName = self.firstNameField.text;
	studentLastName = self.lastNameField.text;
	currentDate = self.datePicker.date;
	
	[self saveImage:pictureField.image :[NSString stringWithFormat:@"%@_%@_profile_picture", studentFirstName, studentLastName]];
	
	[self openDB];
	
	NSString *firstName = [[NSString alloc] initWithFormat:@"%@", studentFirstName];
	
	NSString *lastName = [[NSString alloc] initWithFormat:@"%@", studentLastName];
	
	NSString *birthdate = [[NSString alloc] initWithFormat:@"%@", currentDate];
	
	NSString *image = [[NSString alloc] initWithFormat:@"%@_%@_profile_picture", studentFirstName, studentLastName];
	
	[self insertRecordIntoTableName:@"Students" 
						 withField1:@"firstName" field1Value:firstName
						 withField2:@"lastName" field2Value:lastName
						 withField3:@"birthdate" field3Value:birthdate
						 withField4:@"image" field4Value:image];
	
	[firstName release];
	[lastName release];
	[birthdate release];
	[image release];
	
	sqlite3_close(db);
	
	UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Student Registered" 
													  message:[NSString stringWithFormat:@"%@ %@ has been entered into the database", studentFirstName, studentLastName] 
													 delegate:nil 
											cancelButtonTitle:@"Continue" 
											otherButtonTitles:nil];
	[message show];
	[message release];
	[self clearFields];
	
}

-(IBAction)getPhoto:(id)sender
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
	pictureField.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

-(void)saveImage:(UIImage *)image :(NSString *)imageName
{
	NSData *imageData = UIImagePNGRepresentation(image);
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	NSString *fullPath = [documentsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", imageName]];
	[fileManager createFileAtPath:fullPath contents:imageData attributes:nil];
	NSLog(@"ITS WORKING");
}

-(void)clearFields
{
	firstNameField.text = @"";
	lastNameField.text = @"";
	pictureField.image = nil;
}

-(IBAction)backgroundClick:(id)sender
{
	[firstNameField resignFirstResponder];
	[lastNameField resignFirstResponder];
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
	//opens the database upon loading
	[self openDB];
	
	//creates a table titled students upon loading
	[self createTableNamed:@"Students" withField1:@"firstName" withField2:@"lastName" withField3:@"birthdate" withField4:@"image"];
	
	//[self getAllRowsFromTableNamed:@"Students"];
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
