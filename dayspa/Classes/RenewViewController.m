//
//  RenewViewController.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RenewViewController.h"


@implementation RenewViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	rflag1 = TRUE;
	rflag2 = FALSE;
	rflag3 = FALSE;
	rflag4 = FALSE;
}


-(IBAction)onRadioselection:(id)sender{
	if(sender == radioBtn1){
		if(rflag1){
			rflag1 = FALSE;
			[radioBtn1 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
		
		}
			
		else{
			rflag1 = TRUE;
			rflag2 = FALSE;
			rflag3 = FALSE;
			rflag4 = FALSE;
			[radioBtn1 setImage:[UIImage imageNamed:@"ron.png"] forState:UIControlStateNormal];
			[radioBtn2 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			[radioBtn3 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			[radioBtn4 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			
		}
	}
	if(sender == radioBtn2){
		if(rflag2){
		rflag2 = FALSE;
			[radioBtn2 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			
			
		}
			
		else{
			rflag2 = TRUE;
			rflag1 = FALSE;
			rflag3 = FALSE;
			rflag4 = FALSE;
			[radioBtn2 setImage:[UIImage imageNamed:@"ron.png"] forState:UIControlStateNormal];
			[radioBtn1 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			[radioBtn3 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			[radioBtn4 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			
		}
			
	}

	if(sender == radioBtn3){
		if(rflag3){
		rflag3 = FALSE;
			[radioBtn3 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
		}
			
		else{
			rflag3 = TRUE;
			rflag2 = FALSE;
			rflag1 = FALSE;
			rflag4 = FALSE;
			[radioBtn3 setImage:[UIImage imageNamed:@"ron.png"] forState:UIControlStateNormal];
			[radioBtn2 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			[radioBtn1 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			[radioBtn4 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			
		}
	}

	if(sender == radioBtn4){
		if(rflag4){
		rflag4 = FALSE;
			[radioBtn4 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
		}
			
		else{
			rflag4 = TRUE;
			rflag2 = FALSE;
			rflag3 = FALSE;
			rflag1 = FALSE;
			[radioBtn4 setImage:[UIImage imageNamed:@"ron.png"] forState:UIControlStateNormal];
			[radioBtn2 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			[radioBtn3 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			[radioBtn1 setImage:[UIImage imageNamed:@"roff.png"] forState:UIControlStateNormal];
			

		}
	}


}
-(IBAction)onClose:(id)sender{
	[self.view removeFromSuperview];

}
-(IBAction)onContinue:(id)sender{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Paypal ternsaction here"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
}

- (void)textFieldDidBeginEditing:(UITextField*)textField {	
	[self animateTextField: textField up: YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {	 
	[self animateTextField: textField up: NO];	
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

- (void)animateTextField:(UITextField*) textField up: (BOOL) up {
	//if(isDeviceIpad)
//		return;
	int movementDistance = 50;
	//if(textField ==fnmtxt || textField ==lnmtxt);
//	if(textField ==emailtxt)		
//		movementDistance = 50;
//	if(textField ==pwrdtxt)		
//		movementDistance = 100;
//	if(textField ==cpswrdtxt)		
//		movementDistance = 150;
	if(textField ==countryTxt)		
		movementDistance = 120;
	if(movementDistance < 0)
		movementDistance = 0;
	float movementDuration = 0.3f; 
	int movement = (up ? -movementDistance : movementDistance);	
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
	[UIView commitAnimations];
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
