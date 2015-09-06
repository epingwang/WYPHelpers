//
//  UIControl+RemoveAllTargetAction.m
//  NZProject
//
//  Created by 王易平 on 5/16/14.
//  Copyright (c) 2014 王易平. All rights reserved.
//

#import "UIControl+RemoveAllTargetAction.h"

@implementation UIControl (RemoveAllTargetAction)

-(void)removeAllTargetActionForControlEvent:(UIControlEvents)controlEvent
{
    NSSet *targets = [self allTargets];
    for (id target in targets) {
        NSArray *actionArray = [self actionsForTarget:target forControlEvent:controlEvent];
        for (NSString *actionStr in actionArray) {
            SEL action = NSSelectorFromString(actionStr);
            [self removeTarget:target action:action forControlEvents:controlEvent];
        }
    }
}

@end
