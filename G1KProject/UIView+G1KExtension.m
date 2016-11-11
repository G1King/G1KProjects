//
//  UIView+G1KExtension.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/8.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "UIView+G1KExtension.h"

@implementation UIView (G1KExtension)
#pragma mark - X
-(void)setG1k_x:(CGFloat)g1k_x{
    CGRect frame = self.frame;
    frame.origin.x = g1k_x;
    self.frame = frame;
}
-(CGFloat)g1k_x{
    return self.frame.origin.x;
}
#pragma mark - Y
-(void)setG1k_y:(CGFloat)g1k_y{
    CGRect frame = self.frame;
    frame.origin.y = g1k_y;
    self.frame = frame;
}
-(CGFloat)g1k_y{
    return self.frame.origin.y;
}
#pragma mark - Size
-(void)setG1k_size:(CGSize)g1k_size{
    CGRect size = self.frame;
    size.size = g1k_size;
    self.frame = size;
    
}
-(CGSize)g1k_size{
    return self.frame.size;
}
#pragma mark - Origin
-(void)setG1k_origin:(CGPoint)g1k_origin{
    CGRect origin = self.frame;
    origin.origin = g1k_origin;
    self.frame = origin;
}
-(CGPoint)g1k_origin{
    return self.frame.origin;
}
#pragma mark - w
-(void)setG1k_width:(CGFloat)g1k_width{
    CGRect frame = self.frame;
    frame.size.width = g1k_width;
    self.frame = frame;
}
-(CGFloat)g1k_width{
    return self.frame.size.width;
}
#pragma mark - h
-(void)setG1k_height:(CGFloat)g1k_height{
    CGRect frame = self.frame;
    frame.size.height = g1k_height;
    self.frame = frame;
    
}
-(CGFloat)g1k_height{
    return self.frame.size.height;
}
@end
