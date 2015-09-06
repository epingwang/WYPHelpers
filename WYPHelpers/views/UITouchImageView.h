//
//  UITouchImageView.h
//  NZProject
//
//  Created by 王易平 on 5/15/14.
//  Copyright (c) 2014 NuZan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITouchImageView : UIImageView

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;

-(void) addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
-(void) removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
