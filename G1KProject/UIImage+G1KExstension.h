//
//  UIImage+G1KExstension.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/10.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (G1KExstension)


/**
 模糊效果

 @param image 图片
 @param blur  模糊度

 @return 返回一个模糊图片
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end
