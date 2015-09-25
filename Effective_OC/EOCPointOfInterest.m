//
//  EOCPointOfInterest.m
//  fitapp
//
//  Created by goodplay_02 on 15/9/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "EOCPointOfInterest.h"

@interface EOCPointOfInterest ()

@property (nonatomic, copy, readwrite) NSString *identifier;

@end

@implementation EOCPointOfInterest

- (id)initWithIdentifier:(NSString *)identifier
                   title:(NSString *)title
                latitude:(CGFloat)latitude
               longitude:(CGFloat)longitude {
    if (self=[super init]) {
        _identifier=[identifier copy];
        _title=[title copy];
        _latitude=latitude;
        _longitude=longitude;
    }
    
    return self;
}

@end
