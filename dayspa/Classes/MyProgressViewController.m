//
//  MyProgressViewController.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyProgressViewController.h"


@implementation MyProgressViewController
@synthesize treatmentRm,playedBtn1,playedBtn2,playedBtn3,playedBtn4,playedBtn5,playedBtn6,playedBtn7,playedBtn8,playedBtn9,playedBtn10,rangeArray,progressReportTbl,reportCell,starCatDict,cellImgArray;
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization.
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc]init];
    [tempDict setObject:@"231" forKey:@"X"];
    [tempDict setObject:@"231" forKey:@"Y"];
    [tempDict setObject:@"231" forKey:@"Width"];
    [tempDict setObject:@"231" forKey:@"hight"];
    
        
	appDel = (DaySpaProjectAppDelegate *)[[UIApplication sharedApplication]delegate];
	isDeviceIpad = [appDel isIpad];
    if (!isDeviceIpad) {
        rangeArray = [[NSMutableArray alloc] init];
        [rangeArray addObject:playedBtn1];
        [rangeArray addObject:playedBtn2];
        [rangeArray addObject:playedBtn3];
        [rangeArray addObject:playedBtn4];
        [rangeArray addObject:playedBtn5];
        [rangeArray addObject:playedBtn6];
        [rangeArray addObject:playedBtn7];
        [rangeArray addObject:playedBtn8];
        [rangeArray addObject:playedBtn9];
        [rangeArray addObject:playedBtn10];

       // UIImageView *tableImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ProcessTblBg.png"]];
       // [treatmentTable setBackgroundView:tableImg];
        
//        NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:0];
//        [treatmentTable selectRowAtIndexPath:ip animated:NO scrollPosition: UITableViewScrollPositionNone];
        
        treatmentTable.rowHeight = 20.0;
        
        for (int i=0; i<[rangeArray count]; i++) {  
            UIButton *btn = [rangeArray objectAtIndex:i];
            // [btn setHidden:YES];
            [btn setImage:[UIImage imageNamed:@"unrated.png"] forState:UIControlStateNormal];
        }

        
    }
    
    UIImage *star1 = [UIImage imageNamed:@"star1.png"];
    UIImage *star2 = [UIImage imageNamed:@"star2.png"];
    UIImage *star3 = [UIImage imageNamed:@"star3.png"];
    UIImage *star4 = [UIImage imageNamed:@"star4.png"];
    UIImage *star5 = [UIImage imageNamed:@"star5.png"];
    UIImage *star6 = [UIImage imageNamed:@"star6.png"];
    UIImage *star7 = [UIImage imageNamed:@"star7.png"];
    UIImage *star8 = [UIImage imageNamed:@"star1.png"];
    UIImage *star9 = [UIImage imageNamed:@"star2.png"];
    UIImage *star10 = [UIImage imageNamed:@"star3.png"];
    
    UIImage *cell1 = [UIImage imageNamed:@"cell1.png"];
    UIImage *cell2 = [UIImage imageNamed:@"cell2.png"];
    UIImage *cell3 = [UIImage imageNamed:@"cell3.png"];
    UIImage *cell4 = [UIImage imageNamed:@"cell4.png"];
    UIImage *cell5 = [UIImage imageNamed:@"cell5.png"];
    UIImage *cell6 = [UIImage imageNamed:@"cell6.png"];
    UIImage *cell7 = [UIImage imageNamed:@"cell7.png"];
    UIImage *cell8 = [UIImage imageNamed:@"cell1.png"];
    UIImage *cell9 = [UIImage imageNamed:@"cell2.png"];
    UIImage *cell10 = [UIImage imageNamed:@"cell3.png"];
    
    cellImgArray = [[NSMutableArray alloc] initWithObjects:cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9,cell10, nil];
        
    starCatDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:star1,@"The Wisdom Within",star2,@"Creativity & Inspiration",star3,@"Wealth & Abundance",star4,@"Health & Healing",star5,@"Love & Relationships",star6,@"Harmony & Balance",star7,@"High Performance",star8,@"Personal Power",star9,@"Spiritual Connection",star10,@"Your Life’s Purpose",nil];
    
	myDetails.hidden =YES;
	myProgress.hidden = NO;
	NSArray *tempArr = [NSArray arrayWithObjects: @"The Wisdom Within",@"Creativity & Inspiration",
						@"Wealth & Abundance",@"Health & Healing",@"Love & Relationships",@"Harmony & Balance",
						@"High Performance",@"Personal Power",@"Spiritual Connection",@"Your Life’s Purpose",nil];
	treatmentList = [[NSArray arrayWithArray:tempArr] retain];
	
	//treatmentTable.backgroundView = nil;
	treatmentTable.backgroundColor = [UIColor clearColor];
	
	resultLbl.lineBreakMode = UILineBreakModeWordWrap;
   	resultLbl.numberOfLines = 0;
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"The Wisdom Within"] == NULL) {
        resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:0]];
    }
    else
    {
        resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:0], [[NSUserDefaults standardUserDefaults] objectForKey:@"The Wisdom Within"]];
    }
    
    
    [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"The Wisdom Within"]:@"The Wisdom Within"];
	
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];

    NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:0];
    [treatmentTable selectRowAtIndexPath:ip animated:NO scrollPosition:UITableViewScrollPositionNone];
    
   [self catSelected:ip];
    
  //  [treatmentTable reloadData];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}


