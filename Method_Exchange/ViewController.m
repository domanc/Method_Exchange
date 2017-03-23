//
//  ViewController.m
//  Method_Exchange
//
//  Created by Doman on 17/3/23.
//  Copyright © 2017年 doman. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Method.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //分类实现:
//    UIImage *image = [UIImage cdm_imageNamed:@"cdm"];
    
    //运行时实现:
    //调用imageNamed:实际上是调用cdm_imageNamed:
    UIImage *image = [UIImage imageNamed:@"cdm"];
    
}


@end
