//
//  ViewController.m
//  CTTimerTool
//
//  Created by helios on 2019/7/4.
//  Copyright © 2019 ccccct. All rights reserved.
//

#import "ViewController.h"
#import "PQ_TimerManager.h"
#import "NSTimer+TimerBlock.h"

@interface ViewController ()

@property (nonatomic,strong) PQ_TimerManager *timerManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self firstMethond];
    
}

- (void)firstMethond{
    
    /**
     *  定时器触发时间为1秒，重复触发，
     */
    NSTimer *timer = [NSTimer timerActionWithSecond:1 isRepeat:YES Action:^{
        NSLog(@"定时器重复触发");
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    /**
     *  定时器触发时间为1秒，触发次数为4次
     */
    NSTimer *timer1 = [NSTimer timerActionWithSecond:1 count:4 Action:^{
        NSLog(@"定时器有限次数触发");
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSRunLoopCommonModes];
}

- (void)secondMethond{
    
    //创建一个定时器
    self.timerManager = [PQ_TimerManager pq_createTimerWithType:PQ_TIMERTYPE_CREATE_OPEN updateInterval:3 repeatInterval:1 update:^{
        
    }];
    
    
    //开始计时
    [self.timerManager pq_open];
    
    //关闭计时
    [self.timerManager pq_close];
    
    //暂停计时
    [self.timerManager pq_pause];
    
    //继续计时
    [self.timerManager pq_start];
    
    //把计时器归零
    [self.timerManager pq_updateTimeIntervalToZero];
}

@end
