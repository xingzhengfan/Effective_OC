//
//  NSString+EOC_HTTP.h
//  Effective_OC
//
//  Created by 范兴政 on 15/9/24.
//  Copyright © 2015年 fanxingzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EOC_HTTP)//分类名称与方法加前缀
- (void)eoc_urlEncodedString;
- (void)eoc_urlDecodedString;
@end