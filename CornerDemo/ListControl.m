//
//  ListControl.m
//  CornerDemo
//
//  Created by fm on 2017/6/30.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ListControl.h"

NSString *const kTableViewCellIdentifier = @"TableViewCell";

@implementation ListControl

#pragma mark - Public methods
- (void)registerCell
{
    [self.vc.myTableView registerClass:[TableViewCell class] forCellReuseIdentifier:kTableViewCellIdentifier];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.vc dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier forIndexPath:indexPath];
    [cell updateContent];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
