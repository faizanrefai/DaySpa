//
//  GoalsettingWorkshop.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GoalsettingWorkshop.h"


@implementation GoalsettingWorkshop
@synthesize goalArr,mainInt,timeLbl,randomMain,writingLbl,GoalTbl,blinkTimer,LblBgImg,TxtFldImg,isskip,isAdd;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidLoad {
    [super viewDidLoad];
	appDel = (DaySpaProjectAppDelegate *)[[UIApplication sharedApplication]delegate];
	isDeviceIpad = [appDel isIpad];
	NSArray *tempArr = [NSArray arrayWithObjects: @"HEALTH", @"CAREER",@"FINANCIAL",@"MATERIAL",
						@"LIFESTYLE", @"RELATIONSHIPS",@"FAMILY",@"COMMUNITY",@"SPIRITUAL",nil];
	catList = [[NSArray arrayWithArray:tempArr] retain];
	
	goalArr =[[NSMutableArray alloc]init];
    clrArray = [[NSMutableArray alloc] init];
	str =@"";
	catLbl.text = [catList objectAtIndex:0];
	cnt =0;
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:171.0/255 green:172.0/255 blue:255.0/255 alpha:0.0];
    
    
    
    
    mainInt = 60;
    randomMain = [NSTimer scheduledTimerWithTimeInterval:(1.0/1.0) target:self selector:@selector(randomMainVoid) userInfo:nil repeats:YES];
    
   // self.navigationController.navigationBar.tintColor = [UIColor blackColor];

}

-(void)randomMainVoid
{
    if (mainInt>0) {
        mainInt -=1;
        timeLbl.text = [NSString stringWithFormat:@"%d",mainInt];
    }
    else
    {
        if ([entergoal.text isEqualToString:@""]) {
           [self onSkip:nil];
          //  mainInt = 60;
            timeLbl.text = [NSString stringWithFormat:@"%d",mainInt];
            
        }
    }
    
        counter++;
        if (counter >= 10) {
        NSLog(@"keep writting");
          //  writingLbl.hidden = NO;
            blinkTimer = [NSTimer scheduledTimerWithTimeInterval:(1.0/1.0) target:self selector:@selector(BlinkLbl) userInfo:nil repeats:NO];
                    
        }
    else
    {
        [blinkTimer invalidate];
        blinkTimer=nil;
        [blinkTimer release];
    }
}

-(void)BlinkLbl
{
    if (writingLbl.hidden == YES) {
         writingLbl.hidden = NO;
    }
    else
    {
     writingLbl.hidden = YES;
    }
}

//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    
//    isTextEmpty = TRUE;
//    return YES;
//}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to 
{
    counter = 0;
     writingLbl.hidden = YES;
    return YES;
}

//-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    isTextEmpty = FALSE;
//    return YES;
//}

-(IBAction)onSkip:(id)sender{
    
    isskip = TRUE;
    
    mainInt = 60;
	cnt++;
	if(cnt>8){
		if(goalcompeteObj)
			[goalcompeteObj release];
		if(isDeviceIpad)
			goalcompeteObj = [[GoalCompletes alloc]initWithNibName:@"GoalCompletesiPad" bundle:nil ];
		else 
			goalcompeteObj = [[GoalCompletes alloc]initWithNibName:@"GoalCompletes" bundle:nil ];
		[self.navigationController pushViewController:goalcompeteObj animated:YES];
		self.navigationController.navigationBar.tintColor = nil;
	}
	else{
      //  [goalArr removeAllObjects];
        //detailgoal.text = @"";
		catLbl.text = [catList objectAtIndex:cnt];
		if(cnt == 1){
			l1.hidden =YES;
			self.navigationController.navigationBar.tintColor = 
            [UIColor colorWithRed:212.0/255 green:106.0/255 blue:0.0/255 alpha:0.0];
		}
		if(cnt == 2){
			l2.hidden =YES;
			self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:255.0/255 green:111.0/255 blue:207.0/255 alpha:0.0];	
		}
		if(cnt == 3){
			l3.hidden =YES;
			self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:255.0/255 green:0.0/255 blue:0.0/255 alpha:0.0];
		}
		if(cnt == 4){
			l4.hidden =YES;
			self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:102.0/255 alpha:0.0];

		}
		if(cnt == 5){
			l5.hidden =YES;
			self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:255.0/255 green:128.0/255 blue:0.0/255 alpha:0.0];
		}
		if(cnt == 6){
			l6.hidden =YES;
			self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.0/255 green:0.0/255 blue:255.0/255 alpha:0.0];
		}
		if(cnt == 7){
			l7.hidden =YES;
			self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.0/255 green:255.0/255 blue:255.0/255 alpha:0.0];
		}
		if(cnt == 8){
			l8.hidden =YES;
			self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.0/255 green:128.0/255 blue:64.0/255 alpha:0.0];
		}
		if(cnt == 9){
			l9.hidden =YES;

		}
        [self imageChange];
	}	
    
}

