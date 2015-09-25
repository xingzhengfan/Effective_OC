//
//  EOCPointOfInterest.h
//  fitapp
//
//  Created by goodplay_02 on 15/9/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EOCPointOfInterest : NSObject

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign, readonly) CGFloat latitude;
@property (nonatomic, assign, readonly) CGFloat longitude;

- (id)initWithIdentifier:(NSString *)identifier
                   title:(NSString *)title
                latitude:(CGFloat)latitude
               longitude:(CGFloat)longitude;
@end
