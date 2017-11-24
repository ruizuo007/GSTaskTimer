//
//  GSViewController.m
//  GSTaskTimer
//
//  Created by shenlong on 11/16/2017.
//  Copyright (c) 2017 shenlong. All rights reserved.
//

#import "GSViewController.h"

@implementation GSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.maxTick = 30;
    [self.tickButton setTitle:[@(self.maxTick) stringValue] forState:UIControlStateNormal];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    static NSInteger one = 0;
    [self.taskTimerOne executeWithBlock:^{
        NSLog(@"定时器一: %ld", (long)++one);
    }];
    static NSInteger two = 0;
    [self.taskTimerTwo executeWithBlock:^{
        NSLog(@"定时器二: %ld", (long)++two);
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.taskTimerOne suspend];
    [self.taskTimerTwo suspend];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Setters and Getters

- (GSTaskTimer *)taskTimerZero {
    if (_taskTimerZero == nil) {
        NSString *identifier = [[[NSBundle mainBundle] bundleIdentifier] stringByAppendingString:@".gstasktimer.tick"];
        _taskTimerZero = [[GSTaskTimer alloc] initWithIdentifier:identifier];
    }
    return _taskTimerZero;
}

- (GSTaskTimer *)taskTimerOne {
    if (_taskTimerOne == nil) {
        _taskTimerOne = [[GSTaskTimer alloc] init];
    }
    return _taskTimerZero;
}

- (GSTaskTimer *)taskTimerTwo {
    if (_taskTimerTwo == nil) {
        _taskTimerTwo = [[GSTaskTimer alloc] init];
    }
    return _taskTimerTwo;
}

#pragma mark - Actions



- (IBAction)onTickAction:(UIButton *)sender {
    self.tick = [[sender titleForState:UIControlStateNormal] integerValue];
    [sender setEnabled:NO];
    [self.taskTimerZero executeWithBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.tick < 0) {
                [sender setEnabled:YES];
                [sender setTitle:[@(self.maxTick) stringValue] forState:UIControlStateNormal];
                [self.taskTimerZero suspend];
            } else {
                [sender setTitle:[@(self.tick--) stringValue] forState:UIControlStateNormal];
            }
        });
    }];
}

@end
