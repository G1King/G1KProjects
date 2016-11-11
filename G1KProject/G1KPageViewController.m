//
//  G1KPageViewController.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KPageViewController.h"
#import "G1KTopView.h"
@interface G1KPageViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) G1KTopView * top;
@property (nonatomic,assign) NSInteger indx;
@end

@implementation G1KPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
   
  
}
-(void)setUI{
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    [self.view addSubview:self.g1k_ScrollView];
    self.top = [[G1KTopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    __weak typeof(self) weak = self;
    self.top.indexBL = ^(NSInteger indx){
        weak.indx = indx;
         weak.g1k_ScrollView.contentOffset =CGPointMake(self.indx * SCREEN_WIDTH, 0);
    };
    self.top.dataArr = self.dataSource;
    [self.view addSubview: self.top];
    
    self.g1k_ScrollView.userInteractionEnabled = YES;
    self.g1k_ScrollView.contentSize = CGSizeMake(self.dataSource.count * SCREEN_WIDTH, SCREEN_HEIGHT);
    for ( int i=0; i<self.dataSource.count; i++) {
        UIView * voew = [[UIView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        voew.backgroundColor = [UIColor colorWithRed:hue green:saturation blue:brightness alpha:1];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 100, 50)];
        label.textColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"第%d页",i+1];
        [voew addSubview:label];
        [self.g1k_ScrollView addSubview:voew];
    }
//    for (NSString * res in self.dataSource) {
//        NSLog(@"res====%@",res);
//    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (self.g1k_ScrollView ==scrollView) {
//        self.g1k_ScrollView.contentOffset =CGPointMake(self.indx * SCREEN_WIDTH, 0);
//    }
//    NSLog(@"%d",self.indx);
}
-(void)setTitleArr:(NSArray *)array{
   
   
    self.dataSource = [NSMutableArray arrayWithArray:array];
     [self setUI];
}
-(UIScrollView*)g1k_ScrollView{
    if (!_g1k_ScrollView) {
        _g1k_ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _g1k_ScrollView.pagingEnabled = YES;
        _g1k_ScrollView.delegate = self;
        _g1k_ScrollView.bounces = NO;
    }
    return _g1k_ScrollView;
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
