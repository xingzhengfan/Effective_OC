//
//  EOCMySqlDatabaseConnection.h
//  Effective_OC
//
//  Created by goodplay_02 on 15/9/25.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "ThirdMySQLConnector.h"
#import "EOCDatabaseConnectionDelegate.h"
@interface EOCMySqlDatabaseConnection : ThirdMySQLConnector <EOCDatabaseConnectionDelegate>

- (id)getMySqlDatabaseConnection;

@end
