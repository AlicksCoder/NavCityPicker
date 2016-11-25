//
//  Account.m
//  Inspiration
//
//  Created by Alicks zhu on 2016/11/14.
//  Copyright © 2016年 HC. All rights reserved.
//

#import "Account.h"
#define AccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]
@implementation Account

//MJCodingImplementation
/**
 *  当一个对象要归档进沙盒中时，就会调用这个方法
 *  目的：在这个方法中说明这个对象的哪些属性要存进沙盒
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    [encoder encodeObject:self.openid forKey:@"openid"];
    [encoder encodeObject:self.icon forKey:@"icon"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.phone forKey:@"phone"];
    [encoder encodeObject:self.closeNoti forKey:@"isCloseNoti"];
    [encoder encodeObject:self.sex forKey:@"sex"];
    [encoder encodeObject:self.uid forKey:@"uid"];
    [encoder encodeObject:self.city forKey:@"city"];
    [encoder encodeObject:self.localCity forKey:@"localCity"];
}

/**
 *  当从沙盒中解档一个对象时（从沙盒中加载一个对象时），就会调用这个方法
 *  目的：在这个方法中说明沙盒中的属性该怎么解析（需要取出哪些属性）
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.openid    = [decoder decodeObjectForKey:@"openid"];
        self.icon   = [decoder decodeObjectForKey:@"icon"];
        self.name   = [decoder decodeObjectForKey:@"name"];
        self.phone  = [decoder decodeObjectForKey:@"phone"];
        self.closeNoti  = [decoder decodeObjectForKey:@"isCloseNoti"];
        self.sex = [decoder decodeObjectForKey:@"sex"];
        self.uid = [decoder decodeObjectForKey:@"uid"];
        self.city = [decoder decodeObjectForKey:@"city"];
        self.localCity = [decoder decodeObjectForKey:@"localCity"];
    }
    return self;
}


/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(Account *)account
{
    // 自定义对象的存储必须用NSKeyedArchiver，不再有什么writeToFile方法
    [NSKeyedArchiver archiveRootObject:account toFile:AccountPath];
}


/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (Account *)account
{
    // 加载模型
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountPath];
    if (!account) {
        account = [[Account alloc]init];
        account.closeNoti = @"2";
    }
    
    return account;
}


@end
