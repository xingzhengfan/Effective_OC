//
//  ThirdMySQLConnector.m
//  Effective_OC
//
//  Created by goodplay_02 on 15/9/25.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "ThirdMySQLConnector.h"

@implementation ThirdMySQLConnector

- (id)mysqlConnector {
    return [self init];
}

- (void)mysqlConnect {
    NSLog(@"ThirdMySQLConnector connecting..");
}

- (void)mysqlDisconnect {
    NSLog(@"ThirdMySQLConnector disconnecting..");
}

- (BOOL)mysqlIsConnected {
    NSLog(@"ThirdMySQLConnector has connected..");
    return YES;
}

- (NSArray *)mysqlQuery:(NSString *)query {
    return [query isEqualToString:@"fan"]?@[@"fanxingzheng",@"fanxing",@"fan"]:@[@"zhengxingfan",@"zhengxing",@"zheng"];
}
@end
