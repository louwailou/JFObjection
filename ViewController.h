//
//  ViewController.h
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//
//#import <Objection/Objection.h>
#import <UIKit/UIKit.h>
#import "JFCar.h"
@interface ViewController : UIViewController
@property (nonatomic, strong) JFCar *car;
@property (nonatomic, copy) NSString *nibName;
@property (nonatomic, copy) NSBundle *bundle;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (instancetype)initWithName:(NSString *)name;
@end

