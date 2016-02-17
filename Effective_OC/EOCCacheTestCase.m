//
//  EOCCacheTestCase.m
//  Effective_OC
//
//  Created by 范兴政 on 15/12/30.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCCacheTestCase.h"
#import "EOCNetworkFetcher.h"

@implementation EOCCacheTestCase
{
    NSCache *_cache;
}

- (id)init {
    if (self = [super init]) {
        _cache = [NSCache new];
        _cache.countLimit = 10;
        _cache.totalCostLimit = 5*1024*1024;
    }
    
    return self;
}

- (void)downloadDataForURL:(NSURL *)url {
    NSPurgeableData *cacheData = [_cache objectForKey:url];
    if (cacheData) {
        [cacheData beginContentAccess];
        
        [self userData:cacheData];
        
        [cacheData endContentAccess];
    } else {
        EOCNetworkFetcher *fetcher = [[EOCNetworkFetcher alloc] initWithURL:url];
        [fetcher startWithCompletionHandler:^(NSData *data) {
            NSPurgeableData *purgeableData = [NSPurgeableData dataWithData:data];
            [_cache setObject:purgeableData forKey:url cost:purgeableData.length];
            [self userData:data];
            NSLog(@"新缓存");
            [purgeableData endContentAccess];
        }];
    }
}

- (void)userData:(NSData *)data {
    NSString *string = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSLog(@"%@",string);
}

@end
