//
//  NSDecimalNumber+MathEnhance.m
//  PAQZZ
//
//  Created by william mu on 13-12-30.
//  Copyright (c) 2013年 平安付. All rights reserved.
//

#import "NSDecimalNumber+MathEnhance.h"

@implementation NSDecimalNumber (MathEnhance)

/**
 *  获取 两数 之差
 * eg://NSLog(@"%@",decimalNumberSubtractWithBig([NSString stringWithFormat:@"%f",a], [NSString stringWithFormat:@"%d",b]));
 *
 *  @param bigValue   减数
 *  @param smallValue 被减数
 *
 *  @return 结果
 */
+(NSString *)decimalNumberMinus:(NSString *)bigValue small:(NSString *)smallValue

{
    
    NSDecimalNumber *bigNumber;
    if (bigValue) {
        bigNumber = [NSDecimalNumber decimalNumberWithString:bigValue];
    }else{
        bigNumber =[NSDecimalNumber zero];
    }
    
    NSDecimalNumber *smallNumber;
    if (smallValue) {
        smallNumber = [NSDecimalNumber decimalNumberWithString:smallValue];
    }else{
        smallNumber =[NSDecimalNumber zero];
    }
    
    NSDecimalNumber *product = [bigNumber decimalNumberBySubtracting:smallNumber];
    
    return [product stringValue];
    
}


/**
 *  获取 若干数 之 和
 *
 *  @param value1   加数
 *  @param addValue 被加数
 *
 *  @return 结果
 */
+(NSString *)decimalNumberPlus:(NSString *)value1 others:(NSString*)addValue, ...
{
    NSDecimalNumber *addNumber1;
    if (value1){
       addNumber1  = [NSDecimalNumber decimalNumberWithString:value1];
    }else{
        addNumber1 = [NSDecimalNumber zero];
    }
    
    NSDecimalNumber *product = addNumber1;
    
    va_list args;
    va_start(args, addValue);
    if (addValue) {
        NSDecimalNumber *otherNumber;
        if (addValue) {
            otherNumber = [NSDecimalNumber decimalNumberWithString:addValue];
        }else{
            otherNumber =[NSDecimalNumber zero];
        }
        product = [product  decimalNumberByAdding:otherNumber];
        
        
        NSString *other;
        while ((other = va_arg(args, NSString *))) {
            
            NSDecimalNumber *otherNumber;
            if (other) {
                otherNumber = [NSDecimalNumber decimalNumberWithString:other];
            }else{
                otherNumber =[NSDecimalNumber zero];
            }
            product = [product  decimalNumberByAdding:otherNumber];
            
        }
        
    }
    va_end(args);
    
    
    return [product stringValue];
}

+(NSString *)decimalNumberMultiply:(NSString *)value1 other:(NSString *)otherValue, ...{
    
    
    NSDecimalNumber *addNumber1;
    if (value1){
        addNumber1  = [NSDecimalNumber decimalNumberWithString:value1];
    }else{
        addNumber1 = [NSDecimalNumber one];
    }
    
    NSDecimalNumber *product = addNumber1;
    
    va_list args;
    va_start(args, otherValue);
    if (otherValue) {
        NSDecimalNumber *otherNumber;
        if (otherValue) {
            otherNumber = [NSDecimalNumber decimalNumberWithString:otherValue];
        }else{
            otherNumber =[NSDecimalNumber one];
        }
        product = [product  decimalNumberByMultiplyingBy:otherNumber];
        
        
        NSString *other;
        while ((other = va_arg(args, NSString *))) {
            
            NSDecimalNumber *otherNumber;
            if (other) {
                otherNumber = [NSDecimalNumber decimalNumberWithString:other];
            }else{
                otherNumber =[NSDecimalNumber one];
            }
            product = [product  decimalNumberByMultiplyingBy:otherNumber];
            
        }
        
    }
    va_end(args);
    
    
    return [product stringValue];
    
    return nil;
}

/**
 *  金额    分long->元String
 *
 *  @param pMoney 分long
 *
 *  @return 元string
 */
+ (NSString *)pointToMoney:(long)pMoney {
    NSMutableString *pp = [NSMutableString stringWithFormat:@"%ld", pMoney];
    if (pp.length > 2) {
        [pp insertString:@"." atIndex:pp.length - 2];
    }
    else if (pp.length == 2) {
        [pp insertString:@"0." atIndex:0];
    }
    else if (pp.length == 1) {
        [pp insertString:@"0.0" atIndex:0];
    }
    else {
        return @"";
    }
    return pp;
}
/**
 *  元double -> 分long
 *
 *  @param money 金额
 *
 *  @return 分
 */
+ (long)moneyToPoint:(double)money {
    NSString *tt = [NSString stringWithFormat:@"%.2f", money];
    NSString *temp = [tt stringByReplacingOccurrencesOfString:@"." withString:@""];
    return [temp longLongValue];
}


@end
