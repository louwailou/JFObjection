//
//  JSObjectFactory.m
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "JSObjectFactoryHolder.h"


@implementation JSObjectFactoryHolder
objection_register_singleton(JSObjectFactoryHolder)
objection_requires(@"objectFactory")

@synthesize objectFactory;
@end