//
//  EditStudentsViewController.h
//  Prototype2
//
//  Created by Ryan George on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface EditStudentsViewController : UIViewController 
{
	sqlite3 *db;
	
	IBOutlet UITextView *textView;
}
@property (nonatomic, retain) IBOutlet UITextView *textView;

-(IBAction)gotoMainMenu:(id)sender;
-(IBAction)gotoSettings:(id)sender;

@end
