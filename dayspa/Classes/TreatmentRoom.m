//
//  TreatmentRoom.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TreatmentRoom.h"
#import "AlertHandler.h"

@implementation TreatmentRoom
@synthesize inappBtn,c,RawCnt,ReprogramSegment,VisualizationSegment,DurationSegment,audioPlayer,soundArray,soundVl,prevstr,Repcnt,viscnt,playcnt,downloadCnt;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [super viewDidLoad];
    downloadCheck = 0;
    playcnt =0;
    Repcnt = 1;
    viscnt =1;
    soundVl = 1;
    prevstr=[[NSString alloc] init];
    soundArray = [[NSMutableArray alloc] init];
    c = 0;
    RawCnt = 1;
    //myprogreeVwObj = [[MyProgressViewController alloc] initWithNibName:@"MyProgressViewController" bundle:nil :self];
    
    	appDel = (DaySpaProjectAppDelegate *)[[UIApplication sharedApplication]delegate];
	isDeviceIpad = [appDel isIpad];
	
	
	NSArray *tempArr = [NSArray arrayWithObjects: @"The Wisdom Within",@"Creativity & Inspiration",
						@"Wealth & Abundance",@"Health & Healing",@"Love & Relationships",@"Harmony & Balance",
						@"High Performance",@"Personal Power",@"Spiritual Connection",@"Your Life’s Purpose",nil];
	
	menuList = [[NSArray arrayWithArray:tempArr] retain];
	menuTable.backgroundColor = [UIColor clearColor];
	//menuTable.backgroundView = nil;
	detailView.backgroundColor = [UIColor clearColor];
	detailLbl.text = [menuList objectAtIndex:0];
	NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:0];
	[menuTable selectRowAtIndexPath:ip animated:NO scrollPosition: UITableViewScrollPositionNone];
	inappBtn.imageView.image =[UIImage imageNamed:@"PlayBtn.png"];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:NO];

}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return [menuList count];
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
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    UIImageView *CellImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_line_img.png"]];
    [cell.contentView addSubview:CellImg];
	CellImg.frame = CGRectMake(0, 58, 320, 2);
	if(isDeviceIpad){
		cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
	}
	else
		cell.textLabel.font = [UIFont fontWithName:@"Zapfino" size:11];
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    
    
    if(indexPath.row == [menuList count])
		 cell.textLabel.text = @"Your Life's Purpose";
	else
		cell.textLabel.text = [menuList objectAtIndex:indexPath.row];
	cell.backgroundColor = [UIColor clearColor];
   // UIImageView *cellBgImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CatSelImg.png"]];
//    cellBgImg.frame =cell.frame;
//    cell.selectedBackgroundView = cellBgImg;
   
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	detailLbl.text = [menuList objectAtIndex:indexPath.row];
    
    [audioPlayer stop];
    if (![audioPlayer isPlaying]) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"player is stopped" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//        [alert release];
    }
    
    downloadCheck = 0;
    playcnt = 0;
    downloadCnt = 0;
    [inappBtn setImage:[UIImage imageNamed:@"PlayBtn.png"] forState:normal];
    [inappBtn setTitle:@"PLAY" forState:normal];
    [DurationSegment setEnabled:YES];
    [ReprogramSegment setEnabled:YES];
    [VisualizationSegment setEnabled:YES];
	
    RawCnt = indexPath.row + 1;
    NSLog(@"%i",indexPath.row + 1);
    //[audioPlayer stop];
}

