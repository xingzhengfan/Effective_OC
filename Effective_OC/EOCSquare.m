//
//  EOCSquare.m
//  fitapp
//
//  Created by goodplay_02 on 15/9/15.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "EOCSquare.h"

@implementation EOCSquare

- (id)initWithDimension:(CGFloat)dimension {
    return [super initWithWidth:dimension andHeight:dimension];
}

- (id)initWithWidth:(CGFloat)width andHeight:(CGFloat)height {
    CGFloat dimension=MAX(width, height);
    return [self initWithDimension:dimension];
}

- (id)init {
    return [self initWithDimension:5.0f];
}

#pragma mark - coding
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self=[super initWithCoder:aDecoder]) {
        //specific initializer
    }
    
    return self;
}

@end
