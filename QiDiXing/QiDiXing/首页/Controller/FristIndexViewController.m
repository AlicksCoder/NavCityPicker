//
//  FristIndexViewController.m
//  QiDiXing
//
//  Created by Alicks zhu on 2016/11/23.
//  Copyright © 2016年 HC. All rights reserved.
//

#import "FristIndexViewController.h"
#import "CityView.h"

@interface FristIndexViewController ()<CityViewDelegate>

@end

@implementation FristIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = nil;
    
    
    /*** 说明：
        1. "北京" 表示当无法获取城市，并且还没有选择城市的时候，默认的城市
        2. 当进行初始化时，会请求定位，获取城市，调用代理
        3. 该套件是一般放置于导航栏处
        4. 需要使用我其他的一些类 如： Account类（用于保存用户信息）， UIView+Controller.h类（直接调用view.controller)
        5. 不支持英文地名
        6. 建议使用真机测试
    
    */
    CityView *cView = [CityView CityViewWithCity:@"北京" andDelegate:self];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:cView];
    
    
}


-(void)cityView:(UIView *)cityView DidChangeCity:(NSString *)city{
    NSLog(@"%@",city);
}





@end
