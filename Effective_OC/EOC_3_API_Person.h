//
//  EOC_3_API_Person.h
//  fitapp
//
//  Created by goodplay_02 on 15/9/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOC_3_API_Person : NSObject <NSCopying>

@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic, strong, readonly) NSSet *friends;

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
- (void)addFriend:(EOC_3_API_Person *)person;
- (void)removeFriend:(EOC_3_API_Person *)person;
- (id)deepCopy;

@end
