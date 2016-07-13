//
//  JFCar.m
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "JFCar.h"


@implementation Engine
objection_register(Engine)
@synthesize awake;

- (void) awakeFromObjection {
    awake = YES;
}
@end

@implementation Brakes

@end


@implementation JFCar
// 注册JFCar 类
objection_register(JFCar)

@synthesize engine, brakes, awake;

- (void)awakeFromObjection {
    awake = YES;
}
//objection_requires macro can be used to declare what dependencies objection should provide to all instances it creates of that class. objection_requires can be used safely with inheritance.

objection_requires(@"engine", @"brakes")
@end






// 未注册的car
@implementation UnregisteredCar
objection_requires(@"engine") // 注销则获取为为nil
@synthesize engine;
@end



@implementation FiveSpeedCar
objection_register(FiveSpeedCar)

@synthesize gearBox;

objection_requires(@"gearBox")
@end

@implementation SixSpeedCar
objection_register(SixSpeedCar)
@synthesize gearBox;
@end


