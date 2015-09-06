//
//  UIView+LS.m
//  Tumbli
//
//  Created by Sandy Lee on 4/22/14.
//  Copyright (c) 2014 iaomw. All rights reserved.
//

#import "UIView+FrameHelper.h"

@implementation UIView (FrameHelper)

- (CGSize)size {
    
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    
    CGPoint origin = self.frame.origin;
    
    [self setFrame:CGRectMake(origin.x, origin.y, size.width, size.height)];
}

- (CGFloat)width {
    
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width {
    
    [self setSize:CGSizeMake(width, self.height)];
}

- (CGFloat)height {
    
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height {
    
    [self setSize:CGSizeMake(self.width, height)];
}

//Getters

- (CGPoint)top {
    
    return CGPointMake(self.center.x, self.center.y-self.height/2);
}

- (CGPoint)bottom {
    
    return CGPointMake(self.center.x, self.center.y+self.height/2);
}

- (CGPoint)left {
    
    return CGPointMake(self.center.x-self.width/2, self.center.y);
}

- (CGPoint)right {
    
    return CGPointMake(self.center.x+self.width/2, self.center.y);
}

//Setters

- (void)setTop:(CGPoint)top {
    
    [self setCenter:CGPointMake(top.x, top.y+self.height/2)];
}

- (void)setBottom:(CGPoint)bottom {
    
    [self setCenter:CGPointMake(bottom.x, bottom.y-self.height/2)];
}

- (void)setLeft:(CGPoint)left {
    
    [self setCenter:CGPointMake(left.x+self.width/2, left.y)];
}

- (void)setRight:(CGPoint)right {
    
    [self setCenter:CGPointMake(right.x-self.width/2, right.y)];
}

//Getters

- (CGPoint)topLeft {
    
    return CGPointMake(self.center.x-self.width/2, self.center.y-self.height/2);
}

- (CGPoint)leftTop {
    
    return CGPointMake(self.center.x-self.width/2, self.center.y-self.height/2);
}

- (CGPoint)topRight {
    
    return CGPointMake(self.center.x+self.width/2, self.center.y-self.height/2);
}

- (CGPoint)rightTop {
    
    return CGPointMake(self.center.x+self.width/2, self.center.y-self.height/2);
}

- (CGPoint)bottomLeft {
    
    return CGPointMake(self.center.x-self.width/2, self.center.y+self.height/2);
}

- (CGPoint)leftBottom {
    
    return CGPointMake(self.center.x-self.width/2, self.center.y+self.height/2);
}

- (CGPoint)bottomRight {
    
    return CGPointMake(self.center.x+self.width/2, self.center.y+self.height/2);
}

- (CGPoint)rightBottom {
    
    return CGPointMake(self.center.x+self.width/2, self.center.y+self.height/2);
}

//Setters

- (void)setTopLeft:(CGPoint)topLeft {
    
    [self setCenter:CGPointMake(topLeft.x+self.width/2, topLeft.y+self.height/2)];
}

- (void)setLeftTop:(CGPoint)leftTop {
    
    [self setCenter:CGPointMake(leftTop.x+self.width/2, leftTop.y+self.height/2)];
}

- (void)setTopRight:(CGPoint)topRight {
    
    [self setCenter:CGPointMake(topRight.x-self.width/2, topRight.y+self.height/2)];
}

- (void)setRightTop:(CGPoint)rightTop {
    
    [self setCenter:CGPointMake(rightTop.x-self.width/2, rightTop.y+self.height/2)];
}

- (void)setBottomLeft:(CGPoint)bottomLeft {
    
    [self setCenter:CGPointMake(bottomLeft.x+self.width/2, bottomLeft.y-self.height/2)];
}

- (void)setLeftBottom:(CGPoint)leftBottom {
    
    [self setCenter:CGPointMake(leftBottom.x+self.width/2, leftBottom.y-self.height/2)];
}

- (void)setBottomRight:(CGPoint)bottomRight {
    
    [self setCenter:CGPointMake(bottomRight.x-self.width/2, bottomRight.y-self.height/2)];
}

- (void)setRightBottom:(CGPoint)rightBottom {
    
    [self setCenter:CGPointMake(rightBottom.x-self.width/2, rightBottom.y-self.height/2)];
}

- (void)moveToTopOf:(UIView*)view withGap:(CGFloat)gap andAlign:(NSInteger)align {
    
    if (align==0) {
        
        CGPoint topLeft = [view topLeft];
        
        [self setBottomLeft:CGPointMake(topLeft.x, topLeft.y-gap)];
        
    } else if (align==1) {
        
        CGPoint top = [view top];
        
        [self setBottom:CGPointMake(top.x, top.y-gap)];
        
    } else if (align==2) {
        
        CGPoint topRight = [view topRight];
        
        [self setBottomRight:CGPointMake(topRight.x, topRight.y-gap)];
    }
}

- (void)moveToBottomOf:(UIView*)view withGap:(CGFloat)gap andAlign:(NSInteger)align {
    
    if (align==0) {
        
        CGPoint bottomLeft = [view bottomLeft];
        
        [self setTopLeft:CGPointMake(bottomLeft.x, bottomLeft.y+gap)];
        
    } else if (align==1) {
        
        CGPoint bottom = [view bottom];
        
        [self setTop:CGPointMake(bottom.x, bottom.y+gap)];
        
    } else if (align==2) {
        
        CGPoint bottomRight = [view bottomRight];
        
        [self setTopRight:CGPointMake(bottomRight.x, bottomRight.y+gap)];
    }
}

- (void)moveToLeftOf:(UIView*)view withGap:(CGFloat)gap andAlign:(NSInteger)align {
    
    if (align==0) {
        
        CGPoint leftTop = [view leftTop];
        
        [self setRightTop:CGPointMake(leftTop.x-gap, leftTop.y)];
        
    } else if (align==1) {
        
        CGPoint left = [view left];
        
        [self setRight:CGPointMake(left.x-gap, left.y)];
        
    } else if (align==2) {
        
        CGPoint leftBottom = [view leftBottom];
        
        [self setRightBottom:CGPointMake(leftBottom.x-gap, leftBottom.y)];
    }
}

- (void)moveToRightOf:(UIView*)view withGap:(CGFloat)gap andAlign:(NSInteger)align {
    
    if (align==0) {
        
        CGPoint rightTop = [view rightTop];
        
        [self setLeftTop:CGPointMake(rightTop.x+gap, rightTop.y)];
        
    } else if (align==1) {
        
        CGPoint right = [view right];
        
        [self setLeft:CGPointMake(right.x+gap, right.y)];
        
    } else if (align==2) {
        
        CGPoint rightBottom = [view rightBottom];
        
        [self setLeftBottom:CGPointMake(rightBottom.x+gap, rightBottom.y)];
    }
}

-(UIImage *)convertViewToImageWithoutBound
{
    CGSize size = self.bounds.size;
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        size = scrollView.contentSize;
    }
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:currentContext];
    // 从当前context中创建一个改变大小后的图片
    UIImage  *image = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    return image;
}

-(UIImage *)convertViewToImage
{
    CGSize size = self.bounds.size;
    size.width *= 2;
    size.height *= 2;
    return [self convertViewToImageWithSize:size];
}

-(UIImage *)convertViewToImageWithSize:(CGSize)size
{
//    UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContextWithOptions(size,YES,0.0f);
    //    UIGraphicsGetCurrentContext();
    //    [self.layer renderInContext:currentContext];
    [self drawViewHierarchyInRect:CGRectMake(0, 0, size.width, size.height) afterScreenUpdates:YES];
    // 从当前context中创建一个改变大小后的图片
    UIImage  *image = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    return image;
}

@end
