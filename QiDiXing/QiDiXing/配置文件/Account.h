//
//  Account.h
//  Inspiration
//
//  Created by Alicks zhu on 2016/11/14.
//  Copyright © 2016年 HC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Account : NSObject

/**
 *  唯一标识
 */
@property (copy, nonatomic) NSString *openid;


/**
 *  推送别名
 */
@property (copy, nonatomic) NSString *uid;


/**
 *  名称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  头像地址
 */
@property (nonatomic, copy) NSString *icon;

/**
 *  电话
 */
@property (nonatomic, copy) NSString *phone;

/**
 *  性别1男，2女
 */
@property (nonatomic, copy) NSString *sex;


/**
 *  用户选择的城市，当用户还没进行选择过的城市的时候，默认为定位到的城市。
 */
@property (nonatomic, copy) NSString *city;

/**
 *  用户当前定位的城市。  
 */
@property (nonatomic, copy) NSString *localCity;




/**
 *  设置中关闭了通知。1,表示关闭，2表示不关闭。默认不关闭。
 */
@property (nonatomic, copy) NSString *closeNoti;



/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(Account *)account;

/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (Account *)account;
@end
