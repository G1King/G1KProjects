//
//  G1KTopView.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/4.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KTopView.h"
#import "G1KCollectionViewCell.h"
@interface G1KTopView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,G1KCellDelegate>
@property (nonatomic,strong) UICollectionViewFlowLayout * layout;
@property (nonatomic,strong) UICollectionView * collectView;
@property (nonatomic,strong) NSMutableArray * g1k_Arr;
@property (nonatomic,strong) NSMutableArray * buttons;
@property (nonatomic,assign) NSInteger current;
@property (nonatomic,assign) CGFloat par;
@end
static NSString * const flag = @"G1K_CELL";
@implementation G1KTopView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.par = 0;
    }
    return self;
}
-(void)setUpUI{
    [self addSubview:self.collectView];
    [self.collectView registerClass:[G1KCollectionViewCell class] forCellWithReuseIdentifier:flag];
    [self.collectView reloadData];
//    for (NSString * ss in self.g1k_Arr) {
//        NSLog(@"ss==%@",ss);
//    }
    NSInteger index = 0;
    CGFloat offsetX = self.collectView.contentOffset.x;
    CGFloat width = CGRectGetWidth(self.collectView.frame);
    CGFloat pro = 0.5;
    G1KDirection dir = offsetX > self.par ? TYPagerControllerLeft:TYPagerControllerRight;
    if (dir==TYPagerControllerLeft) {
        index = offsetX / width + pro;
    }else{
        index = ceil(offsetX/width-pro);
    }
    if (index < 0) {
        index = 0;
    }else if (index >= self.g1k_Arr.count) {
        index = self.g1k_Arr.count-1;
    }
    
    // if index not same,change index
    if (index != self.current) {
        NSInteger fromIndex = self.current;
        self.current = index;
    }
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView==self.collectView) {
        self.par = scrollView.contentOffset.x;
    }
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.g1k_Arr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    G1KCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:flag forIndexPath:indexPath];
    NSString * str = self.g1k_Arr[indexPath.row];
    [cell.butt setTitle:str forState:UIControlStateNormal];
    [cell.butt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cell.butt setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    
//    [self fromCell:(indexPath.item == self.current ? nil : cell) toCell:(indexPath.item == self.current ? cell : nil)];
    return cell;
}
-(void)fromCell:(G1KCollectionViewCell*)fromCell toCell:(G1KCollectionViewCell*)toCell{
    if (fromCell) {
        [fromCell.butt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (toCell) {
        [toCell.butt setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",indexPath.row);
    
    
    return CGSizeMake(50, 30);
}
-(NSMutableArray*)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return YES;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"点击第%zd页",indexPath.row+1);
//    NSLog(@"%d===%d",indexPath.row,self.current);
//    if (self.indexBL) {
//        self.indexBL(indexPath.row);
//    }
//    G1KCollectionViewCell * cell =(G1KCollectionViewCell*) [self.collectView cellForItemAtIndexPath:indexPath];
//    if (self.current==indexPath.row) {
//        cell.butt.selected=YES;
//    }else{
//        cell.butt.selected = NO;
//    }
//     self.current = indexPath.row;
//    NSLog(@"====>%ld",self.current);
    NSArray * cells  = [self.collectView subviews];
    int temp = 0;
    for (id cell1 in cells) {
        if ([cell1 isKindOfClass:[G1KCollectionViewCell class]]) {
            G1KCollectionViewCell *cell = cell1;
            if ([self.collectView indexPathForCell:cell].row == indexPath.row) {
                if (temp == 0) {
                    cell.butt.selected = YES;
                }else{
                    cell.butt.selected = NO;
                }
                temp++;
            }else{
                cell.butt.selected = NO;
            }
        }
    }
    
//    G1KCollectionViewCell * cell = (G1KCollectionViewCell*)[self.collectView cellForItemAtIndexPath:indexPath];
//   
//    NSArray * cells  = [self.collectView visibleCells];
//    for (G1KCollectionViewCell * cell in cells) {
//        if ([self.collectView indexPathForCell:cell].row == indexPath.row) {
//            cell.butt.selected = YES;
//        }else{
//            cell.butt.selected= NO;
//        }
//    }
           //   sef.collectView scrollToItemAtIndexPath:(nonnull NSIndexPath *) atScrollPosition:(UICollectionViewScrollPosition) animated:<#(BOOL)#>
}

-(void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    for (NSString * titl in dataArr) {
        NSLog(@"%@",titl);
    }
    self.g1k_Arr = [NSMutableArray arrayWithArray:dataArr];
    [self setUpUI];
    
}
#pragma mark - lazy 
-(UICollectionViewFlowLayout*)layout{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _layout;
}
-(UICollectionView*)collectView{
    if (!_collectView) {
        _collectView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:self.layout];
        _collectView.dataSource = self;
        _collectView.delegate = self;
        _collectView.backgroundColor = [UIColor whiteColor];
    }
    return  _collectView;
}
@end
