//
//  TreatmentRoom.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaySpaProjectAppDelegate.h"
#import "MyProgressViewController.h"
#import <AVFoundation/AVFoundation.h>

@class MyProgressViewController;
@interface TreatmentRoom : UIViewController<UITableViewDelegate,AVAudioPlayerDelegate>{
	IBOutlet UIView *detailView;
	IBOutlet UITableView *menuTable;
	IBOutlet UILabel *detailLbl;
	IBOutlet UIButton *inappBtn;
	AVAudioPlayer *audioPlayer;
    int RawCnt;
    int downloadCheck;
    
    NSURLConnection *conn;
    NSMutableData *webData;
    
    IBOutlet UISegmentedControl *DurationSegment;
    IBOutlet UISegmentedControl *ReprogramSegment;
    IBOutlet UISegmentedControl *VisualizationSegment;
    
    int playcnt;
    int downloadCnt;
    NSInteger soundVl;
    int Repcnt;
    int viscnt;
    NSString *prevstr;
    int c;
	NSArray *menuList;
	BOOL isDeviceIpad;
	DaySpaProjectAppDelegate *appDel;
    MyProgressViewController *myprogreeVwObj;
    NSMutableArray *soundArray;

}
@property (nonatomic) int downloadCheck;
@property (nonatomic) int playcnt;
@property (nonatomic) int downloadCnt;
@property (nonatomic) int Repcnt;
@property (nonatomic)int viscnt;
@property (nonatomic, retain)UISegmentedControl *DurationSegment;
@property (nonatomic,retain) NSString *prevstr;
@property (nonatomic) NSInteger soundVl;
@property (nonatomic, retain) UISegmentedControl *ReprogramSegment;
@property (nonatomic, retain) UISegmentedControl *VisualizationSegment;
@property (nonatomic, retain) UIButton *inappBtn;
@property (nonatomic) int c;
@property (nonatomic) int RawCnt;
@property (nonatomic,retain) AVAudioPlayer *audioPlayer;
@property (nonatomic, retain)  NSMutableArray *soundArray;

-(IBAction) inappBtnClick:(id)sender;
-(void)PlayAudio : (NSURL *)url;
-(void)ChooseAudio:(NSString *)tempstr:(int) val;
-(void)VisualOfAudio:(NSString *)tempstr;
-(void)PlayAllAudio : (NSString *)str : (int)val;
-(void)btnclick:(NSString *)str;
- (NSString *) getAudioPath :(NSString *)fstr;
-(void)CheckDownload : (NSString *)str;
-(NSString *)getRandomNumber;
@end
