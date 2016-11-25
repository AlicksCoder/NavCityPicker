//
//  BaseNavigationController.m
//  Inspiration
//
//  Created by Alicks zhu on 2016/11/14.
//  Copyright © 2016年 HC. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

+ (void)initialize
{
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}


-(void)viewDidLoad{
    
    self.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"blueBg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.translucent = NO;
}


/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置左边的返回按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_houtuibai"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_houtui"] forState:UIControlStateHighlighted];
        CGSize size = btn.currentBackgroundImage.size;
        btn.bounds = CGRectMake(0, 0, size.height, size.width);
        viewController.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    
    
    [super pushViewController:viewController animated:animated];
}

@end
