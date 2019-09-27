//
//  ViewController.m
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

#import "ViewController.h"
#import "XLLTestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XLLTestView *testView = [[XLLTestView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 345)];
    testView.center = self.view.center;
    testView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:testView];
}


@end
