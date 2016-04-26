    //
//  DataManager.m
//  DaySpaProject
//
//  Created by OPENXCELL TECHNOLABS on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"

static DataManager *sharedMyManager = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *deleteStmt = nil;
static sqlite3_stmt *addStmt = nil;
static sqlite3_stmt *detailStmt = nil;
static sqlite3_stmt *updateStmt = nil;
static sqlite3_stmt *addgoalstmt = nil;

@implementation DataManager

@synthesize dbStr,journalEntries,databaseName,txtString,getId;

+ (id)sharedManager {
    @synchronized(self) {
        if(sharedMyManager == nil)
            sharedMyManager = [[super allocWithZone:NULL] init];
    }
    return sharedMyManager;
}

+ (void) finalizeStatements {	
    if (addgoalstmt) {
        sqlite3_finalize(addgoalstmt);
    }
	if (database) sqlite3_close(database);
	if (deleteStmt) sqlite3_finalize(deleteStmt);
	if (addStmt) sqlite3_finalize(addStmt);
	if (detailStmt) sqlite3_finalize(detailStmt);
	if (updateStmt) sqlite3_finalize(updateStmt);
}

- (void)setDatabasePath:(NSString*)dbPath {
	self.dbStr = dbPath;
    databaseName = @"Dayspa.sql";
}

-(int)getJournalCount{

	int cnt=0;		
	if (sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK){
		NSString *selectSql = @"select count(*) from journal_table";
        NSString *selectstmt = @"";
		if (sqlite3_prepare_v2(database, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1, &selectstmt, NULL) == SQLITE_OK) {
			while (sqlite3_step(selectstmt) == SQLITE_ROW) {
				cnt = sqlite3_column_int(selectstmt, 0);
			}
		}
		sqlite3_reset(selectstmt);
	}
	else
		sqlite3_close(database);	
	return cnt;
}

