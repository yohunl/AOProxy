//
//  ViewController.m
//  AOPProxy
//
//  Created by yohunl on 16/1/22.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "ViewController.h"
#import "AOPProxyDemo.h"
#import "AOPProxy.h"
#import "AOPMethodLogger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Normal proxy test (No implicit log)\n-----------------------------------\n");
    [AOPProxyDemo testProxy:[AOPProxy       proxyWithObject:NSMutableArray.new]];
    NSLog(@"\nLogging proxy test (Has inherent log)\n-------------------------------------\n");
    [AOPProxyDemo testProxy:[AOPMethodLogger proxyWithClass:NSMutableArray.class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
