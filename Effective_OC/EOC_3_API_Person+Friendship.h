//
//  EOC_3_API_Person+Friendship.h
//  Effective_OC
//
//  Created by 范兴政 on 15/9/23.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOC_3_API_Person.h"

@interface EOC_3_API_Person (Friendship)

@property (nonatomic, copy) NSArray *newFriends;

- (BOOL)isFriendsWith:(EOC_3_API_Person *)person;

@end
