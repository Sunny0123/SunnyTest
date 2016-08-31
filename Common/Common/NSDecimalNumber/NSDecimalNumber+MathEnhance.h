//
//  NSDecimalNumber+MathEnhance.h
//  PAQZZ
//
//  Created by william mu on 13-12-30.
//  Copyright (c) 2013年 平安付. All rights reserved.
//

#import <Foundation/Foundation.h>

#define D2S(s)     [NSString stringWithFormat:@"%.2f",s]

@interface NSDecimalNumber (MathEnhance)

/**
 *  获取 两数 之差
 * eg://NSLog(@"%@",decimalNumberSubtractWithBig([NSString stringWithFormat:@"%f",a], [NSString stringWithFormat:@"%d",b]));
 *
 *  @param bigValue   减数
 *  @param smallValue 被减数
 *
 *  @return 结果
 */
+(NSString *)decimalNumberSubtractWithBig:(NSString *)bigValue small:(NSString *)smallValue;

/**
 *  获取 若干数 之 和
 *
 *  @param value1   加数
 *  @param addValue 被加数
 *
 *  @return 结果
 */
+(NSString *)decimalNumberAddWith:(NSString *)value1 others:(NSString*)addValue, ...;


/**
 *  金额    分long->元String
 *
 *  @param pMoney 分long
 *
 *  @return 元string
 */
+ (NSString *)pointToMoney:(long)pMoney;

/**
 *  元double -> 分long
 *
 *  @param money 金额
 *
 *  @return 分
 */
+ (long)moneyToPoint:(double)money;
@end
