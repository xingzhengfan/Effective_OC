//
//  EOCBrain.m
//  studentApp
//
//  Created by goodplay_02 on 15/7/28.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "EOCBrain.h"

@implementation EOCBrain

- (NSString *)dispatch
{
    return @"brain_dispatch";
}

- (BOOL)isEqualToBrain:(EOCBrain *)brain
{
    if ([self.brain isEqualToString:brain.brain]) {
        return YES;
    }
    return NO;
}

@end
