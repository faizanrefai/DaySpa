//
//  GoalCell.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GoalCell.h"
#import "MyGoalViewController.h"

@implementation GoalCell
@synthesize priorityActionSheet,statusActionsheet,datePicker,statusBtn,priorityBtn,dueDateBtn,goalTxt,imgBtn;

-(void)awakeFromNib{
	parentObj = [[MyGoalViewController alloc] init];
	appDel = (DaySpaProjectAppDelegate *)[[UIApplication sharedApplication]delegate];
	isDeviceIpad = [appDel isIpad];
	//img =[UIImage imageNamed:@"takeimage.png"];
}

-(IBAction)onDueDate:(id)sender{
	if(isDeviceIpad){		
		UIPopoverController *popoverController = nil;
		UIViewController* popoverContent = [[UIViewController alloc]init];
		
		UIView* popoverView = [[UIView alloc] initWithFrame:self.frame];//CGRectMake(0, 0, 300, 400)];
		
		CGRect pickerFrame = CGRectMake(0,0,300,300);
		UIDatePicker *pickerView = [[UIDatePicker alloc]initWithFrame:pickerFrame];
		pickerView.datePickerMode = UIDatePickerModeDate;
		self.datePicker = pickerView;		
		[popoverView addSubview:datePicker];
		[pickerView addTarget:self action:@selector(pickerChanged:) forControlEvents:UIControlEventValueChanged];
		
		[datePicker release];		
		popoverContent.view = popoverView;
		popoverContent.contentSizeForViewInPopover = CGSizeMake(300, 240);
		 
		popoverController = [[UIPopoverController alloc]
							 initWithContentViewController:popoverContent];
		
		[popoverController presentPopoverFromRect:self.frame inView:parentObj.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	}
	else {
		dateActionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:nil];	
		// Add the picker
		UIDatePicker *pickerView = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,65,0,0)];
		pickerView.datePickerMode = UIDatePickerModeDate;
		self.datePicker = pickerView;
		[dateActionsheet addSubview:pickerView];
		[dateActionsheet showInView:parentObj.view];
		[dateActionsheet setBounds:CGRectMake(0,0,320, 480)];	
		[pickerView release];
		[dateActionsheet release];		
	}
	
}

-(IBAction)pickerChanged:(id)sender{
	NSDate *date = [datePicker date];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"dd-MM-yyyy"];
	[dueDateBtn setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
	
}
-(IBAction)onPriority:(id)sender{
	NSLog(@"click");
	priorityActionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Highest",@"High",@"Medium", @"Low",nil];
	if(isDeviceIpad)
		[priorityActionSheet showFromRect:self.frame inView:parentObj.view animated:YES];
	else 					
		[priorityActionSheet showInView:parentObj.view];
	[priorityActionSheet release];
	
}

-(IBAction)onStatus:(id)sender{
	NSLog(@"click");

	statusActionsheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"New",@"Active",@"Postponed",@"Complete",nil];
	if(isDeviceIpad)
		[statusActionsheet showFromRect:self.frame inView:parentObj.view animated:YES];
	else 
		[statusActionsheet showInView:parentObj.view];
	[statusActionsheet release];
}


-(IBAction)takeImage:(id)sender{
	UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Photo or Video",@"Choose from Library",nil];
	if(isDeviceIpad)
		[actionsheet showFromRect:self.frame inView:parentObj.view animated:YES];
	else 
		[actionsheet showInView:parentObj.view];
		[actionsheet release];
	
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    parentObj.isPresent =TRUE;
	[picker dismissModalViewControllerAnimated:YES];
	
	img = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//	imgBtn.imageView.image =img;
    [imgBtn setImage:img forState:UIControlStateNormal];
    NSLog(@"%@",imgBtn.imageView.image);
    [parentObj updateTableValues:self.tag];
}

