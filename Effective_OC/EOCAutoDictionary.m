//
//  EOCAutoDictionary.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/8.
//  Copyright (c) 2015年 fanxingzheng. All rights reserved.
//

#import "EOCAutoDictionary.h"
#import <objc/runtime.h>

@interface EOCAutoDictionary ()

@property (nonatomic, strong) NSMutableDictionary *backingStore;

@end

@implementation EOCAutoDictionary

@dynamic string, number, date, opaqueObject;

- (id)init {
    if (self=[super init]) {
        _backingStore=[NSMutableDictionary dictionary];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorString=NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
    } else {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }
    
    return YES;
}

id autoDictionaryGetter(id self, SEL _cmd) {
    EOCAutoDictionary *typedSelf=(EOCAutoDictionary *)self;
    NSMutableDictionary *backingStore=typedSelf.backingStore;
    
    NSString *key=NSStringFromSelector(_cmd);
    
    return [backingStore objectForKey:key];
}

void autoDictionarySetter(id self, SEL _cmd, id value){
    EOCAutoDictionary *typedSelf=(EOCAutoDictionary *)self;
    NSMutableDictionary *backingStore=typedSelf.backingStore;
    
    NSString *selectorString=NSStringFromSelector(_cmd);
    NSMutableString *key=[selectorString mutableCopy];
    
    [key deleteCharactersInRange:NSMakeRange(key.length-1, 1)];
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    NSString *lowercaseFirstChar=[[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
}

@end
