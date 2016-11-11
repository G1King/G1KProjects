//
//  G1KTopView.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/4.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, G1KDirection) {
    TYPagerControllerLeft,
    TYPagerControllerRight
};

typedef void(^MyIndex)(NSInteger index);

@interface G1KTopView : UIView

@property (nonatomic,strong) NSMutableArray * dataArr;

@property (nonatomic,copy) MyIndex indexBL;
@end
