//
//  JFCar.h
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <Objection/Objection.h>

@interface Engine : NSObject
{
    BOOL awake;
}
@property(nonatomic) BOOL awake;

@end

@interface Brakes : NSObject
{
    
}
@end


@interface JFCar : NSObject
{
    Engine *engine;
    Brakes *brakes;
    BOOL awake;
}

@property(nonatomic, strong) Engine *engine;
@property(nonatomic, strong) Brakes *brakes;
@property(nonatomic) BOOL awake;

@end



// 未注册的car
@interface UnregisteredCar : NSObject
@property(nonatomic, strong) Engine *engine;
@end



@protocol GearBox;

@protocol ManualCar <NSObject>
@property (nonatomic, retain) id<GearBox> gearBox;
@end

@interface FiveSpeedCar : JFCar<ManualCar>
@end

@interface SixSpeedCar : JFCar<ManualCar>
@end


