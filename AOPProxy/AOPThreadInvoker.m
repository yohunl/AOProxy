//
//  AOPThreadInvoker.m
//  AOPProxy
//
//  Created by yohunl on 16/1/22.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "AOPThreadInvoker.h"

@implementation AOPThreadInvoker {
  NSThread *serializerThread;
}

- (id)initWithInstance:(id)anObject thread:(NSThread *)aThread {

  return self = [super initWithObject:anObject] ? serializerThread = aThread,
         self : nil;
}

- (void)invokeOriginalMethod:(NSInvocation *)anInvocation {

  [anInvocation performSelector:@selector(invoke)
                       onThread:serializerThread
                     withObject:nil
                  waitUntilDone:YES];
}

@end