-(IBAction)ChooseFromTop:(id)sender {		
	if(segmentCntroller.selectedSegmentIndex==0){
		myDetails.hidden =YES;
		myProgress.hidden = NO;
	}
	else {
		myProgress.hidden = YES;
		myDetails.hidden =NO;
		
	}

}
	
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [treatmentList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

	if(isDeviceIpad)
		return 80;
	else 
		return 60;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
       
    }
    if(isDeviceIpad)
    {
		cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
        
	}
	else
		cell.textLabel.font = [UIFont fontWithName:@"Zapfino" size:11];
    
    // Configure the cell...
    
    if (tableView == treatmentTable) {
        
        //UIImageView *CellImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellProcessBg.png"]];
//        cell.backgroundView = CellImg;
        
        
        UIImageView *cellImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_line_img.png"]];
		[cell.contentView addSubview:cellImg];
		cellImg.frame = CGRectMake(0, 58, 320, 2);
        //cell.selectedBackgroundView = selectedCellImg;
    }
    
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    
	//cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [treatmentList objectAtIndex:indexPath.row];
   //[self catSelected:indexPath];
    if(isDeviceIpad){    
    if (tableView == progressReportTbl) {
        
            [[NSBundle mainBundle] loadNibNamed:@"ProgressCell" owner:self options:nil];
            cell = reportCell;
            reportCell = nil;
              // cell.textLabel.text = [PhoneBookArray objectAtIndex:indexPath.row];
       // [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.backgroundColor = [UIColor clearColor];
//UIButton *btn1;
      //  btn1 = playedBtn1;
		[self catSelected:indexPath];

        
        playedBtn1 = (UIButton *)[cell.contentView viewWithTag:1];
        playedBtn2 = (UIButton *)[cell.contentView viewWithTag:2];
        playedBtn3 = (UIButton *)[cell.contentView viewWithTag:3];
        playedBtn4 = (UIButton *)[cell.contentView viewWithTag:4];
        playedBtn5 = (UIButton *)[cell.contentView viewWithTag:5];
        playedBtn6 = (UIButton *)[cell.contentView viewWithTag:6];
        playedBtn7 = (UIButton *)[cell.contentView viewWithTag:7];
        playedBtn8 = (UIButton *)[cell.contentView viewWithTag:8];
        playedBtn9 = (UIButton *)[cell.contentView viewWithTag:9];
        playedBtn10 = (UIButton *)[cell.contentView viewWithTag:10];
        
        rangeArray = [[NSMutableArray alloc] init];
        [rangeArray addObject:playedBtn1];
        [rangeArray addObject:playedBtn2];
        [rangeArray addObject:playedBtn3];
        [rangeArray addObject:playedBtn4];
        [rangeArray addObject:playedBtn5];
        [rangeArray addObject:playedBtn6];
        [rangeArray addObject:playedBtn7];
        [rangeArray addObject:playedBtn8];
        [rangeArray addObject:playedBtn9];
        [rangeArray addObject:playedBtn10];

        
        
           }
	
		//        
//        nameLbl.text = [contactArray objectAtIndex:indexPath.row];
//        
//        [lblBtn addTarget:self action:@selector(lblBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [lblBtn setTag:indexPath.row];
//        [dltBtn addTarget:self action:@selector(dltBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [dltBtn setTag:indexPath.row];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	    if (tableView == treatmentTable) {
			

        [self catSelected:indexPath];
    }
}

