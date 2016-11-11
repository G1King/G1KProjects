//
//  G1KPageViewController.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G1KPageViewController : UIViewController



/**
    滑动视图
 */
@property (nonatomic,strong) UIScrollView * g1k_ScrollView;

-(void)setTitleArr:(NSArray *)array;
@end
