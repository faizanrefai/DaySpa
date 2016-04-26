//
//  DataManager.h
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
//#import "DaySpaProjectAppDelegate.h"
#import "share.h"
#import "PersonalJournalViewController.h"


@class PersonalJournalViewController;
@interface DataManager : UIViewController {	
	NSString *dbStr;
	//DaySpaProjectAppDelegate *obj_AppDelegate;
    PersonalJournalViewController *personaljournalVwController;
    NSString *journalEntries;
    NSString *databaseName;
    NSString *txtString;
    int getId;
    
}
	

@property (nonatomic) int getId;
@property (nonatomic, retain) NSString *databaseName;
@property (nonatomic,retain) NSString *dbStr;
@property (nonatomic, retain)NSString *journalEntries;	
@property (nonatomic, retain)NSString *txtString;

//Static methods.
+ (void) finalizeStatements;
+ (id) sharedManager;


//----for journals----
-(int)getJournalCount;
-(void) checkAndCreateDatabase;
-(void)addJournalEntry : data : date;
- (void)setDatabasePath:(NSString*)dbPath;
-(NSString *)getCurrentText : (NSString *)date;
-(void) updateText :(NSString *)date :(NSString *)textData;
-(void)addGoalEntry :(NSString *)cat: (NSString *)desc:(NSString *)status:(NSString *)priority:(NSString *)Due:(NSData *)imgData;
-(NSMutableArray *)getCurrentGoalDetail:(NSString *)cat;
-(void)delData:(int)id;
-(void)updateGoalEntry :(NSString *)cat: (NSString *)desc:(NSString *)status:(NSString *)priority:(NSString *)Due:(NSData *)imgData : (int)GoalId;
-(void)delAll;

@end
