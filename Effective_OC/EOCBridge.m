//
//  EOCBridge.m
//  Effective_OC
//
//  Created by 范兴政 on 15/12/30.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCBridge.h"

@implementation EOCBridge

- (void)testBridge {
    NSArray *anNSArray=@[@1,@2,@3,@4,@5,@6,@7,@8,@9];
    CFArrayRef aCFArray=(__bridge CFArrayRef)anNSArray;
    NSLog(@"size of array=%li",CFArrayGetCount(aCFArray));
}

const void *EOCRetainCallBack(CFAllocatorRef allocator, const void *value) {
    return CFRetain(value);
}

void EOCReleaseCallBack(CFAllocatorRef allocator, const void *value) {
    CFRelease(value);
}

- (void)testExampleCase {
    CFDictionaryKeyCallBacks keyCallBacks = {
        0,
        EOCRetainCallBack,
        EOCReleaseCallBack,
        NULL,
        CFEqual,
        CFHash,
    };
    
    CFDictionaryValueCallBacks valueCallBacks = {
        0,
        EOCRetainCallBack,
        EOCReleaseCallBack,
        NULL,
        CFEqual,
    };
    
    CFMutableDictionaryRef aCFDictionary = CFDictionaryCreateMutable(NULL, 0, &keyCallBacks, &valueCallBacks);
    NSMutableArray *anNSDictionary = (__bridge_transfer NSMutableDictionary *)aCFDictionary;
    
//    EOCBridge *key=[EOCBridge new];
//    NSDictionary *dict=@{key:@"value"};
//    NSLog(@"%@",dict);
}


@end
