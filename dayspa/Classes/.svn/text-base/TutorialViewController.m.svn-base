//
//  TutorialViewController.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TutorialViewController.h"


@implementation TutorialViewController

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
    [super viewDidLoad];
	appDel = (DaySpaProjectAppDelegate *)[[UIApplication sharedApplication]delegate];
	isDeviceIpad = [appDel isIpad];
	NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"sample_iTunes.mov" ofType:nil];
	NSURL *url = [NSURL fileURLWithPath:urlStr];
	moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
	[self.view  addSubview:moviePlayer.view];
	if(isDeviceIpad)	
		moviePlayer.view.frame = CGRectMake(30, 50, 700, 700);  		
	else	
		moviePlayer.view.frame = CGRectMake(30, 50, 250, 200);  
	[moviePlayer play];
	
}
-(IBAction)onUserGuid:(id)sender{	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Get guide from here"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
}

-(IBAction)onColse:(id)sender{
	[moviePlayer stop];
	[moviePlayer release];
	[self.view removeFromSuperview];
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
