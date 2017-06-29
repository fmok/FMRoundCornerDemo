//
//  UIView+RoundCorner.m
//  CornerDemo
//
//  Created by fm on 2017/6/29.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "UIView+RoundCorner.h"

@implementation UIView (RoundCorner)

- (void)viewWithCornerRadius:(CGFloat)radius cornerType:(UIRectCorner)cornerType
{
    if (self.bounds.size.width == 0 && self.bounds.size.height == 0) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:cornerType cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
