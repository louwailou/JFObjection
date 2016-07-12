//
//  ViewController.m
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "ViewController.h"
#import "JFCar.h"
#import "UnStoppableCar.h"
#import "JFSignaltonCar.h"
#import "JFSingletonItemHolder.h"
#import "JSObjectFactoryHolder.h"
#import "ShinyCar.h"
#import "ConfigurableCar.h"
#import "SingletonFoo.h"
#import "SingletonBar.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     id engine = [[JSObjection defaultInjector] getObject:[Engine class]];
    NSLog(@"engin = %@",engine);
    JFCar  *car = [[JSObjection defaultInjector] getObject:[JFCar class]];
    NSLog(@"car = %@",car);
    NSLog(@"car.engine = %@",car.engine);
    
    // 为注册的Car
    UnregisteredCar *unregisteredCar = [[JSObjection defaultInjector] getObject:[UnregisteredCar class]];
    NSLog(@"unregister Car = %@",unregisteredCar);
    NSLog(@"unregisterCar engin = %@",unregisteredCar.engine);
    
    // 使用register_require_sel
     UnStoppableCar *unStoppablecar = [[JSObjection defaultInjector] getObject:[UnStoppableCar class]];
    NSLog(@"UnstoppableCar Car = %@",unStoppablecar);
    NSLog(@"UnstoppableCar engin = %@",unStoppablecar.engine);
    
    
// 给现有的实例注册依赖
    
    JFCar *InstanceCar = [[JFCar alloc] init];
    NSLog(@"instacneCar  = %@",InstanceCar);
    NSLog(@"instacneCar  engin = %@",InstanceCar.engine); //nil
    [[JSObjection defaultInjector] injectDependencies:InstanceCar];
    NSLog(@"inject after instacneCar  = %@",InstanceCar);
    NSLog(@"instacneCar  engin = %@",InstanceCar.engine);
   
    NSLog(@"instacneCar  brakes = %@",InstanceCar.brakes);
    NSLog(@"car awak %d",[InstanceCar awake]);// yes
    
    //defaults to returning a new instance
    id thomas = [[JSObjection defaultInjector] getObject:[Engine class]];
    id gordan = [[JSObjection defaultInjector] getObject:[Engine class]];
    NSLog(@"thomas == gordan %d",thomas == gordan);
    
    
    
    // singletons
    
    id carFactory1 = [[JSObjection defaultInjector] getObject:[JFSignaltonCar class]];
    id carFactory2 = [[JSObjection defaultInjector] getObject:[JFSignaltonCar class]];
     NSLog(@"carFactory1 == carFactory2  ??->  %d",carFactory1 == carFactory2);
    
    
    
 //ensures that singletons are properly registered even if they have not been referenced
    
    JFSingletonItemHolder  *holder1 = [[JSObjection defaultInjector] getObject:[JFSingletonItemHolder class]];
    JFSingletonItemHolder *holder2 = [[JSObjection defaultInjector] getObject:[JFSingletonItemHolder class]];
    // singletonItem 使用了objection_register_singleton
    NSLog(@"holder1 == holder2  ??->  %d",holder1 == holder2);// 0
     NSLog(@"holder1.item == holder2.item  ??->  %d",holder1.singletonItem == holder2.singletonItem);// yes
    
 //will not return the same instance per injector if object is a singleton
    id SingletonItem1 = [[JSObjection defaultInjector] getObject:[SingletonItem class]];
    id SingletonItem2 = [[JSObjection createInjector] getObject:[SingletonItem class]];
 NSLog(@"SingletonItem1 == SingletonItem2  ??->  %d",SingletonItem1 == SingletonItem2); // 0
    
    [self createDiffInjectContext];
    
    [self passArgums];
    
    [self namedInstance];
    
    [self cycyleReference];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)createDiffInjectContext{
    //injector returns a JSObjectFactory for the given injector context
    
    JSObjectionInjector *injector1 = [JSObjection createInjector];
    JSObjectionInjector *injector2 = [JSObjection defaultInjector];
    
    JSObjectFactoryHolder *holder1 = [injector1 getObject:[JSObjectFactoryHolder class]];
    JSObjectFactoryHolder *holder2 = [injector2 getObject:[JSObjectFactoryHolder class]];
    
    SingletonItem *item1 = holder1.objectFactory[[SingletonItem class]];
    SingletonItem *item2 = [holder2.objectFactory getObject:[SingletonItem class]];
    NSLog(@"item1 == item2 -->%d",item1 == item2);//0
    
}
- (void)passArgums{
    // 给实例传值
    //A class can get objects from the injector context through an object factory.
    
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    JSObjectFactory *factory = [injector getObject:[JSObjectFactory class]];
    
    ConfigurableCar *car = [factory getObjectWithArgs:[ConfigurableCar class], @"100", @200, @300, nil];
    NSLog(@"car model = %@ power = %d year = %d",car.model,car.horsePower,car.year);
}

- (void)namedInstance{
    ShinyCar *shinyCar = [[JSObjection defaultInjector] getObject:[ShinyCar class]];
    
    NSLog(@"shinyCar.rightHeadlight = %@",shinyCar.rightHeadlight);// 0
    
     BrightCar *brightCar = [[JSObjection defaultInjector] getObject:[BrightCar class]];
    
    NSLog(@"left == right ?? = %d",brightCar.leftHighbeam == brightCar.rightHighbeam);// 0
}


- (void)cycyleReference{
    //circular dependencies  are resolved between singletons
    
    SingletonFoo *foo = [[JSObjection defaultInjector] getObject:[SingletonFoo class]];
    SingletonBar *bar = [[JSObjection defaultInjector] getObject:[SingletonBar class]];
    NSLog(@"foo == bar.foo %d",foo == bar.foo);// 1
    NSLog(@"foo.bar == bar %d",foo.bar == bar);// 1
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
