//
//  G1KPlayerViewController+G1KExtension.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/10.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KPlayerViewController+G1KExtension.h"
#import "UIImage+ImageEffects.h"
static CGFloat topHeight = 64.0+20.0;
static CGFloat downHeight = 100.0+16.0;
@implementation G1KPlayerViewController (G1KExtension)
-(void)createRotaionView{
    self.roationView = [[G1KRotaionView alloc]init];
    self.roationView.g1k_View.image = [UIImage imageNamed:@"iconSong"];
    [self.view addSubview:self.roationView];
}
-(void)setImage:(G1KMusicModel *)model{
    [self.roationView start];
//    [self.bgImageview setImage:[UIImage imageNamed:@"bgMohu"]];
    self.bgImageview.image = [UIImage imageNamed:@"bgMohu.png"];
    [self.roationView.g1k_View sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"iconSong"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            self.bgImageview.image = [image applyDarkEffect];
            
        }
    }];
}
-(void)setRotaionViewFrame{
    CGFloat height_i4 = SCREEN_HEIGHT - topHeight - downHeight;
    if (SCREEN_HEIGHT < 500) {
        self.roationView.frame = CGRectMake(0, 0, height_i4*0.8, height_i4*0.8);
    }else{
        self.roationView.frame = CGRectMake(0, 0, SCREEN_WIDTH *0.8, SCREEN_WIDTH*0.8);
    }
    self.roationView.center = CGPointMake(SCREEN_WIDTH/2, height_i4/2 + topHeight);
    [self.roationView setRotaionView:self.roationView.frame];
}
@end
