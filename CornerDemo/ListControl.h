//
//  ListControl.h
//  CornerDemo
//
//  Created by fm on 2017/6/30.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewController.h"
#import "TableViewCell.h"

@interface ListControl : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) ListViewController *vc;

- (void)registerCell;

@end
