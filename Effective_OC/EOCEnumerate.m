//
//  EOCEnumerate.m
//  Effective_OC
//
//  Created by 范兴政 on 15/12/30.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCEnumerate.h"

@implementation EOCEnumerate

- (void)testEnumerate {
    NSArray *anArray = @[@"fanxingzheng",@"thomas",@"zheng",@"0",@"1",@"2",@"3",@"4",@"5",@"6"];
    [anArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 2) {
            *stop = YES;
        }
        NSLog(@"%ld:value=%@",idx,obj);
    }];
    
    [anArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%ld:value=%@",idx,obj);
    }];
    [anArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%ld:value=%@",idx,obj);
    }];
    
    NSEnumerator *enumerator=[anArray reverseObjectEnumerator];
    id object;
    while ((object = [enumerator nextObject]) != nil) {
        NSLog(@"%@",object);
    }
    
    NSDictionary *aDict=@{@"name":@"fanxingzheng",
                           @"enName":@"Thomas",
                           @"age":@"22"};
    [aDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isEqualToString:@"age"]) {
            *stop = YES;
        }
        NSLog(@"key->%@,value->%@",key,obj);
    }];
    [aDict enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isEqualToString:@"age"]) {
            *stop = YES;
        }
        NSLog(@"key->%@,value->%@",key,obj);
    }];
    
    enumerator=[aDict keyEnumerator];
    id key;
    while ((key = [enumerator nextObject]) != nil) {
        NSLog(@"key->%@, value->%@",key,[aDict objectForKey:key]);
    }
    enumerator=[aDict objectEnumerator];
    id value;
    while ((value = [enumerator nextObject]) != nil) {
        NSLog(@"value->%@",value);
    }
}
@end
