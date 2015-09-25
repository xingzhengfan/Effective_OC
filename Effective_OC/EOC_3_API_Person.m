//
//  EOC_3_API_Person.m
//  fitapp
//
//  Created by goodplay_02 on 15/9/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "EOC_3_API_Person.h"

@implementation EOC_3_API_Person
{
    NSMutableSet *_internalFriends;
}

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    if (self=[super init]) {
        _firstName=[firstName copy];
        _lastName=[lastName copy];
        _internalFriends=[NSMutableSet set];
        
        NSLog(@"self.hash=%ld self.firstName.hash=%ld",[self hash], [self.firstName hash]);
    }
    return self;
}

- (void)addFriend:(EOC_3_API_Person *)person {
    [_internalFriends addObject:person];
}

- (void)removeFriend:(EOC_3_API_Person *)person {
    [_internalFriends removeObject:person];
}

- (NSSet *)friends {
    return [_internalFriends copy];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@ %@, friends=%@",_firstName,_lastName,_internalFriends];
}

#pragma mark -NSCopying
- (id)copyWithZone:(NSZone *)zone {
    EOC_3_API_Person *newPerson=[[[self class] allocWithZone:zone] initWithFirstName:_firstName lastName:_lastName];
    newPerson->_internalFriends=[_internalFriends mutableCopy];
    return newPerson;
}

- (id)deepCopy {
    EOC_3_API_Person *newPerson=[[[self class]alloc] initWithFirstName:_firstName lastName:_lastName];
    newPerson->_internalFriends=[[NSMutableSet alloc] initWithSet:_internalFriends copyItems:YES];
    return newPerson;
}
@end
