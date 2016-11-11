//
//  G1KTabBarView.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class G1KTabButton;
@class G1KTabBarView;
@protocol G1KProtocol <NSObject>


-(void)tabBar:(G1KTabBarView * )tabBars didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface G1KTabBarView : UIView

/**
 底部的按钮

 @param tabBarItem 底部按钮
 */
-(void)addTabBarItem:(UITabBarItem*)tabBarItem;

/**
 选中哪个的按钮的索引
 */
@property (nonatomic,assign) NSInteger selectIndex;

/**
 底部一共多少按钮
 */
@property (nonatomic,strong) NSMutableArray * buttonArr;

/**
 tabbar 的背景颜色 如果不设置颜色  默认颜色 为白色
 */
@property (nonatomic,strong) UIColor * color;
@property (nonatomic,weak) G1KTabButton * tabBarButton;
@property (nonatomic,weak) id<G1KProtocol>delegate;
@end
