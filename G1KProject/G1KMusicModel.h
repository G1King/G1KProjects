//
//  G1KMusicModel.h
//  G1KProject
//
//  Created by Sobf Leo on 16/11/9.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <Foundation/Foundation.h>
//"music_id":10001,
//"name":"LIAR LIAR",
//"icon": "http://p3.music.126.net/THS5HMOjmKNDDCj9G0ROyQ==/1376588561547947.jpg",
//"fileName":"http://m2.music.126.net/dUZxbXIsRXpltSFtE7Xphg==/1375489050352559.mp3",
//"lrcName":"",
//"singer":"OH MY GIRL",
//"singerIcon":""

/**
 歌曲的模型
 */
@interface G1KMusicModel : NSObject

/**
 歌曲的名字
 */
@property (nonatomic,copy) NSString * name;

/**
 歌曲的地址
 */
@property (nonatomic,copy) NSString * fileName;

/**
  每个音乐的ID
 */
@property (nonatomic,copy) NSString * music_id;

/**
 播放页面的背景
 */
@property (nonatomic,copy) NSString * icon;

/**
 歌手的名字
 */
@property (nonatomic,copy) NSString * singer;

/**
 歌词是没有的 - -
 */
@property (nonatomic,copy) NSString * lrcName;

/**
 歌手的icon 也是没有的 - - 
 */
@property (nonatomic,copy) NSString * singerIcon;
@end
