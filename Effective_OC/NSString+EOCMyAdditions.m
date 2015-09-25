//
//  NSString+EOCMyAdditions.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/8.
//  Copyright (c) 2015年 fanxingzheng. All rights reserved.
//

#import "NSString+EOCMyAdditions.h"

@implementation NSString (EOCMyAdditions)

- (NSString *)eoc_myLowercaseString {
    NSString *lowercase=[self eoc_myLowercaseString];
    NSLog(@"%@=>%@",self,lowercase);
    
    return lowercase;
}

@end
