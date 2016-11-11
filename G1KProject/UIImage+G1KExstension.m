//
//  UIImage+G1KExstension.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/10.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "UIImage+G1KExstension.h"
#import <Accelerate/Accelerate.h>
@implementation UIImage (G1KExstension)

+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage= [CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey]; [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}
@end
