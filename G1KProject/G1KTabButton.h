//
//  G1KTabButton.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G1KTabButton : UIButton
@property (nonatomic,strong) UITabBarItem * item;

/**
 字体颜色 默认字体 为9
 */
@property (nonatomic,strong) UIColor * titleColor;

/**
 选中时的颜色
 */
@property (nonatomic,strong) UIColor * selectTitleColor;
@end
