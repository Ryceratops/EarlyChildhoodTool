//
//  AddStudentViewController.h
//  Prototype2
//
//  Created by Ryan George on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@class SettingsViewController;
@class MainMenuViewController;

@interface AddStudentViewController : UIViewController 
{
	sqlite3 *db;
	
	IBOutlet UITextField *firstNameField;
	IBOutlet UITextField *lastNameField;
	IBOutlet UIImageView *pictureField;
	IBOutlet UIImage *pictureView;
	IBOutlet UIDatePicker *datePicker;
	IBOutlet UIButton *choosePhoto;
	IBOutlet UIButton *takePhoto;
	
	NSString *studentFirstName;
	NSString *studentLastName;
	NSString *studentPicture;
	NSString *currentDate;
}
@property(nonatomic, retain) IBOutlet UITextField *firstNameField;
@property(nonatomic, retain) IBOutlet UITextField *lastNameField;
@property(nonatomic, retain) IBOutlet UIImageView *pictureField;
@property(nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property(nonatomic, retain) IBOutlet UIButton *choosePhoto;
@property(nonatomic, retain) IBOutlet UIButton *takePhoto;
@property(nonatomic, retain) IBOutlet UIImage *pictureView;

@property (nonatomic,retain) NSString *currentDate;
@property (nonatomic,retain) NSString *studentFirstName;
@property (nonatomic,retain) NSString *studentLastName;
@property (nonatomic,retain) NSString *studentPicture;


-(NSString *)filePath;
-(IBAction)addStudent;
-(IBAction)getPhoto:(id)sender;
-(void)saveImage:(UIImage *) image:(NSString *)imageName;
-(void)clearFields;
-(IBAction)backgroundClick:(id)sender;
-(IBAction)gotoSettings:(id)sender;
-(IBAction)gotoMainMenu:(id)sender;

@end