- (UIColor *) colorWithHexString: (NSString *) hex  
{  
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];  
    
    // String should be 6 or 8 characters  
    if ([cString length] < 6) return [UIColor grayColor];  
    
    // strip 0X if it appears  
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];  
    
    if ([cString length] != 6) return  [UIColor grayColor];  
    
    // Separate into r, g, b substrings  
    NSRange range;  
    range.location = 0;  
    range.length = 2;  
    NSString *rString = [cString substringWithRange:range];  
    
    range.location = 2;  
    NSString *gString = [cString substringWithRange:range];  
    
    range.location = 4;  
    NSString *bString = [cString substringWithRange:range];  
    
    // Scan values  
    unsigned int r, g, b;  
    [[NSScanner scannerWithString:rString] scanHexInt:&r];  
    [[NSScanner scannerWithString:gString] scanHexInt:&g];  
    [[NSScanner scannerWithString:bString] scanHexInt:&b];  
    
    return [UIColor colorWithRed:((float) r / 255.0f)  
                           green:((float) g / 255.0f)  
                            blue:((float) b / 255.0f)  
                           alpha:1.0f];  
} 

-(NSString *)imageChange
{
    NSString *cellImgName;
    
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:0]]]){
        if (isAdd) {
            if (isDeviceIpad) {
                cellImgName = @"iPadCell1.png";
            }
            else
            {
                cellImgName = @"iPhoneCell1.png";
            }
            
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg1.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg1.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg1.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg1.png"]];
            }
            isskip = FALSE;
        }
    }
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:1]]]){
        if (isAdd) {
            cellImgName = @"iPadCell2.png";
        }
        else
        {
            cellImgName = @"iPhoneCell2.png";
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg2.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg2.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg2.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg2.png"]];     
            }
            isskip = FALSE;
        }
    }
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:2]]]){
        if (isAdd) {
            cellImgName = @"iPadCell3.png";
        }
        else
        {
            cellImgName = @"iPhoneCell3.png";
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg3.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg3.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg3.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg3.png"]]; 
            }
            isskip = FALSE;
        }
    }
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:3]]]){
        if (isAdd) {
            cellImgName = @"iPadCell4.png";
        }
        else
        {
            cellImgName = @"iPhoneCell4.png";
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg4.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg4.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg4.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg4.png"]];
            }
           isskip = FALSE;
        }
    }
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:4]]]){
        if (isAdd) {
            cellImgName = @"iPadCell5.png";
        }
        else
        {
            cellImgName = @"iPhoneCell5.png";
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg5.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg5.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg5.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg5.png"]];
            }
            isskip = FALSE;
        }
    }
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:5]]]){
        // colorLbl.backgroundColor = [UIColor colorWithRed:0.0/255 green:0.0/255 blue:255.0/255 alpha:0.0];
        if (isAdd) {
            cellImgName = @"iPadCell6.png";
        }
        else
        {
            cellImgName = @"iPhoneCell6.png";
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg6.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg6.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg6.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg6.png"]];
            }
            isskip = FALSE;
        }
    }
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:6]]]){
        if (isAdd) {
            cellImgName = @"iPadCell7.png";
        }
        else
        {
            cellImgName = @"iPhoneCell7.png";
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg7.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg7.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg7.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg7.png"]];
            }
            isskip = FALSE;
        }
    }
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:7]]]){
        if (isAdd) {
            cellImgName = @"iPadCell8.png";
        }
        else
        {
            cellImgName = @"iPhoneCell8.png";
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg8.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg8.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg8.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg8.png"]];
            }
            isskip = FALSE;
        }
    }
    if([catLbl.text isEqualToString:[NSString stringWithFormat:@"%@",[catList objectAtIndex:8]]]){
        if (isAdd) {
            cellImgName = @"iPadCell9.png";
        }
        else
        {
            cellImgName = @"iPhoneCell9.png";
        }
        if (isskip) {
            if (isDeviceIpad) {
                [LblBgImg setImage:[UIImage imageNamed:@"iPadLblImg9.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPadTxtImg9.png"]];
            }
            else
            {
                [LblBgImg setImage:[UIImage imageNamed:@"iPhoneLblImg9.png"]];
                [TxtFldImg setImage:[UIImage imageNamed:@"iPhoneTxtImg9.png"]];
            }
            isskip = FALSE;
        }
    }

    return cellImgName;
}


