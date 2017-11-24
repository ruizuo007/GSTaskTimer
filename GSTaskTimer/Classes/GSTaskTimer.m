//
//  GSTaskTimer.m
//  GSTaskTimer
//
//  Created by 沈龙 on 2017/11/23.
//

#import "GSTaskTimer.h"

NSTimeInterval const QLTaskTimerDefaultInterval = 1;

@implementation GSTaskTimer

@synthesize identifier = _identifier;
@synthesize timerQueue = _timerQueue;
@synthesize timerSource = _timerSource;

- (instancetype)initWithIdentifier:(NSString *)identifier {
    if (self = [super init]) {
        _identifier = identifier;
    }
    return self;
}

#pragma mark - Setters and Getters

- (NSString *)identifier {
    if (_identifier == nil) {
        _identifier = [[[NSBundle mainBundle] bundleIdentifier] stringByAppendingString:@".gstasktimer.default"];
    }
    return _identifier;
}

- (dispatch_queue_t)timerQueue {
    if (_timerQueue == nil) {
        _timerQueue = dispatch_queue_create([self.identifier UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return _timerQueue;
}

- (dispatch_source_t)timerSource {
    if (_timerSource == nil) {
        _timerSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.timerQueue);
        NSTimeInterval interval = self.timeInterval > 0 ? self.timeInterval : QLTaskTimerDefaultInterval;
        dispatch_source_set_timer(_timerSource, dispatch_time(DISPATCH_TIME_NOW, 0), interval * NSEC_PER_SEC, 0);
    }
    return _timerSource;
}

#pragma mark - Start Timer

- (void)executeWithBlock:(void (^)(void))executeBlock {
    self.executeBlock = executeBlock;
    [self execute];
}

- (void)execute {
    if (self.executeBlock == nil) {
        return;
    }
    dispatch_source_set_event_handler(self.timerSource, ^{
        self.executeBlock();
    });
    dispatch_resume(self.timerSource);
}

- (void)suspend {
    dispatch_suspend(self.timerSource);
}

@end
