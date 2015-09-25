//
//  ThirdOracleConnector.h
//  Effective_OC
//
//  Created by goodplay_02 on 15/9/25.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThirdOracleConnector : NSObject

+ (id)getOracleConnector;

- (void)oracleConnect;
- (void)oracleDisconnect;
- (BOOL)oracleIsConnected;
- (NSArray *)oracleQuery:(NSString *)query;

@end
