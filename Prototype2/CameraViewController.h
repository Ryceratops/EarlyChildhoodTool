//
//  CameraViewController.h
//  Prototype2
//
//  Created by Ryan George on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraViewController;
@class SettingsViewController;

@interface CameraViewController : UIViewController 
{
	IBOutlet UIImageView *mainImage;
	IBOutlet UIButton *choosePhoto;
	IBOutlet UIButton *takePhoto;
	    
	IBOutlet UIView *studentView;
	IBOutlet UIView *projectView;
	IBOutlet UIView *contentView;
	IBOutlet UIView *summaryView;
	 
	IBOutlet UISegmentedControl *userSelect;
	IBOutlet UISegmentedControl *documentCollect;
	
	IBOutlet UIButton *studentButton;
	IBOutlet UIButton *projectButton;
	IBOutlet UIButton *contentButton;
	IBOutlet UIButton *summaryButton;
	IBOutlet UIButton *findPhoto;
	IBOutlet UIButton *saveButton;
	
	IBOutlet UILabel *tagsLabel;
	
	IBOutlet UIScrollView *studentScroll;
	IBOutlet UIScrollView *projectScroll;
	IBOutlet UIScrollView *contentScroll;
	IBOutlet UIScrollView *summaryScroll;
	    
	    float spacingStudentVariable;
	    float spacingProjectVariable;
	    float spacingContentVariable;
}

@property (nonatomic, retain) IBOutlet UIImageView *mainImage;
@property (nonatomic, retain) IBOutlet UIButton *choosePhoto;
@property (nonatomic, retain) IBOutlet UIButton *takePhoto;
@property (nonatomic, retain) IBOutlet UIView *studentView;
@property (nonatomic, retain) IBOutlet UIView *projectView;
@property (nonatomic, retain) IBOutlet UIView *contentView;
@property (nonatomic, retain) IBOutlet UIView *summaryView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *userSelect;
@property (nonatomic, retain) IBOutlet UIButton *studentButton;
@property (nonatomic, retain) IBOutlet UIButton *projectButton;
@property (nonatomic, retain) IBOutlet UIButton *contentButton;
@property (nonatomic, retain) IBOutlet UIButton *summaryButton;
@property (nonatomic, retain) IBOutlet UILabel *tagsLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *documentCollect;
@property (nonatomic, retain) IBOutlet UIButton *findPhoto;
@property (nonatomic, retain) IBOutlet UIButton *saveButton;
@property (nonatomic, retain) IBOutlet UIScrollView *studentScroll;
@property (nonatomic, retain) IBOutlet UIScrollView *projectScroll;
@property (nonatomic, retain) IBOutlet UIScrollView *contentScroll;
@property (nonatomic, retain) IBOutlet UIScrollView *summaryScroll;


-(IBAction) capturePhoto:(id) sender;

-(IBAction) showStudents:(id) sender;
-(IBAction) showProjects:(id) sender;
-(IBAction) showContent:(id) sender;
-(IBAction) showSummary:(id) sender;
-(IBAction) toggleUser:(id) sender;

-(IBAction)addStudent:(id) sender;
-(IBAction)addProject:(id)sender;
-(IBAction)addContent:(id)sender;

@end
