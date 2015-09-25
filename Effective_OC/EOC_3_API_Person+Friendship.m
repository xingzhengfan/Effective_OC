//
//  EOC_3_API_Person+Friendship.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/23.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import "EOC_3_API_Person+Friendship.h"
#import <objc/runtime.h>
static const char *kNewFriendsPropertyKey="kNewFriendsPropertyKey";

@implementation EOC_3_API_Person (Friendship)

- (BOOL)isFriendsWith:(EOC_3_API_Person *)person {
    return YES;
}

//
- (NSArray *)newFriends {
    return objc_getAssociatedObject(self, kNewFriendsPropertyKey);
}

- (void)setNewFriends:(NSArray *)newFriends {
    objc_setAssociatedObject(self, kNewFriendsPropertyKey, newFriends, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
