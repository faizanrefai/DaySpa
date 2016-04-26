//
//  TutorialViewController.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "DaySpaProjectAppDelegate.h"


@interface TutorialViewController : UIViewController {

	MPMoviePlayerController *moviePlayer;
	BOOL isDeviceIpad;
	DaySpaProjectAppDelegate *appDel;
	IBOutlet UIButton *userGuideBtn;
	IBOutlet UIButton *closeBtn;
}

-(IBAction)onUserGuid:(id)sender;
-(IBAction)onColse:(id)sender;
@end
