//
//  G1KHomeViewController.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KHomeViewController.h"
#import "G1KTopTabView.h"
#import <AVFoundation/AVFoundation.h>
#import "G1KPageViewController.h"
@interface G1KHomeViewController ()<G1KTopDelegate>
@property (nonatomic ,strong)dispatch_source_t timer;
@end

@implementation G1KHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    G1KPageViewController * page = [[G1KPageViewController alloc]init];
    [page setTitleArr:@[@"全部",@"精选",@"影视",@"动漫",@"我的啊你",@"VR影视",@"hha",@"么么哒",@"嘿嘿嘿",@"好玩"]];
    [self.view addSubview:page.view];
    
 /*CFRunLoopObserverRef obser = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
    
     switch (activity) {
         case kCFRunLoopEntry:
             NSLog(@"runloop进入");
             break;
         case kCFRunLoopBeforeTimers:
             NSLog(@"runloop要去处理timer");
             break;
         case kCFRunLoopBeforeSources:
             NSLog(@"runloop要去处理Sources");
             break;
         case kCFRunLoopBeforeWaiting:
             NSLog(@"runloop要睡觉了");
             break;
         case kCFRunLoopAfterWaiting:
             NSLog(@"runloop醒来啦");
             break;
             
         case kCFRunLoopExit:
             NSLog(@"runloop退出");
             break;
         default:
         break;
     }
     
 });
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), obser, kCFRunLoopDefaultMode);
   [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(runs) userInfo:nil repeats:YES];
    CFRelease(obser);*/

      
    
}
//-(void)runs{
//    NSLog(@"run------run");
//}
//-(void)atimer{
//    NSTimeInterval period = 1.0; //设置时间间隔
//    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    
//    dispatch_source_set_timer(self.timer , dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
//    
//    dispatch_source_set_event_handler(self.timer , ^{
//        
//        //在这里执行事件
//        NSLog(@"sdssdfdf");
//        
//    });
//    
//    dispatch_resume(self.timer );
//}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//      [self atimer];
//    //0.创建队列
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    //1.创建GCD中的定时器
//    /*
//     第一个参数:创建source的类型 DISPATCH_SOURCE_TYPE_TIMER:定时器
//     第二个参数:0
//     第三个参数:0
//     第四个参数:队列
//     */
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    
//    //2.设置时间等
//    /*
//     第一个参数:定时器对象
//     第二个参数:DISPATCH_TIME_NOW 表示从现在开始计时
//     第三个参数:间隔时间 GCD里面的时间 纳秒
//     第四个参数:精准度(表示允许的误差,0表示绝对精准)
//     */
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.001 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//    
//    //3.要调用的任务
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"GCD-----");
//    });
//    
//    //4.开始执行
////    dispatch_resume(timer);
//    
//    
////    self.timer = timer;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
