//
//  SettingViewController.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingViewController : UIViewController {
	
	IBOutlet UIButton *ch1btn;
	IBOutlet UIButton *ch2btn;
	IBOutlet UIButton *ch3btn;
	
	IBOutlet UIButton *mthlybtn;
	IBOutlet UIButton *weeklybtn;
	IBOutlet UIButton *dailybtn;

	BOOL flagr1;
	BOOL flagr2;
	BOOL flagr3;
	
	BOOL flagch1;
	BOOL flagch2;
	BOOL flagch3;
	
	
}

-(IBAction)onChkBtn:(id)sender;
-(IBAction)onradiobtnBtn:(id)sender;
@end
