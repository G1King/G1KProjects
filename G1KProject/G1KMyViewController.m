//
//  G1KMyViewController.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KMyViewController.h"

@interface G1KMyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * g1k_TableView;
@end
static NSString * const CELL_FLAG = @"G1KING";
@implementation G1KMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.g1k_TableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL_FLAG];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_FLAG];
    }
    cell.textLabel.text = @"音乐播放器";
    cell.textLabel.textColor = [UIColor cyanColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class id =NSClassFromString(@"G1KMusicViewController");
    [self.navigationController pushViewController:[id new] animated:NO];
}
-(UITableView*)g1k_TableView{
    if (!_g1k_TableView) {
        _g1k_TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _g1k_TableView.backgroundColor = [UIColor whiteColor];
        
        _g1k_TableView.dataSource = self;
        _g1k_TableView.delegate = self;
    }
    return _g1k_TableView;
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
