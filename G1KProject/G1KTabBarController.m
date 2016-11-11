//
//  G1KTabBarController.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KTabBarController.h"
#import "G1KTabBarView.h"
#import "G1KHomeViewController.h"
#import "G1KMyViewController.h"
#import "G1KThemViewController.h"
#import "G1KDicoverViewController.h"
#import "G1KNavigationController.h"
@interface G1KTabBarController ()<G1KProtocol>

@property (nonatomic,strong) G1KTabBarView * tabBarView;
@end

@implementation G1KTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setViews];
    [self addChildVCS];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 先删除系统自带的tabbar
    [self removeTbar];
}
-(void)removeTbar{
    for (UIView * child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
-(void)setViews{
    // 删除 自带的线
    [self removeLine];
    G1KTabBarView * tab = [[G1KTabBarView alloc]init];
    tab.frame = self.tabBar.bounds;
    tab.delegate = self;
    [self.tabBar addSubview:tab];
    self.tabBarView = tab;
}
#pragma mark  - delegate
-(void)tabBar:(G1KTabButton *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
}
-(void)removeLine{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef crx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(crx, [UIColor clearColor].CGColor);
    CGContextFillRect(crx, rect);
    UIImage * imag = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:imag];
    [self.tabBar setShadowImage:imag];
}
-(void)addChildVCS{
    G1KHomeViewController * home = [[G1KHomeViewController alloc]init];
    G1KNavigationController * homenNav = [[G1KNavigationController alloc]initWithRootViewController:home];
    [self setupViewChildVC:home title:@"精选" images:@"icon_theme" selcetImage:@"icon_featured_active"];
    
    G1KThemViewController * them = [[G1KThemViewController alloc]init];
    G1KNavigationController * themNav = [[G1KNavigationController alloc]initWithRootViewController:them];
    [self setupViewChildVC:them title:@"主题" images:@"icon_theme" selcetImage:@"icon_theme_active"];
    
    
    G1KDicoverViewController * dico = [[G1KDicoverViewController alloc]init];
    G1KNavigationController * dicNav = [[G1KNavigationController alloc]initWithRootViewController:dico];
    [self setupViewChildVC:dico title:@"发现" images:@"icon_find" selcetImage:@"icon_find_active"];
    
    
    G1KMyViewController * my = [[G1KMyViewController alloc]init];
    G1KNavigationController * myNav = [[G1KNavigationController alloc]initWithRootViewController:my];
    [self setupViewChildVC:my title:@"我的" images:@"icon_mine" selcetImage:@"icon_mine_active"];
    
    
    self.viewControllers = @[homenNav,themNav,dicNav,myNav];
}
-(void)setupViewChildVC:(UIViewController *)vc title:(NSString *)title images:(NSString *)imageName selcetImage:(NSString *)selectImage{
    
    vc.title = title;
    vc.tabBarItem.title =title;
    
    vc.tabBarItem.image =[UIImage imageNamed:imageName];
    NSLog(@"%@",vc.tabBarItem);
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    [self.tabBarView addTabBarItem:vc.tabBarItem];
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
