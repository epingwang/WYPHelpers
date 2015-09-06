//
//  UITouchImageView.m
//  NZProject
//
//  Created by 王易平 on 5/15/14.
//  Copyright (c) 2014 NuZan. All rights reserved.
//

#import "UITouchImageView.h"

@interface UITouchImageView ()
{
    UIControl *_control;
}

@end

@implementation UITouchImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        if (!_control) {
            _control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            [self addSubview:_control];
            [_control setTranslatesAutoresizingMaskIntoConstraints:NO];
        }
    }
    return self;
}

-(id)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        if (!_control) {
            _control = [[UIControl alloc] init];
            [self addSubview:_control];
            [_control setTranslatesAutoresizingMaskIntoConstraints:NO];
        }
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[_control]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_control)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_control]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_control)]];
    }
    return self;
}

-(void)awakeFromNib
{
    self.userInteractionEnabled = YES;
    if (!_control) {
        _control = [[UIControl alloc] init];
        [self addSubview:_control];
        [_control setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[_control]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_control)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_control]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_control)]];
}


-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    self.target = target;
    self.action = action;
    [_control addTarget:self action:@selector(didTriggerAction) forControlEvents:controlEvents];
}

-(void) removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [_control removeTarget:self action:@selector(didTriggerAction) forControlEvents:controlEvents];
    self.target = nil;
    self.action = nil;
}

-(void) didTriggerAction
{
    [self.target performSelector:self.action withObject:self afterDelay:0];
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
