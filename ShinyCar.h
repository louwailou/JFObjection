//
//  ShinyCar.h
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Headlight : NSObject
@end

@interface HIDHeadlight : Headlight
@end


@interface ShinyCar : NSObject
@property (nonatomic, strong) Headlight *leftHeadlight;
@property (nonatomic, strong) Headlight *rightHeadlight;
@property (nonatomic, strong) Headlight *foglight;
@end




@protocol Blinkable
@property (nonatomic, strong) NSNumber* speed;
@end

@interface Blinker : NSObject<Blinkable>
@property (nonatomic, strong) NSNumber* speed;
@end

@interface FlashyCar : NSObject
@property (nonatomic, strong) id<Blinkable> leftBlinker;
@property (nonatomic, strong) id<Blinkable> rightBlinker;
@end

@interface Highbeam : NSObject
@end

@interface BrightCar : NSObject
@property (nonatomic, strong) Highbeam *leftHighbeam;
@property (nonatomic, strong) Highbeam *rightHighbeam;
@end