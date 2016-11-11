//
//  G1KRotaionView.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/9.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KRotaionView.h"
#define ROTAION 6.0
@interface G1KRotaionView ()

@end

@implementation G1KRotaionView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
        self.g1k_View = [[UIImageView alloc]init];
        [self addSubview:self.g1k_View];
    }
    return self;
}
-(void)setRotaionView:(CGRect)frame{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = frame.size.width / 2.0f;
    self.g1k_View.frame = CGRectMake(ROTAION, ROTAION, frame.size.width-2*ROTAION, frame.size.height-2*ROTAION);
    self.g1k_View.layer.masksToBounds = YES;
    self.g1k_View.layer.cornerRadius = CGRectGetWidth(self.g1k_View.frame)/2.0f;
}
-(void)start{
    //添加动画
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue =[NSNumber numberWithFloat:M_PI * 2];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];//匀速
    animation.cumulative = NO;
    animation.repeatCount = FLT_MAX;
    animation.duration = 20.0f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;//动画结束后 会保持最后的状态
    [self.g1k_View.layer addAnimation:animation forKey:@"animation"];
    [self.g1k_View stopAnimating];
    self.g1k_View.layer.speed = 0.0f;
    
}
-(void)stop{
    CFTimeInterval pause = [self.g1k_View.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.g1k_View.layer.speed = 0.0f;
    self.g1k_View.layer.timeOffset = pause;
    
}
-(void)resume{
    CFTimeInterval pause = [self.g1k_View.layer timeOffset];
    self.g1k_View.layer.speed=1.0f;
    self.g1k_View.layer.timeOffset=0.0;
    self.g1k_View.layer.beginTime = 0;
    CFTimeInterval resume = [self.g1k_View.layer convertTime:CACurrentMediaTime() fromLayer:nil]-pause;
    self.g1k_View.layer.beginTime = resume;
}
-(void)removeSelf{
    [self.g1k_View.layer removeAllAnimations];
}
@end
