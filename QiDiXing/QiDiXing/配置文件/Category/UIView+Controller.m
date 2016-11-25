//
//  UIView+Controller.m
//  Traveling
//
//  Created by ZHC on 16/6/13.
//  Copyright © 2016年 ZHC. All rights reserved.
//

#import "UIView+Controller.h"

@implementation UIView (Controller)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
