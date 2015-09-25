//
//  EOCExchangeImplementation.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/8.
//  Copyright (c) 2015年 fanxingzheng. All rights reserved.
//

#import "EOCExchangeImplementation.h"
#import <objc/runtime.h>
#import "NSString+EOCMyAdditions.h"

@implementation EOCExchangeImplementation

- (void)test {
    NSString *string1=@"tHis iS tHe StRiNg";
    NSLog(@"lowercaseString:%@\nuppercaseString:%@",[string1 lowercaseString],[string1 uppercaseString]);
    
    method_exchangeImplementations(class_getInstanceMethod([NSString class], @selector(lowercaseString)), class_getInstanceMethod([NSString class], @selector(uppercaseString)));
    
    NSLog(@"lowercaseString:%@\nuppercaseString:%@",[string1 lowercaseString],[string1 uppercaseString]);
}

- (void)testAdd {
    method_exchangeImplementations(class_getInstanceMethod([NSString class], @selector(lowercaseString)), class_getInstanceMethod([NSString class], @selector(eoc_myLowercaseString)));
    
    NSString *string=@"tHis iS tHe StRiNg";
    [string lowercaseString];
}

@end
