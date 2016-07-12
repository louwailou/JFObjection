//
//  JFSingletonItemHolder.h
//  JFObjection
//
//  Created by Sun on 16/7/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SingletonItem;

@interface JFSingletonItemHolder : NSObject
@property (nonatomic,strong)SingletonItem *singletonItem;
@end
@interface SingletonItem : NSObject
{
    
}
@end


