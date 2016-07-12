//
//  ShinyCar.m
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "ShinyCar.h"


@implementation Headlight
objection_register(Headlight)
@end

@implementation HIDHeadlight
objection_register(HIDHeadlight)
@end

@implementation ShinyCar
objection_register(ShinyCar)
objection_requires_names((@{@"LeftHeadlight":@"leftHeadlight", @"RightHeadlight":@"rightHeadlight"}))
objection_requires(@"foglight")
@synthesize leftHeadlight, rightHeadlight, foglight;
@end





@implementation Blinker
objection_register(Blinker)
@synthesize speed;
@end

@implementation FlashyCar
objection_register(FlashyCar)
objection_requires_names((@{ @"LeftBlinker":@"leftBlinker",@"RightBlinker":@"rightBlinker"}))
@synthesize leftBlinker, rightBlinker;
@end

@implementation Highbeam
objection_register_singleton(Highbeam)
@end

@implementation BrightCar
objection_register(BrightCar)
objection_requires_names((@{ @"LeftHighbeam":@"leftHighbeam",@"RightHighbeam":@"rightHighbeam"}))
@synthesize leftHighbeam, rightHighbeam;
@end


