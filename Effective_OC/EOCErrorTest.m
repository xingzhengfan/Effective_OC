//
//  EOCErrorTest.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/22.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCErrorTest.h"

NSString * const EOCErrorDomain = @"EOCErrorDomain";

@implementation EOCErrorTest

- (BOOL)doSomething:(NSError *__autoreleasing *)error {
    //do something that may cause an error
    
    EOCError errorCode=EOCErrorInternaleInconsistency;
    
    if (errorCode!=EOCErrorUnknow) {
        //there was an error
        if (error) {
            *error=[NSError errorWithDomain:EOCErrorDomain code:errorCode userInfo:@{@"reason":[NSString stringWithFormat:@"%ld",errorCode]}];
        }
        return NO;
    } else {
        return YES;
    }
}

@end
