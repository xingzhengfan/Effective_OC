//
//  NSObject+Swizzle.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/14.
//  Copyright (c) 2015年 fanxingzheng. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>
@implementation NSObject (Swizzle)

+ (BOOL)swizzleMethod:(SEL)origSel withMethod:(SEL)altSel {
    Method origMethod=class_getInstanceMethod(self, origSel);
    Method newMethod=class_getInstanceMethod(self, altSel);
    
    if (origSel && newMethod) {
        if (class_addMethod(self, origSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
            class_replaceMethod(self, altSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
        } else {
            method_exchangeImplementations(origMethod, newMethod);
        }
        return YES;
    }
    
    return NO;
}

+ (BOOL)swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel {
    Class c=object_getClass((id)self);
    return [c swizzleMethod:origSel withMethod:altSel];
}

@end
