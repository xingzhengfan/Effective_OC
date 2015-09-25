//
//  EOCDatabaseConnection.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/24.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCDatabaseConnection.h"
#import "EOCDatabaseConnectionA.h"
#import "EOCDatabaseConnectionB.h"
@implementation EOCDatabaseConnection

- (id)connectionWithIdentifier:(NSString *)identifier {
    return nil;
}
#pragma mark-EOCDatabaseConnectionDelegate
- (void)connect {
    //
}

- (void)disconnect {
    //
}

- (BOOL)isConnected {
    return YES;
}

- (NSArray *)performQuery:(NSString *)query {
    return nil;
}
@end
