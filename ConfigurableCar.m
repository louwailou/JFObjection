//
//  ConfigurableCar.m
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "ConfigurableCar.h"

@implementation ConfigurableCar
objection_register(ConfigurableCar)
objection_requires(@"engine")
objection_initializer_sel(@selector(initWithModel:horsePower:andYear:))

@synthesize car = _car;
@synthesize engine = _engine;

@synthesize horsePower = _horsePower;
@synthesize model = _model;
@synthesize year = _year;

- (id)initWithModel:(NSString *)model horsePower:(NSNumber *)horsePower andYear:(NSNumber *)year {
    if ((self = [super init])) {
        self.model = model;
        self.horsePower = horsePower;
        self.year = year;
    }
    return self;
}

@end



@implementation Truck
objection_register(Truck)
objection_initializer(truck:, @"Chevy")

+ (id)truck: (NSString *)name {
    Truck *truck = [[self alloc] init];
    truck.name = name;
    return truck;
}
@end

@implementation BadInitializer
objection_register(BadInitializer)
objection_initializer(initWithNonExistentInitializer)
@end


@implementation FilterInitInitializer
objection_initializer(init)

@end