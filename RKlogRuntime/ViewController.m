//
//  ViewController.m
//  RKlogRuntime
//
//  Created by rankilau on 2017/3/26.
//  Copyright © 2017年 rankilau. All rights reserved.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"
#import "RKLogUploader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1 = ({
        UIButton *btn = [UIButton new];
        btn.backgroundColor = [UIColor redColor];
        [btn addTarget:self action:@selector(btn1DidClick:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.height.equalTo(@40);
    }];
    
    UIButton *btn2 = ({
        UIButton *btn = [UIButton new];
        btn.backgroundColor = [UIColor orangeColor];
        [btn addTarget:self action:@selector(btn2DidClick:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(50);
        make.width.height.equalTo(@40);
    }];
        
}

- (void)btn1DidClick:(id)sender
{
    NSLog(@"btn1DidClick");
}

- (void)btn2DidClick:(id)sender
{
     NSLog(@"btn2DidClick");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
