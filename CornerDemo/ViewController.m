//
//  ViewController.m
//  CornerDemo
//
//  Created by fm on 2017/6/29.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+RoundCorner.h"
#import "UIImageView+WebCache.h"
#import "ListViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIImageView *firstImgView;
@property (nonatomic, strong) UIImageView *webImgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    [self updateContent];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ListViewController *vc = [[ListViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Private methods
- (void)configUI
{
    WS(weakSelf);
    [self.view addSubview:self.firstView];
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(40.f);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [self.firstView viewWithCornerRadius:30.f cornerType:UIRectCornerAllCorners];
    
    
    [self.view addSubview:self.firstImgView];
    [self.firstImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.mas_equalTo(weakSelf.firstView.mas_bottom).offset(40.f);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [self.firstImgView viewWithCornerRadius:10.f cornerType:UIRectCornerTopLeft|UIRectCornerTopRight];
    
    [self.view addSubview:self.webImgView];
    [self.webImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.mas_equalTo(weakSelf.firstImgView.mas_bottom).offset(40.f);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    [self.webImgView viewWithCornerRadius:20.f cornerType:UIRectCornerTopLeft|UIRectCornerBottomRight];
}

- (void)updateContent
{
    [self.webImgView sd_setImageWithURL:[NSURL URLWithString:@"http://pic24.nipic.com/20121008/3822951_094451200000_2.jpg"] placeholderImage:nil options:SDWebImageRetryFailed];
}

#pragma mark - geter & setter
- (UIView *)firstView
{
    if (!_firstView) {
        _firstView = [[UIView alloc] initWithFrame:CGRectZero];
        _firstView.backgroundColor = [UIColor yellowColor];
    }
    return _firstView;
}

- (UIImageView *)firstImgView
{
    if (!_firstImgView) {
        _firstImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _firstImgView.backgroundColor = [UIColor redColor];
        _firstImgView.image = [UIImage imageNamed:@"1"];
    }
    return _firstImgView;
}

- (UIImageView *)webImgView
{
    if (!_webImgView) {
        _webImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _webImgView.backgroundColor = [UIColor blueColor];
    }
    return _webImgView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
