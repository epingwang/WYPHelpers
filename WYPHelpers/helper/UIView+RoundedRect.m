//
//  UIView+RoundedRect.m
//  NZProject
//
//  Created by 王易平 on 5/9/14.
//  Copyright (c) 2014 王易平. All rights reserved.
//

#import "UIView+RoundedRect.h"

@implementation UIView (RoundedRect)

-(void)roundedRectWithRadius:(float)radius
{
    CALayer *layer = self.layer;
    layer.cornerRadius = radius;
    layer.masksToBounds = YES;
}

-(void)roundView
{
    float width = self.frame.size.width;
    [self roundedRectWithRadius:width/2.0f];
}

@end