-(IBAction) inappBtnClick:(id)sender{
    NSLog(@"%@",inappBtn.titleLabel.text);
    if ([inappBtn.titleLabel.text isEqualToString:@"PLAY"]) 
    {
        [inappBtn setImage:[UIImage imageNamed:@"stop.png"] forState:normal];
        [inappBtn setTitle:@"STOP" forState:normal];
    
        [DurationSegment setEnabled:NO];
        [ReprogramSegment setEnabled:NO];
        [VisualizationSegment setEnabled:NO];
        
        
    if (RawCnt == 1) {
        [soundArray removeAllObjects];
         appDel.menu1Cnt++;
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu1Cnt] forKey:@"The Wisdom Within"];
    
           
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"The Wisdom Within"]];
        
        [self PlayAudio:url];
        
        NSString *str;
        
         str = [self getRandomNumber];
                
        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
           // NSString *string2 = @"induction_two_long.mp3";
            [soundArray addObject:string2];
            [self CheckDownload:string2];
            
         
        }
        else
        {
            
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
          
            [soundArray addObject:string2];
            [self CheckDownload:string2];
             
        }
        
               
        str = [self getRandomNumber];
        
             if (DurationSegment.selectedSegmentIndex == 0) {
            
            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
                 [self CheckDownload:string3];
                 
        }
        else
        {
            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        
            
        if (ReprogramSegment.selectedSegmentIndex == 0) {
            NSString *string4 = [NSString stringWithFormat:@"The Wisdom Within_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
        }
        
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"The Wisdom Within_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];
        }
        
    }
    if (RawCnt == 2) {
        [soundArray removeAllObjects];
        appDel.menu2Cnt++;
       [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu2Cnt] forKey:@"Creativity & Inspiration"];
        
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"Creativity & Inspiration"]];
        
        
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];
        
      
        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
        }
        
        str = [self getRandomNumber];
       
        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        
              
        if (ReprogramSegment.selectedSegmentIndex == 0) {
            NSString *string4 = [NSString stringWithFormat:@"Creativity & Inspiration_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];

        }
        
         if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
        NSString *string5 = [NSString stringWithFormat:@"Creativity & Inspiration_vis.mp3"];
        [soundArray addObject:string5];
            [self CheckDownload:string5];
        }
         
        NSLog(@"2nd Manu clicked : %i times",appDel.menu2Cnt);
    }
    if (RawCnt == 3) {
        [soundArray removeAllObjects];
        appDel.menu3Cnt++;
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu3Cnt] forKey:@"Wealth & Abundance"];
        
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"Wealth & Abundance"]];
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];
        
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
        }
        
        str = [self getRandomNumber];

        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        
        if (ReprogramSegment.selectedSegmentIndex == 0) {
            
            NSString *string4 = [NSString stringWithFormat:@"Wealth & Abundance_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
            
        }
        
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"Wealth & Abundance_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];

        }
        
        NSLog(@"3rd Manu clicked :%i times",appDel.menu3Cnt);
    }
    if (RawCnt == 4) {
        [soundArray removeAllObjects];
        appDel.menu4Cnt++;
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu4Cnt] forKey:@"Health & Healing"];
        
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"Health & Healing"]];
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];
        
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];

        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];

        }
        
        str = [self getRandomNumber];
 
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {
            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        
            
        if (ReprogramSegment.selectedSegmentIndex == 0) {
            
            NSString *string4 = [NSString stringWithFormat:@"Health & Healing_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
            
        }
        
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"Health & Healing_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];
        }
        
        NSLog(@"4th Manu clicked :%i times",appDel.menu4Cnt);
    }
    if (RawCnt == 5) {
        [soundArray removeAllObjects];
        appDel.menu5Cnt++;
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu5Cnt] forKey:@"Love & Relationships"];
        
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"Love & Relationships"]];
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];
        
       
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
            
        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];

        }
        
      
        
        str = [self getRandomNumber];
       
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        
        if (ReprogramSegment.selectedSegmentIndex == 0) {
            
            NSString *string4 = [NSString stringWithFormat:@"Love & Relationships_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
            
        }
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"Love & Relationships_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];
        }
        
        
        NSLog(@"5th Manu clicked :%i times",appDel.menu5Cnt);
    }
    if (RawCnt == 6) {
        [soundArray removeAllObjects];
       appDel.menu6Cnt++;
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu6Cnt] forKey:@"Harmony & Balance"];
        
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"Harmony & Balance"]];
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];

        
       
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];

        }
        
        
        
        str = [self getRandomNumber];
    
        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }

        if (ReprogramSegment.selectedSegmentIndex == 0) {
            
            NSString *string4 = [NSString stringWithFormat:@"Harmony & Balance_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
            
        }
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"Harmony & Balance_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];
        }

        
        
        NSLog(@"6th Manu clicked :%i times",appDel.menu6Cnt);
    }
    if (RawCnt == 7) {
        [soundArray removeAllObjects];
        appDel.menu7Cnt++;
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu7Cnt] forKey:@"High Performance"];
        
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"High Performance"]];
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];
        
       
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
            
        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];

        }
        
        str = [self getRandomNumber];
        
        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }

        if (ReprogramSegment.selectedSegmentIndex == 0) {
            
            NSString *string4 = [NSString stringWithFormat:@"High Performance_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
            
        }
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"High Performance_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];
        }
        
        NSLog(@"7th Manu clicked :%i times",appDel.menu7Cnt);
    }
    if (RawCnt == 8) {
        [soundArray removeAllObjects];
        appDel.menu8Cnt++;
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu8Cnt] forKey:@"Personal Power"];
        
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"Personal Power"]];
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];
        
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
            
        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
        }
        
        str = [self getRandomNumber];
        
        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {
            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        
        if (ReprogramSegment.selectedSegmentIndex == 0) {
            
            NSString *string4 = [NSString stringWithFormat:@"Personal Power_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
            
        }
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"Personal Power_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];
        }

        NSLog(@"8th Manu clicked :%i times",appDel.menu8Cnt);
    }
    if (RawCnt == 9) {
        [soundArray removeAllObjects];
        appDel.menu9Cnt++;
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu9Cnt] forKey:@"Spiritual Connection"];
        
        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"Spiritual Connection"]];
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];
        
       
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
            
        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];

        }
        
 str = [self getRandomNumber];
        
        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {
            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }

        if (ReprogramSegment.selectedSegmentIndex == 0) {
            
            NSString *string4 = [NSString stringWithFormat:@"Spiritual Connection_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
            
        }
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"Spiritual Connection_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];
        }

        NSLog(@"9th Manu clicked :%i times",appDel.menu9Cnt);
    }
    if (RawCnt == 10) {
        [soundArray removeAllObjects];
        appDel.menu10Cnt++;
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i",appDel.menu10Cnt] forKey:@"Your Life’s Purpose"];

        NSURL *url = nil;
        url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@_intro.mp3", [[NSBundle mainBundle] resourcePath],@"Your Life’s Purpose"]];
        [self PlayAudio:url];
        
        NSString *str;
        str = [self getRandomNumber];
        
       
        if (DurationSegment.selectedSegmentIndex == 0) {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_long.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
        }
        else
        {
            NSString *string2 = [NSString stringWithFormat:@"induction_%@_short.mp3",str];
            [soundArray addObject:string2];
            [self CheckDownload:string2];
        }
        
        str = [self getRandomNumber];
    
        if (DurationSegment.selectedSegmentIndex == 0) {

            NSString *string3 = [NSString stringWithFormat:@"revive_%@_long.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        else
        {
            NSString *string3 = [NSString stringWithFormat:@"revive_%@_short.mp3",str];
            [soundArray addObject:string3];
            [self CheckDownload:string3];
        }
        
        if (ReprogramSegment.selectedSegmentIndex == 0) {
            
            NSString *string4 = [NSString stringWithFormat:@"Your Life’s Purpose_repro.mp3"];
            [soundArray addObject:string4];
            [self CheckDownload:string4];
            
        }
        if (VisualizationSegment.selectedSegmentIndex == 0) 
        {
            NSString *string5 = [NSString stringWithFormat:@"Your Life’s Purpose_vis.mp3"];
            [soundArray addObject:string5];
            [self CheckDownload:string5];
        }

        NSLog(@"10th Manu clicked :%i times",appDel.menu10Cnt);
    }
        
    }    
    else
    {
        [audioPlayer stop];
        [inappBtn setTitle:@"PLAY" forState:normal];
        [inappBtn setImage:[UIImage imageNamed:@"PlayBtn.png"] forState:normal];
        
        [DurationSegment setEnabled:YES];
        [ReprogramSegment setEnabled:YES];
        [VisualizationSegment setEnabled:YES];

    }

}

