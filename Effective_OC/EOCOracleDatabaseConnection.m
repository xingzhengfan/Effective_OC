//
//  EOCOracleDatabaseConnection.m
//  Effective_OC
//
//  Created by goodplay_02 on 15/9/25.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCOracleDatabaseConnection.h"
#import "ThirdOracleConnector.h"

@interface EOCOracleDatabaseConnection () {
    ThirdOracleConnector *_oracleConnector;
}

@end
@implementation EOCOracleDatabaseConnection

- (id)getOracleDatabaseConnection {
    EOCOracleDatabaseConnection *connection=[[EOCOracleDatabaseConnection alloc] init];
    connection->_oracleConnector=[ThirdOracleConnector getOracleConnector];
    
    return connection;
}

#pragma mark -EOCDatabaseConnectionDelegate
- (void)connect {
    [_oracleConnector oracleConnect];
}

- (void)disconnect {
    [_oracleConnector oracleDisconnect];
}

- (BOOL)isConnected {
    return [_oracleConnector oracleIsConnected];
}

- (NSArray *)performQuery:(NSString *)query {
    return [_oracleConnector oracleQuery:query];
}
@end
