//
//  EOCNetworkFetcher.h
//  Effective_OC
//
//  Created by 范兴政 on 15/9/23.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EOCNetworkFetcher;
@protocol EOCNetworkFetcherDelegate <NSObject>

@optional
- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didReceiveData:(NSData *)data;
- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didFailWithError:(NSError *)error;
- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didUpdateProgressTo:(float)progress;
- (BOOL)networkFetcher:(EOCNetworkFetcher *)fetcher shouldFollowRedirectToURL:(NSURL *)URL;
@end

@interface EOCNetworkFetcher : NSObject
@property (nonatomic, weak) id <EOCNetworkFetcherDelegate> delegate;

- (void)fetchNetworkDataWithURLString:(NSString *)URLString;
@end
