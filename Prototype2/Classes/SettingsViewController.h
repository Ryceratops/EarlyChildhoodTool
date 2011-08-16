//
//  SettingsViewController.h
//  Prototype2
//
//  Created by Ryan George on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;
@class AddStudentViewController;
@class AddProjectViewController;
@class EditStudentsViewController;

#define kFileName @"archive"
#define kDataKey @"Data"

@interface SettingsViewController : UIViewController 
{
	IBOutlet UITextField *field1;
	IBOutlet UITextField *field2;
	IBOutlet UITextField *field3;
}
@property (nonatomic, retain) IBOutlet UITextField *field1;
@property (nonatomic, retain) IBOutlet UITextField *field2;
@property (nonatomic, retain) IBOutlet UITextField *field3;

-(NSString *)dataFilePath;
-(void)applicationWillTerminate:(NSNotification *)notification;
-(IBAction)gotoAddStudent:(id)sender;
-(IBAction)gotoMainMenu:(id)sender;
-(IBAction)gotoAddProject:(id)sender;
-(IBAction)gotoEditStudents:(id)sender;

@end
