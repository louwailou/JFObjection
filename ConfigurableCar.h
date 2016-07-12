//
//  ConfigurableCar.h
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFCar.h"
@interface ConfigurableCar : NSObject
@property (nonatomic, strong) JFCar *car;
@property (nonatomic, strong) Engine *engine;

@property (nonatomic, copy) NSString *model;
@property (nonatomic, copy) NSNumber *horsePower;
@property (nonatomic, copy) NSNumber *year;

- (id)initWithModel:(NSString *)model horsePower:(NSNumber *)horsePower andYear:(NSNumber *)year;
@end


@interface BadInitializer : NSObject
@end

@interface Truck : NSObject
@property(nonatomic, strong) NSString *name;
+ (id)truck: (NSString *)name;
@end

@interface FilterInitInitializer : NSObject
@end
