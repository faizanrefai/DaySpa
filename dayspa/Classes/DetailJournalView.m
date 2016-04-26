//
//  DetailJournalView.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailJournalView.h"


@implementation DetailJournalView
@synthesize dateStr,textData,k,detailTxt;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    obj = [DataManager sharedManager];
    
    [super viewDidLoad];
	dateLbl.text = dateStr;
    
//	detailTxt.text =@"journal entry";
//	[detailTxt becomeFirstResponder];
    
    
          
     NSString *tempText;
    tempText = [[NSString alloc] init];
    
   // [obj checkAndCreateDatabase];
    
     tempText = [obj getCurrentText:dateStr];
     if([tempText isEqualToString:[NSString stringWithFormat: @""]])
     {
     k = 1;
     }
     else
     {
     k = 2;
     }
     detailTxt.text = tempText;
    
//    personaljournlVw = [[PersonalJournalViewController alloc] init];
    
    textData = detailTxt.text;
     //[detailTxt becomeFirstResponder];

     
	self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    if (k==1) {
         self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(Save)];
    }
    else
    {
		detailTxt.editable =FALSE;
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onEdit)];
		
	}
    
}
-(void)onEdit{
	detailTxt.editable =TRUE;
	[detailTxt becomeFirstResponder];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(Save)];

}
-(void)Save
{
    NSString *tmp;
    
    tmp = detailTxt.text;
if (k == 1) {

    NSString *txtDate;
    txtDate = [[NSString alloc] init];
    txtDate = dateStr;
    
    //            NSString *trimmedString = [txtDate stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //            
    //            int l;
    //            l = [trimmedString length];
    //            NSLog(@"%i",l);
    
    [obj addJournalEntry:detailTxt.text:txtDate];
    
}
else
{
    [obj updateText:dateStr :tmp];
}
	[self.navigationController popViewControllerAnimated:YES];
}


-(NSString *) getDate : (NSString *)date
{
    self.dateStr = date ; 
    return dateStr;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
	return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
	textData = detailTxt.text;
	[textView resignFirstResponder];
	return YES;
	
}
- (void)textViewDidEndEditing:(UITextView *)textView{
	[textView resignFirstResponder];
}

- (IBAction)dismissKeyboard:(id)sender
{
    [detailTxt becomeFirstResponder];
    [detailTxt resignFirstResponder];
}


//-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
//    
//     textData = detailTxt.text;
//     [detailTxt resignFirstResponder];
//	return YES;
//}

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
  //  [k release];
    [detailTxt  release];
    [textData release];
	[dateStr release];
    [super dealloc];
}


@end
