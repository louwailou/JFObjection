//
//  UnStoppableCar.m
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "UnStoppableCar.h"



// 使用selector 定义依赖实例变量
@implementation UnStoppableCar
objection_requires_sel(@selector(engine))
@end