//
//  NSObject+Swizzle.h
//  Effective_OC
//
//  Created by 范兴政 on 15/9/14.
//  Copyright (c) 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (BOOL)swizzleMethod:(SEL)origSel withMethod:(SEL)altSel;
+ (BOOL)swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;

@end
