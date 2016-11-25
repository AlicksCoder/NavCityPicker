//
//  CityView.h
//  Traveling
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 ZHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CityViewDelegate <NSObject>

-(void)cityView:(UIView *)cityView DidChangeCity:(NSString *)city;

@end


@interface CityView : UIView

@property (nonatomic, assign) id<CityViewDelegate> delegate;

@property (nonatomic, strong) UILabel *text_cityname;

@property (nonatomic, strong) UIImageView *img_arrow;

@property (nonatomic, strong) UIButton *btn_cover;

+(instancetype)CityViewWithCity:(NSString *)cityName andDelegate:(id<CityViewDelegate>)delegate;



@end
