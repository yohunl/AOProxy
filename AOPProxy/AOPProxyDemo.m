//
//  AOPProxyDemo.m
//  AOPProxy
//
//  Created by yohunl on 16/1/22.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "AOPMethodLogger.h"
#import "AOPProxyDemo.h"
@implementation AOPProxyDemo
static AOPProxyDemo *retainer;

- (id)init {
    self = [super init];
    if (self) {
        _strongProperty = NSMutableArray.new;
        _proxy = [AOPMethodLogger proxyWithObject:_strongProperty];
        [_proxy interceptMethodForSelector:@selector(addObjectsFromArray:)
                          interceptorPoint:InterceptPointEnd
                                     block:^(NSInvocation *inv,
                                             InterceptionPoint intPt) {
                                         printInvocation(inv, intPt);
                                         
                                     }];
    }
    return self;
}

+ (void)addInterceptor:(NSInvocation *)i {
    printInvocation(i, InterceptPointStart);
}
+ (void)removeInterceptor:(NSInvocation *)i {
    printInvocation(i, InterceptPointEnd);
}
+ (void)testProxy:(id)proxy {
    
    [proxy interceptMethodStartForSelector:@selector(addObject:)
                     withInterceptorTarget:self
                       interceptorSelector:@selector(addInterceptor:)];
    
    [proxy interceptMethodEndForSelector:@selector(removeObjectAtIndex:)
                   withInterceptorTarget:self
                     interceptorSelector:@selector(removeInterceptor:)];
    
    [proxy interceptMethodForSelector:@selector(count)
                     interceptorPoint:InterceptPointStart
                                block:^(NSInvocation *i, InterceptionPoint p) {
                                    printInvocation(i, p);
                                }];
    
    retainer = retainer ?: self.new;
    
    [(id)proxy addObject:@1];
    [(id)proxy removeObjectAtIndex:0];
    [(id)proxy count];
    [retainer.proxy addObjectsFromArray:@[ @2, @3 ]];
}

void printInvocation(NSInvocation *i, InterceptionPoint p) { // Logger
    
    NSLog(@"%s -[__NSArrayM %s] intercepted with custom interceptor!\n",
          p == InterceptPointStart ? "START" : "  END",
          NSStringFromSelector(i.selector).UTF8String);
}

@end
