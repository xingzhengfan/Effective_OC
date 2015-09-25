//
//  ThirdOracleConnector.m
//  Effective_OC
//
//  Created by goodplay_02 on 15/9/25.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "ThirdOracleConnector.h"

@implementation ThirdOracleConnector

+ (id)getOracleConnector {
    static ThirdOracleConnector *oracleConnector=nil;
    if (oracleConnector==nil) {
        oracleConnector=[ThirdOracleConnector new];
    }
    
    return oracleConnector;
}

- (void)oracleConnect {
    NSLog(@"ThirdOracleConnector connecting..");
}

- (void)oracleDisconnect {
    NSLog(@"ThirdOracleConnector disconnecting");
}

- (BOOL)oracleIsConnected {
    NSLog(@"ThirdOracleConnector has connected");
    return YES;
}

- (NSArray *)oracleQuery:(NSString *)query {
    return [query isEqualToString:@"fan"]?@[@"fanxingzheng",@"fanxing",@"fan"]:@[@"zhengxingfan",@"zhengxing",@"zheng"];
}

@end
