//
//  GSTaskTimer.h
//  GSTaskTimer
//
//  Created by 沈龙 on 2017/11/23.
//

#import <Foundation/Foundation.h>

/*! @brief 默认定时器周期，1秒 */
extern NSTimeInterval const QLTaskTimerDefaultInterval;

/*!
 
 @abstract      任务定时器，周期性执行特定任务
 
 @discussion    用于替代NSTimer
 
 */

@interface GSTaskTimer : NSObject

/*! @brief 定时器标识 */
@property (nonatomic, copy, readonly) NSString *identifier;
/*! @brief 顺序任务线程队列 */
@property (nonatomic, strong, readonly) dispatch_queue_t timerQueue;
/*! @brief 定时任务源 */
@property (nonatomic, strong, readonly) dispatch_source_t timerSource;
/*! @brief 定时器时间周期 */
@property (nonatomic, assign) NSTimeInterval timeInterval;
/*! @brief 需要执行的任务 */
@property (nonatomic, copy) void (^executeBlock)(void);

/*!
 
 @abstract      对象初始化
 
 @param         identifier 当前定时器对象标识
 
 */
- (instancetype)initWithIdentifier:(NSString *)identifier;

/*!
 
 @abstract      启动定时器，执行代码块
 
 @param         executeBlock 需要执行的代码块
 
 */
- (void)executeWithBlock:(void (^)(void))executeBlock;

/*!
 
 @abstract      启动定时器，执行代码块
 
 @discussion    此时如果 void (^executeBlock)(void) 有值，则执行
 
 */
- (void)execute;

/*!
 
 @abstract      挂起当前的定时器
 
 */
- (void)suspend;

@end
