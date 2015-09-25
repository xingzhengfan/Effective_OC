//
//  EOCRectangle.h
//  fitapp
//
//  Created by goodplay_02 on 15/9/15.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EOCRectangle : NSObject <NSCoding>

@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) CGFloat height;

- (id)initWithWidth:(CGFloat)width andHeight:(CGFloat)height;

@end
