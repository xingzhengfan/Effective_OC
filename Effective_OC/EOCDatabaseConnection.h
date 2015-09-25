//
//  EOCDatabaseConnection.h
//  Effective_OC
//
//  Created by 范兴政 on 15/9/24.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EOCDatabaseConnectionDelegate.h"
@interface EOCDatabaseConnection : NSObject <EOCDatabaseConnectionDelegate>

- (id)connectionWithIdentifier:(NSString *)identifier;

@end
