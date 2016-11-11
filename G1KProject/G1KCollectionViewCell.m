//
//  G1KCollectionViewCell.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/4.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KCollectionViewCell.h"

@interface G1KCollectionViewCell ()

@end

@implementation G1KCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addTabTitleLabel];
        self.contentView.backgroundColor = KCTabBackGround;
        self.contentView.userInteractionEnabled = YES;
    }
    return self;
}
- (void)addTabTitleLabel
{
    
    UIButton * button = [[UIButton alloc]init];
    button.titleLabel.font = [UIFont systemFontOfSize:9];
    [self.contentView addSubview:button];
    button.userInteractionEnabled = NO;
    self.butt =button;
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.butt.frame = self.contentView.bounds;
}
@end
