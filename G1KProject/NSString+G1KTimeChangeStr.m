//
//  NSString+G1KTimeChangeStr.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/9.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "NSString+G1KTimeChangeStr.h"

@implementation NSString (G1KTimeChangeStr)
+(NSString*)convert:(CGFloat)seconds{
    NSDateFormatter * formater= [[NSDateFormatter alloc]init];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:seconds];
    if (seconds / 3600 >=1) {
        [formater setDateFormat:@"HH:mm:ss"];
    }else{
        [formater setDateFormat:@"mm:ss"];
    }
    return [formater stringFromDate:date];
}
@end
