//
//  EOCEmployee.h
//  studentApp
//
//  Created by goodplay_02 on 15/8/13.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, EOCEmployeeType) {
    EOCEmployeeTypeDeveloper,
    EOCEmployeeTypeDesigner,
    EOCEmployeeTypeFinance,
};

@interface EOCEmployee : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger salary;

+ (EOCEmployee *)employeeWithType:(EOCEmployeeType)type;

- (void)doADaysWork;

@end