-(NSString *)getRandomNumber
{
    int randomNumber1;
    
    randomNumber1 = random() % 2;
    
    randomNumber1 =  randomNumber1 + 1 ;
    
    NSLog(@"%i",randomNumber1);

    NSString *digitStr;
    if (randomNumber1 == 1) {
        digitStr = @"one";
    }
    if (randomNumber1 == 2) {
        digitStr = @"two";
    }
    if (randomNumber1 == 3) {
        digitStr = @"three";
    }

    return digitStr;
}

-(void)CheckDownload : (NSString *)str
{
    if(downloadCnt<[soundArray count])
    {
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString* foofile = [documentsPath stringByAppendingPathComponent:str];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:foofile];
    
//    NSURL *url1 = [NSURL URLWithString:
//                   [foofile stringByAddingPercentEscapesUsingEncoding:
//                    NSASCIIStringEncoding]];

    NSURL *url1 = [NSURL fileURLWithPath:foofile];
    if (fileExists) {
        if (![audioPlayer isPlaying]) {
            NSError *error;
            
            audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:&error];
            audioPlayer.delegate =self;
            //  audioPlayer.numberOfLoops = -1;
            NSLog(@"ready to play %@",url1);
            if (audioPlayer == nil)
            {
                NSLog(@"%@",[error description]);
            }
            else
            {
                
                [audioPlayer play];
                NSLog(@"audio is playing");
//                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Audio played" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alert show];
//                [alert release];
                
            }
        }
        //downloadCnt++;
    }
    else
        [self btnclick:str];
    }
}

