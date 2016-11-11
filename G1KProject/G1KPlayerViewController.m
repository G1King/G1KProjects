//
//  G1KPlayerViewController.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/10.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "G1KPlayerViewController+G1KExtension.h"
@interface G1KPlayerViewController ()
{
    
        BOOL _isPlaying;//播放状态
        BOOL _isRemove;// 移除通知的状态
        G1KPlayType _playModel;//播放模式
        AVPlayerItem * _playerItem;//播放item
        NSArray * _nomarArr;//歌曲数组
        NSArray * _randomArr;//随机歌曲数组
        G1KMusicModel *_playingModel;//正在播放的model
        CGFloat _totalTime;//播放总时间
        NSInteger _index;//播放标记索引
        id _playProgress;//播放进度观察者
}
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UILabel *singer;
@property (weak, nonatomic) IBOutlet UILabel *progressTime;
@property (weak, nonatomic) IBOutlet UIButton *playTypeBt;
@property (weak, nonatomic) IBOutlet UIButton *startOrStopBt;
@property (weak, nonatomic) IBOutlet UIButton *nextBt;
@property (weak, nonatomic) IBOutlet UIButton *downloadBt;
@property (weak, nonatomic) IBOutlet UIButton *upBt;
@property (weak, nonatomic) IBOutlet UILabel *allTime;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic,strong) AVPlayer * player;
@end
static G1KPlayerViewController *audio ;
@implementation G1KPlayerViewController

+(G1KPlayerViewController*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (audio==nil) {
            audio = [[G1KPlayerViewController alloc]init];
          
            audio.player = [[AVPlayer alloc]init];
            
            AVAudioSession *seeion = [AVAudioSession sharedInstance];
            [seeion setActive:YES error:nil];
            [seeion setCategory:AVAudioSessionCategoryPlayback error:nil];
            // 支持后台播放
        }
        
    });
    return audio;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.slider setThumbImage:[UIImage imageNamed:@"Slider_spot"] forState:UIControlStateNormal];
    [self createRotaionView];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self setRotaionViewFrame];
}
-(void)setArrModel:(NSArray *)aArr indexModel:(NSInteger)aIndex{
    _nomarArr = aArr;
    _randomArr = nil;
    _index = aIndex;
    [self updatePlayer];
}

#pragma mark - 创建播放器
-(void)updatePlayer{
    if (_isRemove) {
//        //c存在通知 kvo 需要移除
        [self removeNotifations];
        [self initValuses];
        _isRemove =NO;
    }
    
    G1KMusicModel * model ;
    if (_playModel==G1K_PlayRandom) {
        // 随机播放
        if (_randomArr.count==0) {
            // 随机播放数组为0
               model = [_nomarArr objectAtIndex:_index];
           _randomArr = [_nomarArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
               return arc4random() % _nomarArr.count;
           }];
        }else{
            // 随机播放数组不为0
            model = [_randomArr objectAtIndex:_index];
        }
    }else{
        model = [_nomarArr objectAtIndex:_index];
    }
    _playingModel = model;
    // 更新 歌手信息
    [self updateSingerMessage:model];
    _playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:model.fileName]];
    [self.player replaceCurrentItemWithPlayerItem:_playerItem];
    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self monitorPlayerStaus:_playerItem];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(finishPlayer:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    _isRemove = YES;// 存在通知
}
#pragma mark - remove notifation
-(void)removeNotifations{
    [self.player replaceCurrentItemWithPlayerItem:nil];
    [self.player removeTimeObserver:_playProgress];
    _playProgress = nil;
    [_playerItem removeObserver:self forKeyPath:@"status"];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}
