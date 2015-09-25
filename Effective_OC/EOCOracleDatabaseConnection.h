//
//  EOCOracleDatabaseConnection.h
//  Effective_OC
//
//  Created by goodplay_02 on 15/9/25.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EOCDatabaseConnectionDelegate.h"
@interface EOCOracleDatabaseConnection : NSObject <EOCDatabaseConnectionDelegate>

- (id)getOracleDatabaseConnection;

@end
