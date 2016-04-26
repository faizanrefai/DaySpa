//
//  MyProgressViewController.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaySpaProjectAppDelegate.h"
#import "TreatmentRoom.h"

@class TreatmentRoom;
@interface MyProgressViewController : UIViewController<UITableViewDelegate,UITextFieldDelegate> {
	
    
    TreatmentRoom *treatmentRm;
	DaySpaProjectAppDelegate *appDel;
	BOOL isDeviceIpad;
	IBOutlet UIView *myProgress;
	IBOutlet UIView *myDetails;
	IBOutlet UISegmentedControl *segmentCntroller;
	IBOutlet UITableView *treatmentTable;
	IBOutlet UILabel *resultLbl;	
	
	IBOutlet UITextField *fnmtxt;
	IBOutlet UITextField *lnmtxt;
	IBOutlet UITextField *emailtxt;
	IBOutlet UITextField *pwrdtxt;
	IBOutlet UITextField *cpswrdtxt;
	IBOutlet UITextField *cntrytxt;
	
	IBOutlet UIButton *playedBtn1;
    IBOutlet UIButton *playedBtn2;
    IBOutlet UIButton *playedBtn3;
    IBOutlet UIButton *playedBtn4;
    IBOutlet UIButton *playedBtn5;
    IBOutlet UIButton *playedBtn6;
    IBOutlet UIButton *playedBtn7;
    IBOutlet UIButton *playedBtn8;
    IBOutlet UIButton *playedBtn9;
    IBOutlet UIButton *playedBtn10;
	IBOutlet UIButton *renewbtn;
    
    NSMutableArray *rangeArray1;
	NSMutableArray *rangeArray2;
    NSMutableArray *rangeArray3;
    NSMutableArray *rangeArray4;
    NSMutableArray *rangeArray;
    
	IBOutlet UITableView *progressReportTbl;
    IBOutlet UITableViewCell *reportCell;
    
    NSMutableDictionary *starCatDict;
    NSMutableArray *cellImgArray;
	NSArray *treatmentList;
}

@property (nonatomic,retain) NSMutableArray *cellImgArray;
@property (nonatomic, retain) NSMutableDictionary *starCatDict;
@property (nonatomic, retain) UITableView *progressReportTbl;
@property (nonatomic, retain) UITableViewCell *reportCell;
@property (nonatomic, retain) NSMutableArray *rangeArray2;
@property (nonatomic, retain)  NSMutableArray *rangeArray1;
@property (nonatomic, retain) NSMutableArray *rangeArray3;
@property (nonatomic, retain)  NSMutableArray *rangeArray4;
@property (nonatomic, retain) NSMutableArray *rangeArray;

@property (nonatomic, retain)UIButton *playedBtn1;
@property (nonatomic, retain) UIButton *playedBtn2;
@property (nonatomic, retain) UIButton *playedBtn3;
@property (nonatomic, retain) UIButton *playedBtn4;
@property (nonatomic, retain) UIButton *playedBtn5;
@property (nonatomic, retain) UIButton *playedBtn6;
@property (nonatomic, retain) UIButton *playedBtn7;
@property (nonatomic, retain) UIButton *playedBtn8;
@property (nonatomic, retain) UIButton *playedBtn9;
@property (nonatomic, retain) UIButton *playedBtn10;
@property (nonatomic, retain) TreatmentRoom *treatmentRm;
-(IBAction)onRenew:(id)sender;
-(void)animateTextField:(UITextField*) textField up: (BOOL) up;
-(void)playCount:(NSString *)str:catString;
-(IBAction)ChooseFromTop:(id)sender;
-(void)catSelected:(NSIndexPath *)ind;

@end
