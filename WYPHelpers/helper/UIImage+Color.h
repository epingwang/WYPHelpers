//
//  UIImage+LS.h
//  Tumbli
//
//  Created by 王易平 on 6/13/14.
//  Copyright (c) 2014 王易平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage*)imageWithColor:(UIColor *)color AndSize:(CGSize)size;
+ (UIImage*)imageWithColor:(UIColor *)color size:(CGSize)size padding:(CGSize)padding;

+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;

@end
