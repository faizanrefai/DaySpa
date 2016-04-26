//
//  PersonalJournalViewController.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PersonalJournalViewController.h"
#import "THCalendarInfo.h"
#import "CheckmarkTile.h"



@implementation PersonalJournalViewController
@synthesize txtData,todaysDate,p,tile,saveBtn;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    TempTileCollection = [[NSMutableArray alloc] init];
     tile = [[KLTile alloc] init];
    [super viewDidLoad];
    txtData = [[NSString alloc] init];
	appDel = (DaySpaProjectAppDelegate *)[[UIApplication sharedApplication]delegate];
	isDeviceIpad = [appDel isIpad];
	
	obj=[DataManager sharedManager];
	int c =[obj getJournalCount];
	if(isDeviceIpad)
    {
		calendarView = [[[KLCalendarView alloc] initWithFrame:CGRectMake(0.0f, 90.0f, 320, 418) delegate:self] autorelease];
    }

	else
    {
		calendarView = [[[KLCalendarView alloc] initWithFrame:CGRectMake(0.0f, 55.0f, 320, 400) delegate:self] autorelease];
        self.navigationController.navigationBar.tintColor =[UIColor blackColor];
    }
    if(isDeviceIpad)
    {
        if (prevtile) {
        prevtile.backgroundColor = [UIColor clearColor];
        prevtile.backgroundColor = [UIColor whiteColor];
        [prevtile release];
        }
        
            [saveBtn setTitle:@"Save" forState:normal];
               //        gridVwObj = [[KLGridView alloc] init];
        //        
        //        NSInteger tileIndex = [gridVwObj._tiles indexOfObject:aTile];
        
        
        
        //        if (prevtile) {
        //            [prevtile flashEnd];
        //            [prevtile release];
        //        }
        
    }

	[self.view addSubview:calendarView];
	
	
	
	NSDate *t_date = [NSDate date];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"cccc dd-MM-yyyy"];
	NSString *todaysDay = [formatter stringFromDate:t_date];	
	dateLbl.text = [NSString stringWithFormat:@"%@ ",todaysDay];;
}


-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
    if (flag == TRUE) 
    {
        [obj checkAndCreateDatabase];
        
//        NSString *tmp;
//        
//        tmp = detailViewObj.detailTxt.text;
        
//        if (detailViewObj.k == 1) {
//            NSString *txtDate;
//            txtDate = [[NSString alloc] init];
//           txtDate = detailViewObj.dateStr;
//            
////            NSString *trimmedString = [txtDate stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
////            
////            int l;
////            l = [trimmedString length];
////            NSLog(@"%i",l);
//            
//            [obj addJournalEntry:detailViewObj.detailTxt.text:txtDate];
//
//        }
//        else
//        {
//            [obj updateText:detailViewObj.dateStr :tmp];
//        }
        
        if ([detailViewObj.detailTxt.text isEqualToString:[NSString stringWithFormat: @""]]) {
            [tile flashEnd];
        }
        else
        {
            [tile restoreBackgroundColor];
        }
        

    }
     
	//self.navigationController.navigationBar.tintColor = nil;
	
}


/*----- Calendar Delegates -----> */

-(void)getAllTiles : (KLTile *)crntTile
{
    TempTile = crntTile ;
    if (TempTileCollection) {
        [TempTileCollection addObject:TempTile];
    }
    else
    {
        TempTileCollection = [[NSMutableArray alloc] init];
        [TempTileCollection addObject:TempTile];
    }
}


