//
//  EOCMySqlDatabaseConnection.m
//  Effective_OC
//
//  Created by goodplay_02 on 15/9/25.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCMySqlDatabaseConnection.h"

@implementation EOCMySqlDatabaseConnection

- (id)getMySqlDatabaseConnection {
    return [super mysqlConnector];
}

#pragma mark -EOCDatabaseConnectionDelegate
- (void)connect {
    [super mysqlConnect];
}

- (void)disconnect {
    [super mysqlDisconnect];
}

- (BOOL)isConnected {
    return [super mysqlIsConnected];
}

- (NSArray *)performQuery:(NSString *)query {
    return [super mysqlQuery:query];
}

@end