-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger) buttonIndex{	
	if(buttonIndex == [actionSheet cancelButtonIndex] && actionSheet == dateActionsheet){		
		NSDate *date = [datePicker date];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"d-MM-yyyy"];
        [dueDateBtn setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
//		dueDateBtn.titleLabel.text = [formatter stringFromDate:date];
        [parentObj updateTableValues:self.tag];
	}
    else
    {
        return;
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(actionSheet ==dateActionsheet){
		NSDate *date = [datePicker date];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"dd-MM-yyyy"];
		[dueDateBtn setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
		//[dueDateBtn setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
		[parentObj updateTableValues:self.tag];
		return;
	}
	if(actionSheet == statusActionsheet){
		
		if (buttonIndex == 0)
			[statusBtn setTitle: @"New" forState: UIControlStateNormal];
       // [parentObj.t_dic setValue:@"New" forKey:@"Status"];
		if (buttonIndex == 1)
			[statusBtn setTitle: @"Active" forState: UIControlStateNormal];	
		//[parentObj.t_dic setValue:@"Active" forKey:@"Status"];
		if (buttonIndex == 2)
			[statusBtn setTitle: @"Postponed" forState: UIControlStateNormal];
       // [parentObj.t_dic setValue:@"Postponed" forKey:@"Status"];
		if (buttonIndex == 3)
			[statusBtn setTitle: @"complete" forState: UIControlStateNormal];
		//[parentObj.t_dic setValue:@"complete" forKey:@"Status"];
		 [parentObj updateTableValues:self.tag];
	}
	else if(actionSheet == priorityActionSheet){
		if (buttonIndex == 0)
			[priorityBtn setTitle: @"Highest" forState: UIControlStateNormal];	
		//[parentObj.t_dic setValue:@"Highest" forKey:@"Priority"];
		if (buttonIndex == 1)
			[priorityBtn setTitle: @"High" forState: UIControlStateNormal];	
       // [parentObj.t_dic setValue:@"High" forKey:@"Priority"];
		if (buttonIndex == 2)
			[priorityBtn setTitle: @"Medium" forState: UIControlStateNormal];	
		//[parentObj.t_dic setValue:@"Medium" forKey:@"Priority"];
	    if (buttonIndex == 3)
			[priorityBtn setTitle: @"Low" forState: UIControlStateNormal];
        //[parentObj.t_dic setValue:@"Low" forKey:@"Priority"];
        
        [parentObj updateTableValues:self.tag];
			
	}
	else {
		if (buttonIndex == 0) {
			UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
			imagePicker.delegate = self;
			imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
			imagePicker.editing=NO;
			if(isDeviceIpad){
				UIPopoverController *popoverControllerimg = [[UIPopoverController alloc]initWithContentViewController:imagePicker];
				[popoverControllerimg presentPopoverFromRect:CGRectMake(0,0,620, 500) inView:parentObj.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
			}
			else {
				[parentObj presentModalViewController:imagePicker animated:YES];				
			}
			[imagePicker release];
		}		
		if(buttonIndex ==1) {
			UIImagePickerController *picker;
			picker = [[UIImagePickerController alloc]init];
			picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
			picker.editing=NO;
			picker.delegate = self;
			if(isDeviceIpad){
			UIPopoverController	*popoverControllerimg = [[UIPopoverController alloc]initWithContentViewController:picker];
				[popoverControllerimg presentPopoverFromRect:CGRectMake(0,0,620, 500) inView:parentObj.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
			}
			else {
				[parentObj presentModalViewController:picker animated:YES];
				
			}
		}
        [parentObj updateTableValues:self.tag];
	}
	
}	

-(void)setParentObj:(MyGoalViewController*)obj{
	parentObj =obj;
}


- (void)textFieldDidBeginEditing:(UITextField*)textField {	
	[parentObj animateTextField: textField up: YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {	 
	[parentObj animateTextField: textField up: NO];	
   // [parentObj.t_dic setValue:textField.text forKey:@"Goal_desc"];
   [parentObj updateTableValues:self.tag];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}
- (void)dealloc {
    [super dealloc];
}


@end
