//
//  G1KTabButton.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KTabButton.h"
#define imageScale 0.6
@implementation G1KTabButton
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:kC6 forState:UIControlStateNormal];
        [self setTitleColor:kCHighLight forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:9];
        
        // bage
    }
    return self;
}
//-(instancetype)init{
//    if (self = [super init]) {
//        self.imageView.contentMode = UIViewContentModeCenter;
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self setTitleColor:kC6 forState:UIControlStateNormal];
//        [self setTitleColor:kCHighLight forState:UIControlStateSelected];
//        self.titleLabel.font = [UIFont systemFontOfSize:9];
//    }
//    return self;
//}
#pragma mark -- 去掉高亮状态
-(void)setHighlighted:(BOOL)highlighted{

}
#pragma mark - 调整图片frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height * imageScale;
    return CGRectMake(0, 4, w, h);
}
#pragma mark - 调整字体frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat y = contentRect.size.height * imageScale;
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height -y;
    return CGRectMake(0, y, w, h);
}
-(void)setItem:(UITabBarItem *)item{
    _item = item;
    // KVO
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}
-(void)dealloc{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}
#pragma mark - 属性变化时 相应变化
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    
    
}
@end
