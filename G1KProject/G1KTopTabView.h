//
//  G1KTopTabView.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class G1KTopTabView;
@protocol G1KTopDelegate <NSObject>
-(void)clickTopItemView:(G1KTopTabView *)view indexOf:(NSInteger )index;

@end

@interface G1KTopTabView : UIView
@property (nonatomic,weak) id <G1KTopDelegate> delegate;

/**
  多少个标签
 */
@property (nonatomic,assign) NSArray * titlesArr;

/**
 字体大小
 */
@property (nonatomic,assign) NSInteger font;

/**
 正常字体颜色
 */
@property (nonatomic,strong) UIColor * normalColor;

/**
 选中或者点中字体的颜色
 */
@property (nonatomic,strong) UIColor * selectColor;

/**
   每个item 的间距
 */
@property (nonatomic,assign) NSInteger  space;


@end
