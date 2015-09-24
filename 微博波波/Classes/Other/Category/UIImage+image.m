//
//  UIImage+image.m
//  微博波波
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 hanyuting. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+ (instancetype)imageWithOriginalName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
