//
//  EOCNetworkFetcher.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/23.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOCNetworkFetcher.h"
@interface EOCNetworkFetcher () <NSURLConnectionDataDelegate>
{
    struct {
        unsigned int didReceiveData            : 1;
        unsigned int didFailWithError          : 1;
        unsigned int didUpdateProgressTo       : 1;
        unsigned int shouldFollowRedirectToURL : 1;
    } _delegateFlags;
}
@end

@implementation EOCNetworkFetcher
{
    NSURL *_url;
    void (^_completionHandler)(NSData *data);
    NSMutableData *_downLoadData;
}
- (void)fetchNetworkDataWithURLString:(NSString *)URLString {
    for (int i=0; i<100; ++i) {
        if (_delegateFlags.didUpdateProgressTo) {
            [_delegate networkFetcher:self didUpdateProgressTo:.01*i];
        }
    }
    if ([URLString hasSuffix:@"com"]) {
        if (_delegateFlags.didReceiveData) {
            [_delegate networkFetcher:self didReceiveData:[@"com" dataUsingEncoding:NSUTF8StringEncoding]];
        }
    } else if ([URLString hasSuffix:@"cn"]) {
        if (_delegateFlags.didReceiveData) {
            [_delegate networkFetcher:self didReceiveData:[@"cn" dataUsingEncoding:NSUTF8StringEncoding]];
        }
    } else if ([URLString hasSuffix:@"org"]) {
        if (_delegateFlags.shouldFollowRedirectToURL) {
            if ([_delegate networkFetcher:self shouldFollowRedirectToURL:[NSURL URLWithString:@"com"]]) {
                [self fetchNetworkDataWithURLString:@"com"];
            }
        }
    } else if ([URLString hasSuffix:@"edu"]) {
        if (_delegateFlags.shouldFollowRedirectToURL) {
            if ([_delegate networkFetcher:self shouldFollowRedirectToURL:[NSURL URLWithString:@"cn"]]) {
                [self fetchNetworkDataWithURLString:@"cn"];
            }
        }
    } else {
        if (_delegateFlags.didFailWithError) {
            [_delegate networkFetcher:self
                     didFailWithError:[NSError errorWithDomain:@"networkFetcher" code:-100099 userInfo:@{@"haha":@"hehe"}]];
        }
    }
}

- (void)setDelegate:(id<EOCNetworkFetcherDelegate>)delegate {
    _delegate=delegate;
    _delegateFlags.didReceiveData=[_delegate respondsToSelector:@selector(networkFetcher:didReceiveData:)];
    _delegateFlags.didFailWithError=[_delegate respondsToSelector:@selector(networkFetcher:didFailWithError:)];
    _delegateFlags.didUpdateProgressTo=[_delegate respondsToSelector:@selector(networkFetcher:didUpdateProgressTo:)];
    _delegateFlags.shouldFollowRedirectToURL=[_delegate respondsToSelector:@selector(networkFetcher:shouldFollowRedirectToURL:)];
}

//cache
- (id)initWithURL:(NSURL *)url {
    if (self = [super init]) {
        _url = url;
        _downLoadData = [NSMutableData new];
    }
    return self;
}

- (void)startWithCompletionHandler:(EOCNetworkFetcherCompletionHandler)handler {
    _completionHandler = handler;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //
    });
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:_url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

#pragma mark -connectionData
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"didReceiveData");
    
    [_downLoadData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    _completionHandler(_downLoadData);
}
@end
