//
//  G1KTopTabView.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KTopTabView.h"

#define BUTTON_TAG 100
@interface G1KTopTabView ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView * scrollview;
@property (nonatomic,strong) NSMutableArray * g1k_Array;
@end

@implementation G1KTopTabView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // add
        self.backgroundColor = KCTabBackGround;
       
    }
    return self;
}
-(void)setUI{
    [self addSubview:self.scrollview];
//    NSLog(@"%ld===%zd",self.g1k_Array.count,self.titlesArr.count);
    CGFloat total;
    CGFloat index = 0;
    
//    SCREEN_WIDTH
    
    for (int i = 0; i<self.g1k_Array.count; i++) {
        NSString * titles = self.g1k_Array[i];
        
        UIButton * button = [[UIButton alloc]init];
        button.backgroundColor = [UIColor redColor];
        button.titleLabel.font =[UIFont systemFontOfSize:9];
        button.frame = CGRectMake(index, 0, [self stringSize:titles].width + self.space, self.frame.size.height);
        [button setTitle:titles forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClikc:) forControlEvents:UIControlEventTouchDown];
        button.tag = BUTTON_TAG+i;
        index += [self stringSize:titles].width + self.space;
        [self.scrollview addSubview:button];
    }
        total += self.space;
    NSString * str = [self.g1k_Array componentsJoinedByString:@""];
    self.scrollview.contentSize = CGSizeMake( SCREEN_WIDTH * 3, self.frame.size.height);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
-(void)buttonClikc:(UIButton *)button{
    NSInteger index = button.tag - BUTTON_TAG;
    if ([self.delegate respondsToSelector:@selector(clickTopItemView:indexOf:)]) {
        [self.delegate clickTopItemView:self indexOf:index];
    }
}
-(CGSize)stringSize:(NSString*)string
{
    CGSize detailSize = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.font]} context:nil].size;
    return detailSize;
}
-(UIScrollView *)scrollview{
    if (!_scrollview) {
        _scrollview = [[UIScrollView alloc]init];
        _scrollview.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _scrollview.backgroundColor = [UIColor whiteColor];
        _scrollview.delegate = self;
    }
    return _scrollview;
}
-(void)setTitlesArr:(NSArray *)titlesArr{
    _titlesArr = titlesArr;
     self.g1k_Array = [NSMutableArray arrayWithArray:titlesArr];
     [self setUI];
    
}
@end
