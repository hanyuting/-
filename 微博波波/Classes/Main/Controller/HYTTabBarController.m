//
//  HYTTabBarController.m
//  微博波波
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 hanyuting. All rights reserved.
//

#import "HYTTabBarController.h"
#import "UIImage+image.h"
#import "HYTTabBar.h"
@interface HYTTabBarController ()

@end

@implementation HYTTabBarController

//作用：加载类的时候调用
//什么时候调用:程序一启动的时候就会把所有的类加载进内存
+ (void)load{
    
}

//当第一次使用这个类或者使用子类的时候调用
//作用：初始化类
+ (void)initialize{
    //获取所有的tabBarItem外观标识
    //UITabBarItem *item = [UITabBarItem appearance];
    
    //获取当前这个类下面所有tabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:dic forState:UIControlStateSelected];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义tabBar
    HYTTabBar *tabBar = [[HYTTabBar alloc]initWithFrame:self.tabBar.frame];
    
    //利用KVC把readonly的属性改
    [self setValue:tabBar forKey:@"tabBar"];
    //管理所有子控制器
    [self setUpAllChildViewController];
}


#pragma mark -添加所有的子控制器
- (void)setUpAllChildViewController{
    //首页
    UIViewController *home = [[UIViewController alloc]init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];
    home.view.backgroundColor = [UIColor greenColor];
    //消息
    UIViewController *message = [[UIViewController alloc]init];
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"消息"];
    message.view.backgroundColor = [UIColor blueColor];
    //发现
    UIViewController *discover = [[UIViewController alloc]init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"发现"];
    discover.view.backgroundColor = [UIColor purpleColor];
    //我的
    UIViewController *profile = [[UIViewController alloc]init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我"];
    profile.view.backgroundColor = [UIColor greenColor];
}
#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)seledtedImage title:(NSString *)title{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    
    vc.tabBarItem.selectedImage = seledtedImage;
    vc.tabBarItem.badgeValue = @"10";
    
    [self addChildViewController:vc];
    
}
@end
