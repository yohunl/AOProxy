//
//  AOPThreadInvoker.h
//  AOPProxy
//
//  Created by yohunl on 16/1/22.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "AOPProxy.h"

@interface AOPThreadInvoker : AOPProxy
- (id)initWithInstance:(id)x thread:(NSThread *)t;
@end
