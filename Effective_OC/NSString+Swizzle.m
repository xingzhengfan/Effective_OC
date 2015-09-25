//
//  NSString+Swizzle.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/14.
//  Copyright (c) 2015年 fanxingzheng. All rights reserved.
//

#import "NSString+Swizzle.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSString (Swizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleClassMethod:@selector(resolveInstanceMethod:) withClassMethod:@selector(s_resolveInstanceMethod:)];
    });
}

+ (BOOL)s_resolveInstanceMethod:(SEL)sel {
    if (![self s_resolveInstanceMethod:sel]) {
        NSString *selString=NSStringFromSelector(sel);
        if ([selString isEqualToString:@"count"]||[selString isEqualToString:@"objectAtIndex:"]||[selString isEqualToString:@"makeObjectsPerformSelector:withObject:"]) {
            class_addMethod(self, sel, (IMP)dynamicMethodIMP, "v@:");
            
            return YES;
        } else {
            return NO;
        }
    }
    return YES;
}

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"dynamicMethodIMP");
}
@end
