//
//  TableViewCell.m
//  CornerDemo
//
//  Created by fm on 2017/6/30.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.f green:arc4random_uniform(255)/255.f blue:arc4random_uniform(255)/255.f alpha:1];
        [self addSubview:self.imgView];
    }
    return self;
}

- (void)updateConstraints
{
    WS(weakSelf);
    [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(10.f);
        make.size.mas_equalTo(CGSizeMake(60.f, 60.f));
    }];
    [super updateConstraints];
}

#pragma mark - Public methods
- (void)updateContent
{
    self.imgView.image = [UIImage imageNamed:@"1"];
    [self setNeedsUpdateConstraints];
}

#pragma mark - getter & setter
- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
    }
    return _imgView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
