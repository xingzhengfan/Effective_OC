//
//  EOCBrain.h
//  studentApp
//
//  Created by goodplay_02 on 15/7/28.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOCBrain : NSObject<NSObject>

- (NSString *)dispatch;
- (BOOL)isEqualToBrain:(EOCBrain *)brain;

@property (nonatomic, copy) NSString *brain;

@end
