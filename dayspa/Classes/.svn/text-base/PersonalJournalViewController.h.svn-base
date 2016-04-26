//
//  PersonalJournalViewController.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLCalendarView.h"
#import "DetailJournalView.h"
#import "DaySpaProjectAppDelegate.h"
#import "DataManager.h"
#import "KLTile.h"
#import "KLGridView.h"


@class DataManager,KLTile,DetailJournalView,KLCalendarView,KLGridView;
@interface PersonalJournalViewController : UIViewController<UITextViewDelegate> {
	
	KLCalendarView *calendarView;
	IBOutlet UITextView *detailTxt;
	IBOutlet UILabel *dateLbl;
    NSString *txtData;
    NSString *todaysDate;
	
	DaySpaProjectAppDelegate *appDel;
	DetailJournalView *detailViewObj;
	BOOL isDeviceIpad;
    DataManager *obj;
    KLTile *tile;
    KLTile *prevtile;
    KLTile *TempTile;
    KLGridView *gridVwObj;
    IBOutlet UIButton *saveBtn;
    int p;
    BOOL flag;
	NSMutableArray *TempTileCollection;
	BOOL isSave;

}

@property (nonatomic, retain) UIButton *saveBtn;
@property (nonatomic, retain)NSString *todaysDate;
@property (nonatomic, retain) NSString *txtData;
@property (nonatomic) int p;
@property (nonatomic) BOOL *flag;
 
@property (nonatomic, retain)KLTile *tile;
-(void)getAllTiles : (KLTile *)crntTile;
-(IBAction)save;

@end
