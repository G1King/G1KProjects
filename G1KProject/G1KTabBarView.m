//
//  G1KTabBarView.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KTabBarView.h"
#import "G1KTabButton.h"
@interface G1KTabBarView ()

@end

@implementation G1KTabBarView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = KCTabBackGround;
    }
    
    return self;
}
-(NSMutableArray*)buttonArr{
    if (!_buttonArr) {
        _buttonArr = [NSMutableArray array];
    }
    return _buttonArr;
}
#pragma mark - 添加 item
-(void)addTabBarItem:(UITabBarItem *)tabBarItem{
    G1KTabButton * tabButton = [[G1KTabButton alloc]init];
    tabButton.item = tabBarItem;
    NSLog(@"===%@",tabBarItem.title);
    //可以自己定制 字体颜色
//    tabButton.titleColor
//    tabButton.selectTitleColor =
    // 添加到数组中
    [self.buttonArr addObject:tabButton];
    // 设置默认选中
    if(self.buttonArr.count==1){
        [self buttonClick:tabButton];
    }
    // 监听点击事件
    [tabButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    // 添加到tabbar上
    [self addSubview:tabButton];
    
    
}
-(void)buttonClick:(UIButton*)button{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.tabBarButton.tag to:button.tag];
    }
    self.tabBarButton.selected = NO;
    button.selected = YES;
    self.tabBarButton =(G1KTabButton*) button;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat height = 49;
    CGFloat width = self.bounds.size.width / self.buttonArr.count;// 一个按钮的宽度
    CGFloat Y = 0;
    
    for (int index = 0 ; index < self.buttonArr.count; index++) {
        G1KTabButton * button = self.buttonArr[index];
        button.frame = CGRectMake(index * width, Y, width, height);
        button.tag = index;
    }
    
    
}
@end
