//
//  HYTTabBar.m
//  微博波波
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 hanyuting. All rights reserved.
//

#import "HYTTabBar.h"

@interface HYTTabBar ()

@property (nonatomic, weak) UIButton *plusButton;

@end

@implementation HYTTabBar

- (UIButton *)plusButton{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        //默认按钮尺寸跟背景图片一样大
        //sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
        [btn sizeToFit];
        
        _plusButton = btn;
        
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

//调整子控件的位置
//self.items UITabBarItem 模型，有多少个子控制器就有多少个UITabBarItem模型
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count + 1);
    CGFloat btnH = h;
    
    int i = 0;
    //调整系统自带的tabBar上得按钮位置
    for (UIView *tabBarButton in self.subviews) {
        //判断下是否是UITabBarButton
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
            
            btnX = i * btnW;
            
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            i ++;
        }
    }
    //设置添加按钮的位置
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5);
    //self.plusButton.bounds = CGRectMake(0, 0, self.plusButton.currentBackgroundImage.size.width, self.plusButton.currentBackgroundImage.size.height);
}

@end
