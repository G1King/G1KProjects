//
//  G1KCollectionViewCell.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/4.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol G1KCellDelegate <NSObject>

-(void)clcikItme:(UIButton*)item;

@end

@interface G1KCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UIButton * butt;
@property (nonatomic,weak) id<G1KCellDelegate>cellDelegate;

@end
