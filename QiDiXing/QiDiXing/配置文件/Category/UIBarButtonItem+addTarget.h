//
//  UIBarButtonItem+addTarget.h
//  微享圈
//
//  Created by Mac on 15/12/3.
//  Copyright © 2015年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (addTarget)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