-(void)catSelected:(NSIndexPath *)ind
{
    for (int i=0; i<[rangeArray count]; i++) {  
        UIButton *btn = [rangeArray objectAtIndex:i];
        //  [btn setHidden:YES];
        [btn setImage:[UIImage imageNamed:@"unrated.png"] forState:UIControlStateNormal];
    }
    
    
    
    if (ind.row == 0) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"The Wisdom Within"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:0]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:0], [[NSUserDefaults standardUserDefaults] objectForKey:@"The Wisdom Within"]];
        }
        
        
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"The Wisdom Within"]:@"The Wisdom Within"];
        
    }
    if (ind.row == 1) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Creativity & Inspiration"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:1]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:1],  [[NSUserDefaults standardUserDefaults] objectForKey:@"Creativity & Inspiration"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"Creativity & Inspiration"]:@"Creativity & Inspiration"];
    }
    if (ind.row == 2) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Wealth & Abundance"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:2]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:2],[[NSUserDefaults standardUserDefaults] objectForKey:@"Wealth & Abundance"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"Wealth & Abundance"]:@"Wealth & Abundance"];
    }
	if (ind.row == 3) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Health & Healing"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:3]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:3], [[NSUserDefaults standardUserDefaults] objectForKey:@"Health & Healing"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"Health & Healing"]:@"Health & Healing"];
    }
    if (ind.row == 4) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Love & Relationships"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:4]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:4],[[NSUserDefaults standardUserDefaults] objectForKey:@"Love & Relationships"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"Love & Relationships"]:@"Love & Relationships"];
    }
    if (ind.row == 5) {
        if ( [[NSUserDefaults standardUserDefaults] objectForKey:@"Harmony & Balance"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:5]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:5], [[NSUserDefaults standardUserDefaults] objectForKey:@"Harmony & Balance"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"Harmony & Balance"]:@"Harmony & Balance"];
    }
    if (ind.row == 6) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"High Performance"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:6]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:6], [[NSUserDefaults standardUserDefaults] objectForKey:@"High Performance"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"High Performance"]:@"High Performance"];
    }
    if (ind.row == 7) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Personal Power"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:7]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:7], [[NSUserDefaults standardUserDefaults] objectForKey:@"Personal Power"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"Personal Power"]:@"Personal Power"];
    }
    if (ind.row == 8) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Spiritual Connection"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:8]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:8], [[NSUserDefaults standardUserDefaults] objectForKey:@"Spiritual Connection"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"Spiritual Connection"]:@"Spiritual Connection"];
    }
    if (ind.row == 9) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Your Life’s Purpose"] == NULL) {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done 0 times",[treatmentList objectAtIndex:9]];
        }
        else
        {
            resultLbl.text = [NSString stringWithFormat:@"%@ have done %@ times",[treatmentList objectAtIndex:9], [[NSUserDefaults standardUserDefaults] objectForKey:@"Your Life’s Purpose"]];
        }
        [self playCount:[[NSUserDefaults standardUserDefaults] objectForKey:@"Your Life’s Purpose"]:@"Your Life’s Purpose"];
    }
	
}

-(void)playCount:(NSString *)str:catString
{
    
    int cnt= [str intValue];
    for (int p=0; p<cnt; p++) {  
        UIButton *btn = [rangeArray objectAtIndex:p];
       // [btn setHidden:NO];
        [btn setImage:[starCatDict objectForKey:catString] forState:UIControlStateNormal];
    }
                   
}

-(IBAction)onRenew:(id)sender{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Subscription renewed"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
	if(isDeviceIpad)
		return;
	int movementDistance = 0;
	if(textField ==fnmtxt || textField ==lnmtxt)
    {
        
    }
	if(textField ==emailtxt)		
		movementDistance = 50;
	if(textField ==pwrdtxt)		
		movementDistance = 100;
	if(textField ==cpswrdtxt)		
		movementDistance = 150;
	if(textField ==cntrytxt)		
		movementDistance = 180;
	if(movementDistance < 0)
		movementDistance = 0;
	float movementDuration = 0.3f; 
	int movement = (up ? -movementDistance : movementDistance);	
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    myDetails.frame = CGRectOffset(myDetails.frame, 0, movement);
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
//    [progressReportTbl release];
//    [reportCell release];
//    [rangeArray release];
//    [playedBtn1 release];
//    [playedBtn2 release];
//    [playedBtn3 release];
//    [playedBtn4 release];
//    [playedBtn5 release];
//    [playedBtn6 release];
//    [playedBtn7 release];
//    [playedBtn8 release];
//    [playedBtn9 release];
//    [playedBtn10 release];
    [super dealloc];
}


@end
