//
//  EOCRectangle.m
//  fitapp
//
//  Created by goodplay_02 on 15/9/15.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "EOCRectangle.h"

@implementation EOCRectangle

- (id)init {
    //@throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must use initWithWidth:andHeight: instead." userInfo:nil];
    return [self initWithWidth:5.0f andHeight:10.0f];
}

- (id)initWithWidth:(CGFloat)width andHeight:(CGFloat)height {
    if (self=[super init]) {
        _width=width;
        _height=height;
    }
    
    return self;
}

#pragma mark - coding
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self=[super init]) {
        _width=[aDecoder decodeFloatForKey:@"width"];
        _height=[aDecoder decodeFloatForKey:@"height"];
    }
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@\n",@{@"width":@(_width),
                                                @"height":@(_height)}];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"<%@: %p, %@>\n",[self class], self, @{@"width":@(_width),
                                                                              @"height":@(_height)}];
}
@end
