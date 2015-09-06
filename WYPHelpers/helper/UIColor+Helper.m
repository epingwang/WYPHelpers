//
//  UIColor+LS.m
//  Tumbli
//
//  Created by 王易平 on 4/22/14.
//  Copyright (c) 2014 王易平. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

+ (UIColor*)colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b A:(CGFloat)a {
    
            CGFloat d = 255.0f;
    
    return [UIColor colorWithRed:r/d green:g/d blue:b/d alpha:a/d];
}

+ (UIColor *)ColorFromRGB:(NSInteger)rgbValue
{
    return  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

@end
