//
//  G1KMusicViewController.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/9.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KMusicViewController.h"
#import "G1KMusicModel.h"
#import "G1KPlayerViewController.h"
@interface G1KMusicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataSource;
@end
static NSString * const CELL = @"G1King";
@implementation G1KMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"音乐列表";
    [self.view addSubview:self.tableView];
    //set model
    [self setData];
}
-(void)setData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"musicPaper" ofType:@"json"];
    NSData * data = [[NSData alloc]initWithContentsOfFile:path];
    NSMutableArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary * dic in arr) {
        G1KMusicModel * model = [[G1KMusicModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
    
}
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL];
    }
    G1KMusicModel * model = self.dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@          %@",model.name,model.singer];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
       //    G1KAudioViewController
    
    G1KPlayerViewController * audio = [G1KPlayerViewController sharedInstance];
    [audio setArrModel:self.dataSource indexModel:indexPath.row];
    [self presentViewController:audio animated:YES completion:nil];
    
}
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _tableView;
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
