//
//  RenewViewController.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RenewViewController : UIViewController <UITextFieldDelegate>{
	IBOutlet UITextField *fnmTxt;
	IBOutlet UITextField *snmTxt;
	IBOutlet UITextField *emailTxt;
	IBOutlet UILabel *expirydayLbl;
	IBOutlet UITextField *countryTxt;
	
	IBOutlet UIButton *radioBtn1;	
	IBOutlet UIButton *radioBtn2;	
	IBOutlet UIButton *radioBtn3;	
	IBOutlet UIButton *radioBtn4;	
		
	IBOutlet UIButton *cntBtn;	
	IBOutlet UIButton *closeBtn;
	BOOL rflag1;
	BOOL rflag2;
	BOOL rflag3;
	BOOL rflag4;

}

- (void)animateTextField:(UITextField*) textField up: (BOOL) up;
- (IBAction)onRadioselection:(id)sender;
- (IBAction)onClose:(id)sender;
- (IBAction)onContinue:(id)sender;

@end
