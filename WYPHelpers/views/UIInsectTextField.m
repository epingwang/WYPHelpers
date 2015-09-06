//
//  UIInsetTextField.m
//  NZProject
//
//  Created by 王易平 on 5/14/14.
//  Copyright (c) 2014 NuZan. All rights reserved.
//

#import "UIInsectTextField.h"

@implementation UIInsectTextField

@synthesize leftInsect = _leftInsect;
@synthesize rightInsect = _rightInsect;
@synthesize topInsect = _topInsect;
@synthesize bottomInsect = _bottomInsect;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    return self;
}

-(void)setLeftInsect:(float)leftInsect
{
    _leftInsect = leftInsect;
    [self setNeedsDisplay];
}

-(void)setRightInsect:(float)rightInsect
{
    _rightInsect = rightInsect;
    [self setNeedsDisplay];
}

-(void)setTopInsect:(float)topInsect
{
    _topInsect = topInsect;
    [self setNeedsDisplay];
}

-(void)setBottomInsect:(float)bottomInsect
{
    _bottomInsect = bottomInsect;
    [self setNeedsDisplay];
}

-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect ret = CGRectMake(bounds.origin.x + _leftInsect, bounds.origin.y + _topInsect, bounds.size.width - _leftInsect - _rightInsect, bounds.size.width - _topInsect - _bottomInsect);
    return ret;
}

-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return [self textRectForBounds:bounds];
}

-(CGRect)editingRectForBounds:(CGRect)bounds
{
    return [self textRectForBounds:bounds];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
