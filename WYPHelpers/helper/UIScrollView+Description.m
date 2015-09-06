//
//  UIScrollView+Description.m
//  NZProject
//
//  Created by 王易平 on 7/9/14.
//  Copyright (c) 2014 王易平. All rights reserved.
//

#import "UIScrollView+Description.h"

@implementation UIScrollView (Description)

-(NSString *)contentSizeDescription
{
    NSString *dest = [NSString stringWithFormat:@"contentSize = {%.2f, %.2f}", self.contentSize.width, self.contentSize.height];
    return dest;
}

-(NSString *)contentOffsetDescription
{
    NSString *dest = [NSString stringWithFormat:@"contentOffset = {%.2f, %.2f}", self.contentOffset.x, self.contentOffset.y];
    return dest;
}

-(NSString *)edgeInsetDescription
{
    NSString *dest = [NSString stringWithFormat:@"edgeIndet = {T:%.2f, L:%.2f, B:%.2f, R:%.2f}", self.contentInset.top, self.contentInset.bottom, self.contentInset.bottom, self.contentInset.right];
    return dest;
}

@end
