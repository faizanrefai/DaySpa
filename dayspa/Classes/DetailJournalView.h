//
//  DetailJournalView.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "KLTile.h"
#import "PersonalJournalViewController.h"

@class DataManager,KLTile,PersonalJournalViewController;
@interface DetailJournalView : UIViewController<UITextViewDelegate> {
	IBOutlet UITextView *detailTxt;
	IBOutlet UILabel *dateLbl;
	NSString *dateStr;
     NSString *textData;
    DataManager *obj;
    KLTile *tile;
    PersonalJournalViewController *personaljournlVw;
    int k;
   
}

@property (nonatomic,retain)NSString *dateStr;
@property (nonatomic, retain)  NSString *textData;
@property (nonatomic) int k;
@property (nonatomic, retain) UITextView *detailTxt;

-(NSString *) getDate : (NSString *)date;
- (IBAction)dismissKeyboard:(id)sender;
-(void)Save;
@end
