//
//  SettingViewController.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingViewController.h"


@implementation SettingViewController



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	flagr1 = FALSE;
	flagr2 = TRUE;
	flagr3 =FALSE;
	
	flagch1 = FALSE;
	flagch2 = FALSE;
	flagch3 = FALSE;
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

-(IBAction)onChkBtn:(id)sender{	
	if(sender == ch1btn){
		if(flagch1){
			flagch1 =FALSE;
			[ch1btn setImage:[UIImage imageNamed:@"UnCheckBtn.png"] forState:UIControlStateNormal];
		}
		else{
			flagch1 =TRUE;
			[ch1btn setImage:[UIImage imageNamed:@"checkBtn.png"] forState:UIControlStateNormal];
		}
	}
	if(sender == ch2btn){
		if(flagch2){
			flagch2 =FALSE;
			[ch2btn setImage:[UIImage imageNamed:@"UnCheckBtn.png"] forState:UIControlStateNormal];
		}
		else{
			flagch2 =TRUE;
			[ch2btn setImage:[UIImage imageNamed:@"checkBtn.png"] forState:UIControlStateNormal];
		}
	}
	if(sender == ch3btn){
		if(flagch3){
			flagch3 =FALSE;
			[ch3btn setImage:[UIImage imageNamed:@"UnCheckBtn.png"] forState:UIControlStateNormal];
		}
		else{
			flagch3 =TRUE;
			[ch3btn setImage:[UIImage imageNamed:@"checkBtn.png"] forState:UIControlStateNormal];
		}
		
	}
}
-(IBAction)onradiobtnBtn:(id)sender{
	if(sender == dailybtn){
		if(flagr1){
			flagr1 =FALSE;
			flagr2 =TRUE;
			flagr3 =TRUE;
			[dailybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
		}
		else {
			flagr1 =TRUE;
			flagr2 =FALSE;
			flagr3 =FALSE;			
			[dailybtn setImage:[UIImage imageNamed:@"RedioBtnSelected.png"] forState:UIControlStateNormal];
			[mthlybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
			[weeklybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
			
		}		
	}
	if(sender == weeklybtn){
		if(flagr2){
			flagr2 =FALSE;
			flagr1 =TRUE;
			flagr3 =TRUE;		
			[weeklybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
			
		}
		else {
			flagr2 =TRUE;
			flagr1 =FALSE;
			flagr3 =FALSE;
			[weeklybtn setImage:[UIImage imageNamed:@"RedioBtnSelected.png"] forState:UIControlStateNormal];
			[dailybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
			[mthlybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
		}
		
	}
	if(sender == mthlybtn){
		if(flagr3){
			flagr3 =FALSE;
			flagr2 =TRUE;
			flagr1 =TRUE;
			[mthlybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
			
		}
		else {
			flagr3 =TRUE;
			flagr1 =FALSE;
			flagr2 =FALSE;
			[mthlybtn setImage:[UIImage imageNamed:@"RedioBtnSelected.png"] forState:UIControlStateNormal];
			[dailybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
			[weeklybtn setImage:[UIImage imageNamed:@"RedioBtn.png"] forState:UIControlStateNormal];
		}
		
	}
	
	NSLog(@"radiobutton");
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
