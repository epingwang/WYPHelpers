//
//  UIImage+LS.m
//  NZProject
//
//  Created by Sandy Lee on 6/13/14.
//  Copyright (c) 2014 NuZan. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect {
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    return newImage;
}

+ (UIImage*)imageWithColor:(UIColor *)color AndSize:(CGSize)size {
    
    CGFloat r,g,b,a;
    
    [color getRed:&r green:&g blue:&b alpha:&a];
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, FALSE, 0.0);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(contextRef, r, g, b, a);
    
    CGContextFillRect(contextRef, rect);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}

+ (UIImage*)imageWithColor:(UIColor *)color size:(CGSize)size padding:(CGSize)padding {
    
    CGFloat r,g,b,a;
    
    [color getRed:&r green:&g blue:&b alpha:&a];
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, FALSE, 0.0);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(contextRef, 0, 0, 0, 0);
    CGContextFillRect(contextRef, rect);
    
    rect = CGRectInset(rect, padding.width*2, padding.height*2);
    
    CGContextSetRGBFillColor(contextRef, r, g, b, a);
    
    CGContextFillRect(contextRef, rect);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}

@end
