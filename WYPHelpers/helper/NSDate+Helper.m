//
//  NSDate+Helper.m
//  LiveRock
//
//  Created by 王易平 on 15/3/11.
//  Copyright (c) 2015年 王易平. All rights reserved.
//

#import "NSDate+Helper.h"
#import <NSDate+DateTools.h>

@implementation NSDate (Helper)

-(NSString *)stringOfWeekday
{
    NSInteger weekday = [self weekday];
    switch (weekday) {
        case 1:
            return @"周日";
            break;
        case 2:
            return @"周一";
            break;
        case 3:
            return @"周二";
            break;
        case 4:
            return @"周三";
            break;
        case 5:
            return @"周四";
            break;
        case 6:
            return @"周五";
            break;
        case 7:
            return @"周六";
            break;
            
        default:
            break;
    }
    return @"";
}

@end
