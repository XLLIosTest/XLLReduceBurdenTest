//
//  SecondViewController.m
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

#import "SecondViewController.h"
#import "XLLTestedView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XLLTestedView *testView = [[XLLTestedView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 345)];
    testView.center = self.view.center;
    testView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:testView];
}

@end