-(void)initValuses{
    [self g1k_StopMusic];
    self.slider.value = 0;
    self.progressTime.text = @"00:00";
    
    [self.roationView removeSelf];
}
-(void)finishPlayer:(NSNotification*)obj{
    
    if (_playModel==G1K_PlaySingle) {
        AVPlayerItem * item = (AVPlayerItem*)[obj object];
        [item seekToTime:kCMTimeZero];
        [self.player play];
    }else{
        //默认播放完 下一曲
        [self g1k_NextMusic];
       
    }
}
#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    AVPlayerItem * item = (AVPlayerItem*)object;
    if ([keyPath isEqualToString:@"status"]) {
        if (_playerItem.status == AVPlayerStatusReadyToPlay) {
            // 播放
           
            float time = CMTimeGetSeconds(item.duration);
            [self setSliderValuse:time];
             [self g1k_StartMusic];
            // 监听播放状态
           
        }else if (_playerItem.status==AVPlayerStatusFailed){
            [self g1k_StopMusic];
        }
    }else if ([keyPath isEqualToString:@""]){
        
    }
}
#pragma mark - 
-(void)setSliderValuse:(float)value{
    _totalTime = value;
    self.slider.maximumValue =value;
    self.allTime.text = [NSString convert:value];
}
#pragma mark - 监听播放状态
-(void)monitorPlayerStaus:(AVPlayerItem*)item{
    Weak(self);
    
  _playProgress =  [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 30) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
         float everyTime = item.currentTime.value / item.currentTime.timescale;
         
      [weakself updaeSlider:everyTime];
     }];
    
}
-(void)updaeSlider:(float)time{
    self.slider.value = time;
    self.progressTime.text = [NSString convert:time];
    //设置 锁屏 信息
    [self setLockMessage:time playCurrentModel:_playingModel];
}
-(void)setLockMessage:(float)time playCurrentModel:(G1KMusicModel*)model{
    MPNowPlayingInfoCenter * center = [MPNowPlayingInfoCenter defaultCenter];
    NSMutableDictionary * info = [NSMutableDictionary dictionary];
    info[MPMediaItemPropertyAlbumTitle] = model.name;
    info[MPMediaItemPropertyArtist] = model.singer;
    MPMediaItemArtwork * work = [[MPMediaItemArtwork alloc]initWithImage:self.roationView.g1k_View.image];
    info[MPMediaItemPropertyArtwork] = work;
    info[MPMediaItemPropertyPlaybackDuration] = [NSNumber numberWithFloat:_totalTime];
    info[MPMediaItemPropertyPlaybackDuration] = [NSNumber numberWithFloat:time];
    center.nowPlayingInfo = info;
}
#pragma mark - 播放相关
-(void)g1k_StartMusic{
    _isPlaying = YES;
    [self.player play];
    [self.startOrStopBt setBackgroundImage:[UIImage imageNamed:@"MusicPlayer_play"] forState:UIControlStateNormal];
    [self.roationView resume];
}
-(void)g1k_StopMusic{
    _isPlaying = NO;
    [self.player pause];
    [self.startOrStopBt setBackgroundImage:[UIImage imageNamed:@"MusicPlayer_pause"] forState:UIControlStateNormal];
    [self.roationView stop];
}
-(void)g1k_UpMusic{
    if (_playModel!=G1K_PlaySingle) {
        _index--;
        if (_index<0) {
            _index = _nomarArr.count-1;
        }
    }
    [self updatePlayer];
}
-(void)g1k_KuaiJing{
    CMTime time = CMTimeMake(self.slider.value, 1);
    [_playerItem seekToTime:time];
}
-(void)g1k_NextMusic{
    if (_playModel!=G1K_PlaySingle) {
        _index++;
        if (_index ==_nomarArr.count) {
            _index = 0;
        }
        
    }
    [self updatePlayer];
}
#pragma mark - 更新 歌手信息
-(void)updateSingerMessage:(G1KMusicModel*)model{

    self.songName.text = [NSString stringWithFormat:@"%@", model.name];
   
    self.singer.text  = model.singer;
    
    [self setImage:model];
    
}
- (IBAction)backBt:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeSlider:(UISlider *)sender {
    [self g1k_KuaiJing];
}
- (IBAction)changePlayType:(UIButton *)sender {
    switch (_playModel) {
        case G1K_PlaySingle:
            _playModel = G1K_PlayOrder;
            [self.playTypeBt setBackgroundImage:[UIImage imageNamed:@"MusicPlayer_sort"] forState:UIControlStateNormal];
            
            break;
        case G1K_PlayOrder:{
            _playModel  = G1K_PlayRandom;
            [self.playTypeBt setBackgroundImage:[UIImage imageNamed:@"MusicPlayer_random"] forState:UIControlStateNormal];
            _randomArr = [_nomarArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                return arc4random() % _nomarArr.count;
            }];
        }
            break;
            case G1K_PlayRandom:
        
            _playModel = G1K_PlayOrder;
         
            [self.playTypeBt setBackgroundImage:[UIImage imageNamed:@"MusicPlayer_single"] forState:UIControlStateNormal];
        
            
            
            break;
        default:
            break;
    }
    
}
- (IBAction)upSong:(UIButton *)sender {
    [self g1k_UpMusic];
}
- (IBAction)startOrStop:(UIButton *)sender {
    if (_isPlaying) {
        [self g1k_StopMusic];
    }else{
        [self g1k_StartMusic];
    }
//    _isPlaying==YES ? [self g1k_StartMusic] : [self g1k_StopMusic];
}
- (IBAction)nextSong:(UIButton *)sender {
    [self g1k_NextMusic];
}
- (IBAction)download:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
