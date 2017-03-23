//
//  UIImage+Method.m
//  Method_Exchange
//
//  Created by Doman on 17/3/23.
//  Copyright © 2017年 doman. All rights reserved.
//

#import "UIImage+Method.h"
#import <objc/runtime.h>

@implementation UIImage (Method)


+(void)load
{
    // 交换方法实现,方法都是定义在类里面
    // class_getInstanceMethod:获取对象
    // class_getClassMethod:获取类方法
    // IMP:方法实现
    
    // imageNamed
    // Class:获取哪个类方法
    // SEL:获取方法编号,根据SEL就能去对应的类找方法
    
    Method imageMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    Method cmd_imageMethod = class_getClassMethod([UIImage class], @selector(cdm_imageNamed:));
    
    //方法交换
    method_exchangeImplementations(imageMethod, cmd_imageMethod);
}

//运行时

+(UIImage *)cdm_imageNamed:(NSString *)imageName
{
    //修改为我们自己的方法，防止死循环
    UIImage *image=[UIImage cdm_imageNamed:imageName];
    
    //然后实现功能【判断是否为空】
    if (image==nil) {
        NSLog(@"图片为空");
    }
    return image;
}

/*
+(UIImage *)cdm_imageNamed:(NSString *)imageName
{
    //首先加载图片
    UIImage *image=[UIImage imageNamed:imageName];
    
    //然后实现功能【判断是否为空】
    
    if (image==nil) {
        NSLog(@"图片为空");
    }
    return image;
}
*/

@end
