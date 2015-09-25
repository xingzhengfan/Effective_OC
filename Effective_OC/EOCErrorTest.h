//
//  EOCErrorTest.h
//  Effective_OC
//
//  Created by 范兴政 on 15/9/22.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EOCError) {
    EOCErrorUnknow                 = -1,
    EOCErrorInternaleInconsistency = 100,
    EOCErrorGeneralFault           = 105,
    EOCErrorBadInput               = 500,
};

extern NSString * const EOCErrorDomain;

@interface EOCErrorTest : NSObject

- (BOOL)doSomething:(NSError **)error;

@end
