//
//  NSString+Helper.m
//  LiveRock
//
//  Created by 王易平 on 15/2/27.
//  Copyright (c) 2015年 王易平. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

+(BOOL)isEmpty:(NSString *)string
{
    if (!string || [string isEqualToString:@""]) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
