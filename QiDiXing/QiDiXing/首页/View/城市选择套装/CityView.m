//
//  CityView.m
//  Traveling
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 ZHC. All rights reserved.
//

#import "CityView.h"
#import "TLCityPickerController.h"
#import "HCLocationManager.h"
#import "Account.h"
#import "UIView+Controller.h"

@interface CityView ()<TLCityPickerDelegate>
@property (nonatomic, strong) HCLocationManager *locMgr;

@end

@implementation CityView

+(instancetype)CityViewWithCity:(NSString *)cityName andDelegate:(id<CityViewDelegate>)delegate{
    CityView *view = [[CityView alloc]init];
    view.delegate = delegate;
    view.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width*0.13, 35);
    view.text_cityname.text = cityName;
    view.text_cityname.textColor=[UIColor whiteColor];
    view.img_arrow.image=[UIImage imageNamed:@"btn_dingweihuiW"];
    [view.btn_cover addTarget:view action:@selector(changeLocal:) forControlEvents:UIControlEventTouchUpInside];
    [view getCurrentLocal];
    return view;
}


-(instancetype)init{
    if (self = [super init]) {
        
        _text_cityname=[[UILabel alloc] init];
        [self addSubview:_text_cityname];
        
        _img_arrow=[[UIImageView alloc]init];
        [self addSubview:_img_arrow];
        
        
        _btn_cover=[[UIButton alloc] init];
        [self addSubview:_btn_cover];
        
        [self setup];
    }
    return self;
}

-(void)setup{
    
//    self.backgroundColor = HCColor(230, 230, 230);
    
    self.text_cityname.frame=CGRectMake(-4, 7, [UIScreen mainScreen].bounds.size.width*0.1, 20);
    self.text_cityname.text=[Account account].city;
    self.text_cityname.font = [UIFont systemFontOfSize:[UIScreen mainScreen].bounds.size.width*0.045];
    self.text_cityname.textColor=[UIColor whiteColor];
    //self.text_cityname.center=CGPointMake([UIScreen mainScreen].bounds.size.width*0.035, 17);
    self.text_cityname.textAlignment=NSTextAlignmentCenter;
    
    self.img_arrow.frame=CGRectMake(CGRectGetMaxX(self.text_cityname.frame), 8, 20, 20);
    //    self.img_arrow.center=CGPointMake([UIScreen mainScreen].bounds.size.width*0.10, 17);
    self.img_arrow.image=[UIImage imageNamed:@"btn_dingwei"];
    
    self.btn_cover.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width*0.13, 35);

}


-(void)getCurrentLocal{
    HCLocationManager *locMgr = [HCLocationManager manager];
    [locMgr startLoactionWithComplete:^(NSString *city, CLPlacemark *placemark, CLLocation *currentLocation, NSError *error) {
        if (error) {
            // HCLog(@"定位失败，%@",error);
            return ;
        }else{
            NSLog(@"GPS 定位成功----当前所在的城市为：%@ ",city);
            Account *user = [Account account];
            if (user) {
                user.localCity = city;
            }else{
                user = [[Account alloc]init];
                user.localCity = city;
            }
            [Account saveAccount:user];
            self.text_cityname.text = city;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(cityView:DidChangeCity:)]) {
                [self.delegate cityView:self DidChangeCity:city];
            }
            
        }
    }];
}



-(void)changeLocal:(UIButton *)btn{
    NSLog(@"%s",__func__);
    
    
    TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
    [cityPickerVC setDelegate:self];
    
    cityPickerVC.locationCityName = [Account account].localCity;
    cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
    
    [self.viewController presentViewController:[[UINavigationController alloc]initWithRootViewController:cityPickerVC] animated:YES completion:nil];
    
}



- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController
                didSelectCity:(TLCity *)city{

    [self saveCity:city.shortName];

    __weak CityView *wv = self;
    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        if (wv.delegate && [wv.delegate respondsToSelector:@selector(cityView:DidChangeCity:)]) {
            [wv.delegate cityView:wv DidChangeCity:city.shortName];
        }
    }];
    
}

- (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController{
    [cityPickerViewController dismissViewControllerAnimated:YES completion:nil];
}


-(void)saveCity:(NSString *)city{
    Account *user = [Account account];
    if (user) {
        user.city = city;
    }else{
        user = [[Account alloc]init];
        user.city = city;
    }
    [Account saveAccount:user];
    self.text_cityname.text = city;

}


@end
