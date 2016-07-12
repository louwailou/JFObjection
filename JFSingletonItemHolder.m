//
//  JFSingletonItemHolder.m
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "JFSingletonItemHolder.h"

@implementation JFSingletonItemHolder
@synthesize singletonItem;
objection_register(JFSingletonItemHolder)
objection_requires(@"singletonItem")
@end

@implementation SingletonItem
objection_register_singleton(SingletonItem)
@end
