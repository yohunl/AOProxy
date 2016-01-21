//
//  AOPProxyDemo.h
//  AOPProxy
//
//  Created by yohunl on 16/1/22.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AOPProxyDemo : NSObject
@property   NSMutableArray * strongProperty;
@property               id   proxy;
+ (void)testProxy:(id)proxy;
@end
