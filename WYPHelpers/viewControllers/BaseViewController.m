//
//  BaseViewController.m
//  WYPHelpers
//
//  Created by 王易平 on 15/5/8.
//  Copyright (c) 2015年 王易平. All rights reserved.
//

#import "BaseViewController.h"

NSString * const UIViewControllerDidDisappearNotification = @"com.LeTV.UIViewControllerDidDisappearNotification";

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@ Loaded", [self class]);
    
#if DEBUG
#if TARGET_IPHONE_SIMULATOR
//    [[SDStatusBarManager sharedInstance] enableOverrides];
#endif
#endif
}

-(void)dealloc
{
    NSLog(@"%@ Released", [self class]);
}

-(BOOL) isVisible
{
    return (self.isViewLoaded && self.view.window);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIViewControllerDidDisappearNotification object:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (SHOULD_UNLOAD_VIEW_IN_MEMORY_WARNING) {
        if (![self isVisible]) {
            [self.view removeFromSuperview];
            self.view = nil;
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
