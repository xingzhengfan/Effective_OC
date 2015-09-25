//
//  Effective_OC_runtime.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/8.
//  Copyright (c) 2015年 fanxingzheng. All rights reserved.
//

#import "Effective_OC_runtime.h"
#import "EOCAutoDictionary.h"

@implementation Effective_OC_runtime

- (void)testresolve {
    EOCAutoDictionary *dict=[EOCAutoDictionary new];
    dict.date=[NSDate dateWithTimeIntervalSince1970:475372800];
    [dict setValue:@"fanxingzheng" forKey:@"string"];
    NSLog(@"dict.string=%@",dict.string);
    NSLog(@"dict.date=%@",dict.date);
    
    NSString *string1=@"tHis iS tHe StRiNg";
    NSLog(@"lowercaseString:%@\nuppercaseString:%@",[string1 lowercaseString],[string1 uppercaseString]);
}

@end
