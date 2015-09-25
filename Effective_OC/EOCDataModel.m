//
//  EOCDataModel.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/23.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCDataModel.h"
#import "EOCNetworkFetcher.h"

@interface EOCDataModel () <EOCNetworkFetcherDelegate>

@end

@implementation EOCDataModel
{
    EOCNetworkFetcher *fetcher_a;
    EOCNetworkFetcher *fetcher_b;
}
- (void)testEntrustModel {
    fetcher_a=[EOCNetworkFetcher new];
    [fetcher_a setDelegate:self];
    [fetcher_a fetchNetworkDataWithURLString:@"fanxingzheng.odb"];
    
    fetcher_b=[EOCNetworkFetcher new];
    [fetcher_b setDelegate:self];
    [fetcher_b fetchNetworkDataWithURLString:@"fanxingzheng.odb"];
}

#pragma mark -EOCNetworkFetcherDelegate
- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didReceiveData:(NSData *)data {
    NSLog(@"data=%@",data);
}

- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didFailWithError:(NSError *)error {
    if (fetcher==fetcher_a) {
        NSLog(@"error=%@",error);
    } else {
        NSLog(@"fail");
    }
}

- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didUpdateProgressTo:(float)progress {
    NSLog(@"progress:%f",progress);
}

- (BOOL)networkFetcher:(EOCNetworkFetcher *)fetcher shouldFollowRedirectToURL:(NSURL *)URL {
    if ([[URL absoluteString] isEqualToString:@"com"]) {
        NSLog(@"is org YES");
        return YES;
    } else if ([[URL absoluteString] isEqualToString:@"cn"]) {
        NSLog(@"is edu NO");
        return NO;
    }
    return YES;
}
@end
