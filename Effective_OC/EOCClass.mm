//
//  EOCClass.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/24.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCClass.h"
#include "SomeCppClass.hpp"

@interface EOCClass ()
{
    SomeCppClass _cppClass;
}
@property (nonatomic, copy, readwrite) NSString *className;

- (void)class_test;
@end

@implementation EOCClass
- (void)class_test {
    self.className=@"";
}
@end