- (NSString *) getAudioPath :(NSString *)fstr{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    //NSLog(@"%@",[paths objectAtIndex:0]);
    NSString *documentsDir = [paths objectAtIndex:0];
    //NSLog(@"%@",[documentsDir stringByAppendingPathComponent:@"LikeMeFit.sqlite"]);
    return [documentsDir stringByAppendingPathComponent:fstr];    
}

-(void)connection:(NSURLConnection* )connection didReceiveResponse:(NSURLResponse* )response {
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection* )connection didReceiveData:(NSData *)data {
    [webData appendData:data];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
   // [AlertHandler hideAlert];
    UIAlertView  *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error while setting connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
    [errorAlert release];
    NSLog(@"ERROR with theConenction");   
    
    [connection release];
    [webData release];
    
    
    
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
   // [AlertHandler hideAlert];
    //    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    //    
    //    NSLog(@"%@",theXML);    
    
    
    // Do the write

    NSString *filePath = [self getAudioPath:[NSString stringWithFormat:@"%@",[soundArray objectAtIndex:playcnt]]];
    [webData writeToFile:filePath atomically:YES];
    NSLog(@"written in file");
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // NSError *error;
    NSString *dbPath = [self getAudioPath:[NSString stringWithFormat:@"%@",[soundArray objectAtIndex:playcnt]]];
    BOOL success = [fileManager fileExistsAtPath:dbPath]; 
    NSLog(@"path got successfully");
    
    // NSString *appSettingsPath = [NSDocumentDirectory stringByAppendingPathComponent:FileNamePath];
    //NSURL *url1 = [NSURL URLWithString:
//                   [dbPath stringByAddingPercentEscapesUsingEncoding:
//                    NSASCIIStringEncoding]];
    
    NSURL *url1 = [NSURL fileURLWithPath:dbPath];
    
  // [soundArray addObject:url1];
    
    NSLog(@"url added");  
     
    if (![audioPlayer isPlaying]) {
    NSError *error;
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:&error];
		audioPlayer.delegate =self;
  //  audioPlayer.numberOfLoops = -1;
    NSLog(@"ready to play %@",url1);
    if (audioPlayer == nil)
    {
        NSLog(@"%@",[error description]);
    }
    else
    {
        
            [audioPlayer play];
        playcnt++;
            NSLog(@"audio is playing");
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Audio played" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alert show];
//            [alert release];
                
    }
    [connection release];
    UIAlertView * myAlert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Download completed successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [myAlert show];
    
    }
    
    downloadCnt++;
	if(downloadCnt<[soundArray count])
    [self CheckDownload:[soundArray objectAtIndex:downloadCnt]];
   // [self btnclick:[soundArray objectAtIndex:downloadCnt]];
     
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
   
