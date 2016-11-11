//
//  G1KPlayerViewController.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/10.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "G1KMusicModel.h"
#import "G1KRotaionView.h"
#import "UIImage+G1KExstension.h"
typedef NS_ENUM(NSUInteger, G1KPlayType) {
    G1K_PlaySingle=0,//单曲循环
    G1K_PlayRandom,// 随机播放
    G1K_PlayOrder,// 顺序播放
};
@interface G1KPlayerViewController : UIViewController

@property (nonatomic,strong) G1KRotaionView * roationView;//旋转view
@property (nonatomic,strong) MBProgressHUD * proHud;//提示
@property (weak, nonatomic) IBOutlet UIImageView *bgImageview;

/**
 单例模式 - -
 */
X_SINGLETON_DEC(G1KPlayerViewController);

/**
 开始播放
 */
-(void)g1k_StartMusic;

/**
 暂停播放
 */
-(void)g1k_StopMusic;

/**
 下一曲
 */
-(void)g1k_NextMusic;

/**
 上一曲
 */
-(void)g1k_UpMusic;

/**
 快进 - -汉语拼音！！！
 */
-(void)g1k_KuaiJing;

/**
 歌曲模型
 
 @param aArr   歌曲模型
 @param aIndex 点击的哪个歌曲
 */
-(void)setArrModel:(NSArray *) aArr indexModel:(NSInteger) aIndex;
@end