-(IBAction)onAdd:(id)sender{
    counter = 0;
	str =@"";
	//detailgoal.text = @"";
	obj = [DataManager sharedManager];
    
    isAdd = TRUE;
        
	[goalArr addObject:entergoal.text];
    NSString *catstr = catLbl.text;
    UIImage *img = [UIImage imageNamed:@"takeimage.png"];
    NSData *imageData = UIImagePNGRepresentation(img);

    NSString *temp;
    temp = [self imageChange];
     
    [clrArray addObject:temp];
    
    [obj addGoalEntry:catstr :entergoal.text:@"New":@"Highest":@"Ongoing":imageData];

    [GoalTbl reloadData];
	[entergoal resignFirstResponder];
	for (int i = 0;i<[goalArr count]; i++) {
		str = [NSString stringWithFormat:@"%@ \n %@",str,[goalArr objectAtIndex:i]];
	}
       
    [GoalTbl reloadData];
	entergoal.text=@"";
	detailgoal.text = str;
    if (timeLbl.text == @"60") {
        [self onSkip:nil];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [goalArr count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [GoalTbl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.tag = indexPath.row;
    UILabel *colorLbl;
    UILabel *textLbl;
    int Txtcnt =[goalArr count]-1;
    int clrCnt = [clrArray count]-1;
    if (isDeviceIpad) {
        textLbl = [[UILabel alloc] initWithFrame:CGRectMake(73,5, 800, 20)];
    }
    else
    {
    textLbl = [[UILabel alloc] initWithFrame:CGRectMake(50,5, 600, 20)];
    }
    colorLbl = [[UILabel alloc] init];
    colorLbl = [clrArray objectAtIndex:indexPath.row];
    textLbl.text = [goalArr objectAtIndex:Txtcnt-indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
  if(isDeviceIpad)
  {
    UIImageView *imgV =[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[clrArray objectAtIndex:clrCnt-indexPath.row]]]];
    imgV.frame =cell.frame;
    imgV.frame = CGRectMake(0, 0, 748, 44);
      [cell.contentView addSubview:imgV];
  }
    else
    {
        UIImageView *imgV =[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[clrArray objectAtIndex:clrCnt-indexPath.row]]]];
        imgV.frame =cell.frame;
        imgV.frame = CGRectMake(0, 0, 320, 44);
        [cell.contentView addSubview:imgV];
    }
   
    [cell.contentView addSubview:textLbl];
          
    
    return cell;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}



//- (BOOL)textViewShouldBeginEditing:(UITextField *)textView{
//}
//- (BOOL)textViewShouldEndEditing:(UITextField *)textView;


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
    [mainInt release];
    [timeLbl release];
    [randomMain release];
    [writingLbl release];
    [blinkTimer release];
    [LblBgImg release];
    [TxtFldImg release];
    [isskip release];
    [isAdd release];
    [GoalTbl release];
	[goalArr release];
    [super dealloc];
}


@end
