//
//  Effective_OC_01.h
//  studentApp
//
//  Created by goodplay_02 on 15/7/26.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EOCBrain;

@interface Effective_OC_01 : NSObject

- (void)test;

- (void)testHash;

- (void)testFactory;

- (void)most:(int)count;

- (void)testmemberkind;
- (void)testmember;

@property (nonatomic, strong) EOCBrain *brain;

@end
