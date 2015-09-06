//
//  UIView+FrameDiscription.m
//  NZProject
//
//  Created by 王易平 on 7/9/14.
//  Copyright (c) 2014 王易平. All rights reserved.
//

#import "UIView+FrameDiscription.h"

@implementation UIView (FrameDiscription)

-(NSString *)frameDiscription
{
    NSString *dest = [NSString stringWithFormat:@"frame = {%f, %f, %f, %f}", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height];
    return dest;
}

@end
