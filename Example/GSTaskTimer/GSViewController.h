//
//  GSViewController.h
//  GSTaskTimer
//
//  Created by shenlong on 11/16/2017.
//  Copyright (c) 2017 shenlong. All rights reserved.
//

@import UIKit;
#import <GSTaskTimer/GSTaskTimer.h>

@interface GSViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *tickButton;

@property (nonatomic, assign) NSInteger maxTick;

@property (nonatomic, assign) NSInteger tick;

// 按钮倒计时
@property (nonatomic, strong) GSTaskTimer *taskTimerZero;
// 无限期运行定时器
@property (nonatomic, strong) GSTaskTimer *taskTimerOne;
// 与楼上同样标识的定时器
@property (nonatomic, strong) GSTaskTimer *taskTimerTwo;

@end
