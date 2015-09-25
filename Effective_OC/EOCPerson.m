//
//  EOCPerson.m
//  studentApp
//
//  Created by goodplay_02 on 15/7/28.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "EOCPerson.h"

@implementation EOCPerson

- (BOOL)isEqual:(id)object
{
    if (self==object) {
        return YES;
    }
    if ([self class]!=[object class]&&[self superclass]!=[object class]&&[self class]!=[object superclass]) {
        return NO;
    }
    EOCPerson *otherPerson=(EOCPerson *)object;
    if (![_firstName isEqualToString:otherPerson.firstName]) {
        return NO;
    }
    if (![_lastName isEqualToString:otherPerson.lastName]) {
        return NO;
    }
    if (_age!=otherPerson.age) {
        return NO;
    }
    
    return YES;
}

@end
