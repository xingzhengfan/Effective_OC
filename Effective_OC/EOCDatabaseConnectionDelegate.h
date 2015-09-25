//
//  EOCDatabaseConnectionDelegate.h
//  Effective_OC
//
//  Created by 范兴政 on 15/9/24.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EOCDatabaseConnectionDelegate <NSObject>
- (void)connect;
- (void)disconnect;
- (BOOL)isConnected;
- (NSArray *)performQuery:(NSString *)query;
@end