- (void)calendarView:(KLCalendarView *)calendarView tappedTile:(KLTile *)aTile{

    
    if(isDeviceIpad)
    {
//        for (KLTile *Tl in TempTileCollection) {
//            Tl.backgroundColor = [UIColor clearColor];
//            Tl.backgroundColor = [UIColor whiteColor];
//        }
        
        
        if (prevtile) {
        prevtile.backgroundColor = [UIColor clearColor];
        prevtile.backgroundColor = [UIColor whiteColor];
        [prevtile release];
        }
        if (p == 1) {
            [saveBtn setTitle:@"Save" forState:normal];
        }
        else
        {
            [saveBtn setTitle:@"Edit" forState:normal];
        }

        
//        gridVwObj = [[KLGridView alloc] init];
//        
//        NSInteger tileIndex = [gridVwObj._tiles indexOfObject:aTile];
        
        
        
//        if (prevtile) {
//            [prevtile flashEnd];
//            [prevtile release];
//        }
        
   }
    
    
   prevtile = [[KLTile alloc] init];
    tile= aTile;
    
	NSString *temp = [NSString stringWithFormat:@"%@",[aTile date]];
    
	NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
	mmddccyy.timeStyle = NSDateFormatterNoStyle;
	mmddccyy.dateFormat = @"yyyy-MM-dd";
	NSDate *d = [mmddccyy dateFromString:temp];
	NSLog(@"date in formate : %@", d);
	
	
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"cccc dd-MM-yyyy"];
	NSString *todaysDay = [formatter stringFromDate:d];
		
	temp = [NSString stringWithFormat:@"%@ ",todaysDay];
	
	//aTile.backgroundColor = [UIColor yellowColor];
		
    [aTile flash];
    
	//[obj addJournalEntry];
    
	if(isDeviceIpad){
		dateLbl.text = temp;
        todaysDate = temp;
        
        NSString *tempText;
        tempText = [obj getCurrentText:temp];
        if([tempText isEqualToString:[NSString stringWithFormat: @""]])
        {
            p = 1;
        }
        else
        {
            p = 2;
        }
		detailTxt.text = tempText;
		
        
        if (p == 1) {
			[detailTxt becomeFirstResponder];
            [saveBtn setTitle:@"Save" forState:normal];
        }
        else
        {
            [saveBtn setTitle:@"Edit" forState:normal];
			detailTxt.editable =FALSE;
			isSave =FALSE;

        }

        
	}
	else {
//		if(detailViewObj)
//			[detailViewObj release];
		detailViewObj = [[DetailJournalView alloc]initWithNibName:@"DetailJournalView" bundle:nil];
        [detailViewObj getDate:temp];
//		detailViewObj.dateStr = temp;//(NSString*)[aTile date];
        flag = TRUE;
        dateLbl.text = temp;
		        
		[self.navigationController pushViewController:detailViewObj animated:YES];
		
	}
    prevtile = tile;
    
}

-(IBAction)save
{
    if (p==1) {
        [saveBtn setTitle:@"Save" forState:normal];
    }
    else
    {
		if(!isSave){
			detailTxt.editable =TRUE;
			[detailTxt becomeFirstResponder];
			[saveBtn setTitle:@"Save" forState:normal];
			isSave = FALSE;
			
		}
		else {
			isSave = TRUE;
			
		}

		
		
    }
    txtData = detailTxt.text;
    [obj checkAndCreateDatabase];
    if (p == 1) {
        [obj addJournalEntry:txtData :dateLbl.text];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Successfully saved data" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
		[detailTxt resignFirstResponder];
    }
    else
    {
		if(isSave){
			[obj updateText:dateLbl.text : txtData];
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Successfully edited data" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
			[alert show];
			[alert release];
			[detailTxt resignFirstResponder];
			//isSave = FALSE;
			
		}
		else {
			isSave = TRUE;
		}


    }
    
	
    
    
    
      //detailTxt.text = @""; 

}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    //KLTile *atile = [[KLTile alloc] init];
    
   // calendarView.backgroundColor = [UIColor whiteColor];
    txtData = detailTxt.text;
    if ([txtData isEqualToString:[NSString stringWithFormat: @""]]) {
        [tile flashEnd];
    }
    else
    {
        [tile restoreBackgroundColor];
    }
   
     prevtile = tile;

	return YES;
}

- (KLTile *)calendarView:(KLCalendarView *)calendarView createTileForDate:(KLDate *)date{
	CheckmarkTile *tilep = [[CheckmarkTile alloc] init];	
	return tilep;	
}

- (void)didChangeMonths{
	
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
//    [flag release];
//    [p release];
    [todaysDate release];
    [txtData  release];
    [super dealloc];
}


@end
