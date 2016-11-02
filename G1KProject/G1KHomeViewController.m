//
//  G1KHomeViewController.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KHomeViewController.h"
#import "G1KTopTabView.h"
@interface G1KHomeViewController ()<G1KTopDelegate>

@end

@implementation G1KHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    G1KTopTabView * top = [[G1KTopTabView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
    top.delegate = self;
    top.titlesArr = @[@"我的",@"全部",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻"];
    top.font = 9;
    top.space = 20;
    top.normalColor = [UIColor blackColor];
    top.selectColor = [UIColor cyanColor];
    [self.view addSubview:top];
    
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
