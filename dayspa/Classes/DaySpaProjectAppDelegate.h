//
//  DaySpaProjectAppDelegate.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TutorialViewController;
@class RenewViewController;


@interface DaySpaProjectAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UITabBarController *tabBar;
	UIView *entryView;
	UIButton *followProgramBtn;
	UIButton *editgoalBtn;
	UIButton *membersBtn;
	UIButton *tutorialBtn;
	UIButton *renewBtn;
	BOOL isDeviceIpad;
	TutorialViewController *tutorialObj;
	RenewViewController *renewObj;
    
    
    int menu1Cnt;
    int menu2Cnt;
    int menu3Cnt;
    int menu4Cnt;
    int menu5Cnt;
    int menu6Cnt;
    int menu7Cnt;
    int menu8Cnt;
    int menu9Cnt;
    int menu10Cnt;


   
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic) int menu1Cnt;
@property (nonatomic) int menu2Cnt;
@property (nonatomic)int menu3Cnt;
@property (nonatomic)int menu4Cnt;
@property (nonatomic)int menu5Cnt;
@property (nonatomic)int menu6Cnt;
@property (nonatomic)int menu7Cnt;
@property (nonatomic)int menu8Cnt;
@property (nonatomic)int menu9Cnt;
@property (nonatomic)int menu10Cnt;

-(BOOL)isIpad;
- (void) copyDatabaseIfNeeded;
- (NSString *) getDBPath;
@end

