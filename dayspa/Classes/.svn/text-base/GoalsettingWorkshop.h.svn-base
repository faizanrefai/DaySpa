//
//  GoalsettingWorkshop.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoalCompletes.h"
#import "DaySpaProjectAppDelegate.h"
#import "DataManager.h"

@class DataManager;
@interface GoalsettingWorkshop : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource> {
    DataManager *obj;
	IBOutlet UILabel *catLbl;
	IBOutlet UIButton *skipBtn;
	IBOutlet UIButton *addBtn;
	IBOutlet UILabel *l1;
	IBOutlet UILabel *l2;
	IBOutlet UILabel *l3;
	IBOutlet UILabel *l4;
	IBOutlet UILabel *l5;
	IBOutlet UILabel *l6;
	IBOutlet UILabel *l7;
	IBOutlet UILabel *l8;
	IBOutlet UILabel *l9;
	IBOutlet UITextView *detailgoal;
	IBOutlet UITextField *entergoal;
	int cnt;
	NSMutableArray *goalArr;
	NSString *str;
	NSArray *catList;
    NSMutableArray *clrArray;
    IBOutlet UITableView *GoalTbl;
    
    IBOutlet UIImageView *LblBgImg;
    IBOutlet UIImageView *TxtFldImg;
    
    int mainInt;
	IBOutlet UILabel *timeLbl;
    NSTimer *randomMain;
    NSTimer *blinkTimer;
    BOOL isTextEmpty;
    IBOutlet UILabel *writingLbl;
    
    BOOL isAdd;
    BOOL isskip;
	GoalCompletes *goalcompeteObj;
	DaySpaProjectAppDelegate *appDel;
	BOOL isDeviceIpad;
	
    int counter;

}
@property (nonatomic) UIImageView *TxtFldImg;
@property (nonatomic) BOOL isskip;
@property (nonatomic) BOOL isAdd;
@property (nonatomic, retain) UIImageView *LblBgImg;
@property (nonatomic, retain) UITableView *GoalTbl;
@property (nonatomic,retain) UILabel *writingLbl;
@property (nonatomic) int mainInt;
@property (nonatomic,retain) UILabel *timeLbl;
@property (nonatomic,retain) NSTimer *randomMain;
@property (nonatomic,retain) NSTimer *blinkTimer;
@property(nonatomic,retain)NSMutableArray *goalArr;
-(IBAction)onSkip:(id)sender;
-(IBAction)onAdd:(id)sender;
- (UIColor *) colorWithHexString: (NSString *) hex;
-(void)BlinkLbl;
-(NSString *)imageChange;
@end
