//
//  AOPMethodLogger.m
//  AOPProxy
//
//  Created by yohunl on 16/1/22.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "AOPMethodLogger.h"

@implementation AOPMethodLogger
- (void)invokeOriginalMethod:(NSInvocation *)inv {
    
    const char *sels = NSStringFromSelector(inv.selector).UTF8String,
    *cls = NSStringFromClass([inv.target class]).UTF8String;
    NSLog(@"START -[%s %s] args:%ld returns:%s", cls, sels,
          inv.methodSignature.numberOfArguments,
          inv.methodSignature.methodReturnType);
    [super invokeOriginalMethod:inv];
    NSLog(@"END -[%s %s] args:%ld returns:%s", cls, sels,
          inv.methodSignature.numberOfArguments,
          inv.methodSignature.methodReturnType);
}
@end
