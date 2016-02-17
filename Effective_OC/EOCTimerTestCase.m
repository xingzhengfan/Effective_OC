//
//  EOCTimerTestCase.m
//  Effective_OC
//
//  Created by 范兴政 on 15/12/31.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCTimerTestCase.h"

#import "NSTimer+EOCBlockSupport.h"

#import "ViewController.h"

@implementation EOCTimerTestCase
{
    int _time;
    NSTimer *_timer;
}

- (void)testTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(p_task) userInfo:nil repeats:YES];
//    __weak EOCTimerTestCase *weakSelf = self;
//    _timer = [NSTimer block_scheduledTimerWithTimeInterval:1 block:^{
//        __strong EOCTimerTestCase *strongSelf = weakSelf;
//        [strongSelf p_task];
//    } repeats:YES];
}

- (void)p_task {
    if (_time < 10) {
        NSLog(@"%d time(s)",_time++);
    } else {
        _time = 0;
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark -runtime

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [ViewController new];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL aSel = @selector(testRuntime);
    NSMethodSignature *sign = [[ViewController new] methodSignatureForSelector:@selector(testRuntime)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sign];
    [invocation setTarget:[ViewController new]];
    [invocation setSelector:aSel];
    [invocation invoke];
}



@end
