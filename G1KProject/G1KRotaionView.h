//
//  G1KRotaionView.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/9.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G1KRotaionView : UIView
@property (nonatomic,strong) UIImageView * g1k_View;
/**
 设置frame

 @param frame 形状
 */
-(void)setRotaionView:(CGRect)frame;

/**
 开始
 */
-(void)start;

/**
 暂停
 */
-(void)stop;

/**
 恢复
 */
-(void)resume;

/**
 移除
 */
-(void)removeSelf;
@end
