//
//  BaseViewController.h
//  WYPHelpers
//
//  Created by 王易平 on 15/5/8.
//  Copyright (c) 2015年 王易平. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SHOULD_UNLOAD_VIEW_IN_MEMORY_WARNING NO

extern NSString * const UIViewControllerDidDisappearNotification;

@interface BaseViewController : UIViewController

-(BOOL) isVisible;

@end
