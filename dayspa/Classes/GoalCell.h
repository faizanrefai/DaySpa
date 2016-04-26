//
//  GoalCell.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaySpaProjectAppDelegate.h"
#import "MyGoalViewController.h"

@class MyGoalViewController;
@interface GoalCell : UITableViewCell<UITextFieldDelegate, UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate> {

	IBOutlet UIButton *imgBtn;
	IBOutlet UIButton *statusBtn;
	IBOutlet UIButton *priorityBtn;
	IBOutlet UIButton *dueDateBtn;
	IBOutlet UITextField *goalTxt;
	DaySpaProjectAppDelegate *appDel;
	BOOL isDeviceIpad;
	MyGoalViewController *parentObj;
	UIImage *img;
	UIActionSheet *statusActionsheet;
	UIActionSheet *priorityActionSheet;
	UIActionSheet *dateActionsheet;
	UIDatePicker *datePicker;
	
}

@property(nonatomic,retain)UIActionSheet *statusActionsheet;
@property(nonatomic,retain)UIActionSheet *priorityActionSheet;
@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) UITextField *goalTxt;
@property (nonatomic, retain) UIButton *statusBtn;
@property (nonatomic, retain) UIButton *priorityBtn;
@property (nonatomic, retain) UIButton *dueDateBtn;
@property (nonatomic, retain) UIButton *imgBtn;

-(IBAction)takeImage:(id)sender;
-(void)setParentObj:(MyGoalViewController*)obj;
-(IBAction)onPriority:(id)sender;
-(IBAction)onStatus:(id)sender;
-(IBAction)onDueDate:(id)sender;
//-(void)setData;
@end
