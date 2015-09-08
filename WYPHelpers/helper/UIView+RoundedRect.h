//
//  UIView+RoundedRect.h
//  NZProject
//
//  Created by 王易平 on 5/9/14.
//  Copyright (c) 2014 王易平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RoundedRect)

-(void) roundedRectWithRadius:(float) radius;

-(void) roundView;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@end
