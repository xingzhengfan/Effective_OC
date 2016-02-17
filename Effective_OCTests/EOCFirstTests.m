//
//  EOCFirstTests.m
//  Effective_OC
//
//  Created by 范兴政 on 15/12/28.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EOCEmployee.h"

@interface EOCFirstTests : XCTestCase

@end

@implementation EOCFirstTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testEOCEmployee {
    EOCEmployee *employee=[EOCEmployee employeeWithType:EOCEmployeeTypeDeveloper];
    [employee doADaysWork];
    XCTAssertEqual(employee!=nil, YES);
}

@end
