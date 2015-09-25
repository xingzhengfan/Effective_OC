//
//  EOCDatabaseManager.h
//  Effective_OC
//
//  Created by 范兴政 on 15/9/24.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EOCDatabaseConnectionDelegate.h"

@interface EOCDatabaseManager : NSObject

+ (id)sharedInstance;
- (id <EOCDatabaseConnectionDelegate>)connectionWithIdentifier:(NSString *)identifier;

@end
