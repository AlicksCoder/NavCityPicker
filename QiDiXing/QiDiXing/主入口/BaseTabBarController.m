//
//  BaseTabBarController.m
//  Inspiration
//
//  Created by Alicks zhu on 2016/11/14.
//  Copyright © 2016年 HC. All rights reserved.
//

#import "BaseTabBarController.h"
#import "FristIndexViewController.h"
#import "BaseNavigationController.h"

@interface BaseTabBarController () <UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegate = self;
    
    
    
    [self addChildVc:[[FristIndexViewController alloc]init] title:@"首页" image:@"" selectedImage:@""];
    
    
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    //    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式92183155
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //    textAttrs[NSForegroundColorAttributeName] = [UIFont systemFontOfSize:20];
    //    textAttrs[NSForegroundColorAttributeName] = HCColor(200, 85, 85);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
//    selectTextAttrs[NSForegroundColorAttributeName] = HCColor(0, 136, 243);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    //    childVc.view.backgroundColor = HCRandomColor;
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}



@end
