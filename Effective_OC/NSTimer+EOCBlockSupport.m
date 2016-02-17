//
//  NSTimer+EOCBlockSupport.m
//  Effective_OC
//
//  Created by 范兴政 on 15/12/31.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "NSTimer+EOCBlockSupport.h"

@implementation NSTimer (EOCBlockSupport)

+ (void)p_blockInvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

+ (id)block_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void (^)())block repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(p_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

@end
