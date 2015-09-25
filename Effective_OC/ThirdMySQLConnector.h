//
//  ThirdMySQLConnector.h
//  Effective_OC
//
//  Created by goodplay_02 on 15/9/25.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThirdMySQLConnector : NSObject

- (id)mysqlConnector;

- (void)mysqlConnect;
- (void)mysqlDisconnect;
- (BOOL)mysqlIsConnected;
- (NSArray *)mysqlQuery:(NSString *)query;

@end
