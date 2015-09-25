//
//  EOCDatabaseManager.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/24.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCDatabaseManager.h"
#import "EOCMySqlDatabaseConnection.h"
#import "EOCOracleDatabaseConnection.h"

@implementation EOCDatabaseManager

+ (id)sharedInstance {
    static EOCDatabaseManager *connection=nil;
    if (connection==nil) {
        connection=[EOCDatabaseManager new];
    }
    
    return connection;
}

- (id <EOCDatabaseConnectionDelegate>)connectionWithIdentifier:(NSString *)identifier {
    id <EOCDatabaseConnectionDelegate> connection=nil;
    if ([identifier isEqualToString:@"mysql"]) {
        connection=[[EOCMySqlDatabaseConnection new] getMySqlDatabaseConnection];
    } else if ([identifier isEqualToString:@"oracle"]) {
        connection=[[EOCOracleDatabaseConnection new] getOracleDatabaseConnection];
    }
    return connection;
}

@end
