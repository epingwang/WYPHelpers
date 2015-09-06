//
//  UIView+LS.h
//  Tumbli
//
//  Created by 王易平 on 4/22/14.
//  Copyright (c) 2014 王易平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameHelper)

@property(assign, nonatomic)CGSize size;

@property(assign, nonatomic)CGFloat width;
@property(assign, nonatomic)CGFloat height;

@property(assign, nonatomic)CGPoint top;
@property(assign, nonatomic)CGPoint bottom;
@property(assign, nonatomic)CGPoint left;
@property(assign, nonatomic)CGPoint right;

@property(assign, nonatomic)CGPoint topLeft;
@property(assign, nonatomic)CGPoint leftTop;
@property(assign, nonatomic)CGPoint topRight;
@property(assign, nonatomic)CGPoint rightTop;

@property(assign, nonatomic)CGPoint bottomLeft;
@property(assign, nonatomic)CGPoint leftBottom;
@property(assign, nonatomic)CGPoint bottomRight;
@property(assign, nonatomic)CGPoint rightBottom;

- (void)moveToTopOf:(UIView*)view withGap:(CGFloat)gap andAlign:(NSInteger)align;
- (void)moveToBottomOf:(UIView*)view withGap:(CGFloat)gap andAlign:(NSInteger)align;

- (void)moveToLeftOf:(UIView*)view withGap:(CGFloat)gap andAlign:(NSInteger)align;
- (void)moveToRightOf:(UIView*)view withGap:(CGFloat)gap andAlign:(NSInteger)align;

-(UIImage *)convertViewToImageWithoutBound;

-(UIImage *)convertViewToImage;

-(UIImage *)convertViewToImageWithSize:(CGSize)size;

@end
