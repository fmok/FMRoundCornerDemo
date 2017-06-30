//
//  ListViewController.m
//  CornerDemo
//
//  Created by fm on 2017/6/30.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ListViewController.h"
#import "ListControl.h"
#import "YYFPSLabel.h"

@interface ListViewController ()

@property (nonatomic, strong) ListControl *control;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    WS(weakSelf);
    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    [self.control registerCell];
    [self showFpsLabel];
}

#pragma mark - Private methods
- (void)showFpsLabel
{
    WS(weakSelf);
    [self.view addSubview:self.fpsLabel];
    [self.fpsLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view).offset(0.f);
        make.top.equalTo(weakSelf.view).offset(20.f);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
}

#pragma mark - getter & setter
- (ListControl *)control
{
    if (!_control) {
        _control = [[ListControl alloc] init];
        _control.vc = self;
    }
    return _control;
}

- (UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _myTableView.delegate = self.control;
        _myTableView.dataSource = self.control;
    }
    return _myTableView;
}

- (YYFPSLabel *)fpsLabel
{
    if (!_fpsLabel) {
        _fpsLabel = [[YYFPSLabel alloc] init];
    }
    return _fpsLabel;
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
