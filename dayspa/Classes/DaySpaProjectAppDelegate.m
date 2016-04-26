//
//  DaySpaProjectAppDelegate.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DaySpaProjectAppDelegate.h"
#import "TutorialViewController.h"
#import "RenewViewController.h"
#import "DataManager.h"


@implementation DaySpaProjectAppDelegate

@synthesize window,menu1Cnt,menu2Cnt,menu3Cnt,menu4Cnt,menu5Cnt,menu6Cnt,menu7Cnt,menu8Cnt,menu9Cnt,
menu10Cnt;



#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
//    menu1Cnt = 0;
//    menu2Cnt = 0;
//    menu3Cnt = 0;
//    menu4Cnt = 0;
//    menu5Cnt = 0;
//    menu6Cnt = 0;
//    menu7Cnt = 0;
//    menu8Cnt = 0;
//    menu9Cnt = 0;
//    menu10Cnt = 0;
//
 
	//[tabBar.navigationController setNavigationBarHidden:YES animated:NO];
	 //[tabBar.navigationController.navigationBar setHidden:TRUE];
	  
	isDeviceIpad = [self isIpad];
	//Database connection
	//Copy database to the user's phone if needed.	
	[self copyDatabaseIfNeeded];
	
	//set datanbase path
	DataManager *obj = [DataManager sharedManager]; 
	[obj setDatabasePath:[self getDBPath]];	
	
	
	followProgramBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	editgoalBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	membersBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	
	renewBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	tutorialBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	UILabel *txtLabel = nil;
	if(isDeviceIpad){
		entryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 768, 1024)];		
		
		followProgramBtn.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(28.0)];
		followProgramBtn.frame = CGRectMake(200.0, 60.0, 365, 100.0);
		
		editgoalBtn.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(28.0)];
		editgoalBtn.frame = CGRectMake(200.0, 175, 365, 100.0);
		
		membersBtn.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(28.0)];
		membersBtn.frame = CGRectMake(200,300,365.0,100.0);
		
		renewBtn.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(28.0)];
		renewBtn.frame = CGRectMake(200,420,365.0,100.0);
		
		tutorialBtn.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(28.0)];
		tutorialBtn.frame = CGRectMake(200,540,365.0,100.0);
		
		txtLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(180.0,900,400,50) ];
		txtLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(20.0)];
	}
	else {
		entryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
		
		followProgramBtn.frame = CGRectMake(80.0, 50.0, 165, 55.0);
		editgoalBtn.frame = CGRectMake(80.0, 115, 165, 55.0);
		membersBtn.frame = CGRectMake(80,180,165.0,55.0);
		renewBtn.frame = CGRectMake(80,245,165.0,55.0);
		tutorialBtn.frame = CGRectMake(80,315,165.0,55.0);
		
		txtLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(80.0,400,150,50) ];
		txtLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(14.0)];
	}
	
	[followProgramBtn setTitle: @"FOLLOW PROGRAM" forState: UIControlStateNormal];	
	[followProgramBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];	
	[entryView addSubview:followProgramBtn];		
	
	[editgoalBtn setTitle: @"EDIT GOALS" forState: UIControlStateNormal];	
	[editgoalBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];	
	[entryView addSubview:editgoalBtn];			
		
	[membersBtn setTitle: @"MEMBERS LOUNGE" forState: UIControlStateNormal];	
	[membersBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];	
	[entryView addSubview:membersBtn];	
	
	[tutorialBtn setTitle: @"View Tutorial" forState: UIControlStateNormal];	
	[tutorialBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];	
	[entryView addSubview:tutorialBtn];
	
	[renewBtn setTitle: @"Renew Now" forState: UIControlStateNormal];	
	[renewBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];	
	[entryView addSubview:renewBtn];
	
	txtLabel.lineBreakMode = UILineBreakModeWordWrap;
    txtLabel.numberOfLines = 0;
	txtLabel.textAlignment =  UITextAlignmentCenter;
	txtLabel.textColor = [UIColor whiteColor];
	txtLabel.backgroundColor = [UIColor blackColor];
	txtLabel.text = [NSString stringWithFormat: @"Your membership will expire in 368 days."];

	
	[entryView addSubview:txtLabel];
		[self.window addSubview:tabBar.view];
	//[self.window addSubview:entryView];	
    [self.window makeKeyAndVisible];
    

    return YES;
}

-(IBAction)onClick:(id)sender {	
	[entryView removeFromSuperview];
	[self.window addSubview:tabBar.view];
		
	if(sender == followProgramBtn){
		tabBar.selectedIndex = 0;
	}
	if(sender == editgoalBtn){
		tabBar.selectedIndex = 2;
	}
	if(sender == membersBtn){
		tabBar.selectedIndex = 0;
	}
	if(sender == renewBtn){
		tabBar.selectedIndex = 0;
		if(renewObj)
			[renewObj release];
		if(isDeviceIpad)
			renewObj =[[RenewViewController alloc]initWithNibName:@"RenewViewControlleriPad" bundle:nil];
		
		else
			renewObj =[[RenewViewController alloc]initWithNibName:@"RenewViewController" bundle:nil];
		[self.window addSubview:renewObj.view];
		
	}
	if(sender == tutorialBtn){	
		tabBar.selectedIndex = 0;
		if(tutorialObj)
			[tutorialObj release];
		if(isDeviceIpad)
			tutorialObj =[[TutorialViewController alloc]initWithNibName:@"TutorialViewControlleriPad" bundle:nil];

		else
			tutorialObj =[[TutorialViewController alloc]initWithNibName:@"TutorialViewController" bundle:nil];
		[self.window addSubview:tutorialObj.view];
		//[self presentModalViewController:tutorialObj animated:YES];
	}
}


- (BOOL)isIpad{
	UIDevice* thisDevice = [UIDevice currentDevice];
	if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
		return YES;
	}
	else {
		return NO;
	}
}





- (void) copyDatabaseIfNeeded {	
	//Using NSFileManager we can perform many file system operations.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSString *dbPath = [self getDBPath];
	BOOL success = [fileManager fileExistsAtPath:dbPath]; 	
	if(!success) {		
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Dayspa.sqlite"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
		if (!success) 
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
	}	
}

- (NSString *) getDBPath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	return [documentsDir stringByAppendingPathComponent:@"Dayspa.sqlite"];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[tabBar release];  
    [window release];	
    [super dealloc];
}


@end
