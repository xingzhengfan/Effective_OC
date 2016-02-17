//
//  NSTimer+EOCBlockSupport.h
//  Effective_OC
//
//  Created by 范兴政 on 15/12/31.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (EOCBlockSupport)

+ (id)block_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                     block:(void(^)())block
                                   repeats:(BOOL)repeats;

+ (void)p_blockInvoke:(NSTimer *)timer;

@end
