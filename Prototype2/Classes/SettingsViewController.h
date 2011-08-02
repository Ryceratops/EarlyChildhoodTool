//
//  SettingsViewController.h
//  Prototype2
//
//  Created by Ryan George on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController 
{
	    IBOutlet UITextField *nameField;
	    IBOutlet UITextField *ageField;
	    IBOutlet UITextField *gradeField;
	}
@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *ageField;
@property (nonatomic, retain) IBOutlet UITextField *gradeField;

-(IBAction)saveData:(id) sender;

@end