-(void)delAll
{
    //delete from My_Goal
    sqlite3 *database;
    
    if(sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK) {
        
        NSString *sqlQuery=[NSString stringWithFormat:@"delete from My_Goal"];	
        NSLog(@"query:%@",sqlQuery);
        
        sqlite3_stmt *compiledStatement;
        compiledStatement=nil;
        
        if(sqlite3_prepare_v2(database, [sqlQuery UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            sqlite3_step(compiledStatement);
        }
        sqlite3_finalize(compiledStatement);
        
    }
    sqlite3_close(database);
}

-(void)delData:(int)Goal_id
    {
       
        sqlite3 *database;
       
        if(sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK) {
            
            NSString *sqlQuery=[NSString stringWithFormat:@"delete from My_Goal where Goal_id='%d'",Goal_id];	
            NSLog(@"query:%@",sqlQuery);
            
            sqlite3_stmt *compiledStatement;
            compiledStatement=nil;
            
            if(sqlite3_prepare_v2(database, [sqlQuery UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
                
                sqlite3_step(compiledStatement);
            }
            sqlite3_finalize(compiledStatement);
            
        }
        sqlite3_close(database);
}


-(void) updateText :(NSString *)date :(NSString *)textData
{
   // update  journal_table set j_txt = (select j_txt from journal_table where j_date == ?)||? where j_date == ?
    
//    const char *sqlStatement = "UPDATE frame SET fileExist = '1' WHERE name=?";
//    
//    sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
//    
//    sqlite3_bind_text(sqlStatement, 1, variable, -1, SQLITE_TRANSIENT);
//    
//    int success = sqlite3_step(sqlStatement);
//    
//    sqlite3_reset(sqlStatement);

//     NSString *trimmedString = [date stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if (sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK)  {
        const char *sql = "update journal_table set j_txt = ? where j_date == ?";
    sqlite3_prepare_v2(database, sql , -1, &updateStmt, NULL);
    
				
        sqlite3_bind_text(updateStmt, 1, [textData UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(updateStmt, 2, [date UTF8String], -1, SQLITE_TRANSIENT);
        
            sqlite3_step(updateStmt);
            //sqlite3_finalize(updateStmt);
        
    sqlite3_reset(updateStmt);
        //sqlite3_close(database);
    }
    else
    {
        sqlite3_close(database);
    }
}


-(NSString *)getCurrentText : (NSString *)date
{
    
//    int l;
//     NSString *trimmedString = [date stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    l = [trimmedString length];
//    NSLog(@"%i",l);
    txtString = [[NSString alloc] init];
    txtString = @"";
    if(sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK) {
		
		const char *selectSql = "select j_txt from journal_table where j_date == ?";	
				
		//sqlite3_stmt *compiledStatement;
		//compiledStatement=nil;
		
		if(sqlite3_prepare_v2(database, selectSql , -1, &detailStmt, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(detailStmt, 1, [date UTF8String], -1, SQLITE_TRANSIENT);
            
            while(sqlite3_step(detailStmt) == SQLITE_ROW) {
                txtString = [NSString stringWithUTF8String:(char *)sqlite3_column_text(detailStmt, 0)];
            }
//			sqlite3_step(detailStmt);
		}
		sqlite3_finalize(detailStmt);
		
	}
	sqlite3_close(database);

    return txtString;
}

-(NSMutableArray *)getCurrentGoalDetail:(NSString *)cat
{
   
   

    NSMutableArray *GoalData = [[NSMutableArray alloc] init];
    UIImage *img;
   
    if(sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK) {
		
		const char *selectSql = "select Image,Goal_desc,Status,Priority,Due,Goal_id from My_Goal where Category == ?";	
        
		//sqlite3_stmt *compiledStatement;
		//compiledStatement=nil;
		
		if(sqlite3_prepare_v2(database, selectSql , -1, &detailStmt, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(detailStmt, 1, [cat UTF8String], -1, SQLITE_TRANSIENT);
            int i;
            i=1;
            
            while(sqlite3_step(detailStmt) == SQLITE_ROW) {
               NSString *DescString = [NSString stringWithUTF8String:(char *)sqlite3_column_text(detailStmt, 1)];
                NSString *StatusString = [NSString stringWithUTF8String:(char *)sqlite3_column_text(detailStmt, 2)];
                NSString *PriorityString = [NSString stringWithUTF8String:(char *)sqlite3_column_text(detailStmt, 3)];
                NSString *DueString = [NSString stringWithUTF8String:(char *)sqlite3_column_text(detailStmt, 4)];
                NSString *GoalId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(detailStmt, 5)];
                 NSMutableDictionary *GoalDic = [[NSMutableDictionary alloc] init];
                [GoalDic setValue:DescString forKey:@"Goal_desc"];
                [GoalDic setValue:StatusString forKey:@"Status"];
                [GoalDic setValue:PriorityString forKey:@"Priority"];
                [GoalDic setValue:DueString forKey:@"Due"];
                [GoalDic setValue:GoalId forKey:@"Goal_id"];
                
                
                
                 NSData *dataForCachedImage = [[NSData alloc] initWithBytes:sqlite3_column_blob(detailStmt, 0) length: sqlite3_column_bytes(detailStmt,0)];           
                 img = [UIImage imageWithData:dataForCachedImage];
                 [GoalDic setValue:img forKey:@"Image"];
                 [dataForCachedImage release];

                [GoalData addObject:GoalDic];
                [GoalDic release];
                i++;
                
            }
            //			sqlite3_step(detailStmt);
		}
		sqlite3_finalize(detailStmt);
		
	}
	sqlite3_close(database);
    
    return GoalData;

}

-(void)addJournalEntry :(NSString *)data : (NSString *)date{
	
    
		if (sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK)  {
			const char *sql = "insert into journal_table(j_date, j_txt) Values(?,?)";
			if(sqlite3_prepare_v2(database, sql , -1, &addStmt, NULL) == SQLITE_OK)
			{	//NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
			
                
			sqlite3_bind_text(addStmt, 1, [date UTF8String], -1, SQLITE_TRANSIENT);		
			sqlite3_bind_text(addStmt, 2, [data UTF8String], -1, SQLITE_TRANSIENT);
                
                sqlite3_step(addStmt);
                sqlite3_finalize(addStmt);
                sqlite3_close(database);

			}
			
//			if(SQLITE_DONE != sqlite3_step(addStmt))
//				NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(database));
			else{
				
                sqlite3_close(database);
                NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
				//Reset the add statement.
				//sqlite3_reset(addStmt);
			}
		}
		else {
			sqlite3_close(database); 
		}		

}

-(void)addGoalEntry :(NSString *)cat: (NSString *)desc:(NSString *)status:(NSString *)priority:(NSString *)Due:(NSData *)imgData{
	
    
    if (sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK)  {
        const char *sql = "insert into My_Goal(Category,Goal_desc,Status,Priority,Due,Image) Values(?,?,?,?,?,?)";
        if(sqlite3_prepare_v2(database, sql , -1, &addgoalstmt, NULL) == SQLITE_OK)
        {	//NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
			
            
			sqlite3_bind_text(addgoalstmt, 1, [cat UTF8String], -1, SQLITE_TRANSIENT);		
			sqlite3_bind_text(addgoalstmt, 2, [desc UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(addgoalstmt, 3, [status UTF8String], -1, SQLITE_TRANSIENT);		
			sqlite3_bind_text(addgoalstmt, 4, [priority UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(addgoalstmt, 5, [Due UTF8String], -1, SQLITE_TRANSIENT);	
           
			sqlite3_bind_blob(addgoalstmt, 6, [imgData bytes], [imgData length], SQLITE_TRANSIENT);
            /*
             sqlite3_bind_blob(pStmt, 2, zBlob, nBlob, SQLITE_STATIC);
             */
            
            
            sqlite3_step(addgoalstmt);
            sqlite3_finalize(addgoalstmt);
          //  sqlite3_close(addgoalstmt);
            
        }
        
        //			if(SQLITE_DONE != sqlite3_step(addStmt))
        //				NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(database));
        else{
            
            sqlite3_close(database);
            NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
            //Reset the add statement.
            //sqlite3_reset(addStmt);
        }
    }
    else {
        sqlite3_close(database); 
    }		
    
}

-(void)updateGoalEntry :(NSString *)cat: (NSString *)desc:(NSString *)status:(NSString *)priority:(NSString *)Due:(NSData *)imgData : (int)GoalId{
	
    // update My_Goal set Category = ?,Goal_desc = ?,Status = ?,Priority = ?,Due = ?,Image = ? where Goal_id = ?
    if (sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK)  
    {
        const char *sql = "update My_Goal set Category = ?,Goal_desc = ?,Status = ?,Priority = ?,Due = ?,Image = ? where Goal_id = ?";
        sqlite3_prepare_v2(database, sql , -1, &updateStmt, NULL);
        	//NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
			
            
			sqlite3_bind_text(updateStmt, 1, [cat UTF8String], -1, SQLITE_TRANSIENT);		
			sqlite3_bind_text(updateStmt, 2, [desc UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(updateStmt, 3, [status UTF8String], -1, SQLITE_TRANSIENT);		
			sqlite3_bind_text(updateStmt, 4, [priority UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(updateStmt, 5, [Due UTF8String], -1, SQLITE_TRANSIENT);	
            
			sqlite3_bind_blob(updateStmt, 6, [imgData bytes], [imgData length], SQLITE_TRANSIENT);
            /*
             sqlite3_bind_blob(pStmt, 2, zBlob, nBlob, SQLITE_STATIC);
             */
     //   sqlite3_bind_text(updateStmt, 7, [Due UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_double(updateStmt, 7, GoalId);//(updateStmt, 8, [Due UTF8String], -1, SQLITE_TRANSIENT);
            
            
            sqlite3_step(updateStmt);
           // sqlite3_finalize(updateStmt);
            //  sqlite3_close(addgoalstmt);
            sqlite3_reset(updateStmt);
       }
       else
       {
        sqlite3_close(database); 
       }		
    /*
     if (sqlite3_open([self.dbStr UTF8String], &database) == SQLITE_OK)  {
     const char *sql = "update journal_table set j_txt = ? where j_date == ?";
     sqlite3_prepare_v2(database, sql , -1, &updateStmt, NULL);
     
     
     sqlite3_bind_text(updateStmt, 1, [textData UTF8String], -1, SQLITE_TRANSIENT);
     sqlite3_bind_text(updateStmt, 2, [date UTF8String], -1, SQLITE_TRANSIENT);
     
     sqlite3_step(updateStmt);
     //sqlite3_finalize(updateStmt);
     
     sqlite3_reset(updateStmt);
     //sqlite3_close(database);
     }
     else
     {
     sqlite3_close(database);
     }

     */
}



-(void) checkAndCreateDatabase{
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;
    
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
    
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:dbStr];
    
	// If the database already exists then return without doing anything
	//if(success) return;
    
	// If not then proceed to copy the database from the application to the users filesystem
    
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
    
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:dbStr error:nil];
    
	[fileManager release];
}





- (void)dealloc {
   
    [getId release];
    [txtString release];
    [databaseName release];
    [journalEntries release];
    [super dealloc];
}


@end