//	
//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:[NSString stringWithFormat:@"%d file finished",playcnt] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];
//    [alert release];
    
   // [self btnclick:[soundArray objectAtIndex:playcnt]];
   
	if (playcnt >= [soundArray count]) {
        [inappBtn setTitle:@"PLAY" forState:normal];
        [inappBtn setImage:[UIImage imageNamed:@"PlayBtn.png"] forState:normal];
		return;
	}
	NSFileManager *fileManager = [NSFileManager defaultManager];
    // NSError *error;
    NSString *dbPath = [self getAudioPath:[NSString stringWithFormat:@"%@",[soundArray objectAtIndex:playcnt]]];
    BOOL success = [fileManager fileExistsAtPath:dbPath]; 
    NSLog(@"path got successfully");
    
    // NSString *appSettingsPath = [NSDocumentDirectory stringByAppendingPathComponent:FileNamePath];
    //NSURL *url1 = [NSURL URLWithString:
//                   [dbPath stringByAddingPercentEscapesUsingEncoding:
//                    NSASCIIStringEncoding]];
	
    NSURL *url1 = [NSURL fileURLWithPath:dbPath];
    if (success) {
        NSError *error;
    
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:&error];
		audioPlayer.delegate = self;
       // audioPlayer.numberOfLoops = -1;
        NSLog(@"ready to play %@",url1);
        if (audioPlayer == nil)
        {
            NSLog(@"%@",[error description]);
        }
        else
        {
            
            [audioPlayer play];
			playcnt++;
            NSLog(@"audio is playing");
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Audio played" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alert show];
//            [alert release];
            
        }

    }
    else
    {
        if (downloadCheck == 1) {
               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"File Download is running" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        }
        else
        {
            downloadCnt++;
            if(downloadCnt<[soundArray count])
                [self btnclick:[soundArray objectAtIndex:downloadCnt]];
        }
        
    }
     
}


-(void)btnclick:(NSString *)str
{
    downloadCnt++;
	downloadCheck = 1;
   // [AlertHandler showAlertForProcess];
    NSString *temp_str = [NSString stringWithFormat:@"http://media.dayspaforthemind.com/audio/%@",str];
    NSURL *url = [NSURL URLWithString: [temp_str stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    
    [req setHTTPMethod:@"POST"];
    
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (conn) {
        webData = [[NSMutableData data] retain];
    }        
    
}

-(void)PlayAudio : (NSURL *)url
{
    NSError *error;
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.delegate = self;
    //audioPlayer.numberOfLoops = -1;
    
    if (audioPlayer == nil)
    {
        NSLog(@"%@",[error description]);
    }
    else
    {
        [audioPlayer play];
       // playcnt++;
        NSLog(@"%@",[NSString stringWithFormat:@"%f", audioPlayer.duration]);
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"1st Audio played"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//        [alert release];
    } 

}

-(void)PlayAllAudio : (NSString *)str : (int)val
{
    
    NSLog(@"%@",soundArray);
    
    prevstr = str;
    

        NSError *error;
    NSLog(@"%@",[soundArray objectAtIndex:val-1]);
            audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[soundArray objectAtIndex:val-1] error:&error];
    audioPlayer.delegate = self;
        //audioPlayer.numberOfLoops = -1;
        
        if (audioPlayer == nil)
        {
            NSLog(@"%@",[error description]);
        }
        else
        {
            [audioPlayer play];
            playcnt++;
            NSLog(@"%@",[NSString stringWithFormat:@"%f", audioPlayer.duration]);


        }    
  
}

-(void)ChooseAudio:(NSString *)tempstr:(int) val
{
    
}

-(void)VisualOfAudio:(NSString *)tempstr
{
    if (![audioPlayer isPlaying]) {

        [self PlayAudio:tempstr : 3];
    }
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
    [soundArray release];
    [DurationSegment release];
    [ReprogramSegment release];
    [VisualizationSegment release];
   // [inappBtn release];
    [super dealloc];
}


@end
