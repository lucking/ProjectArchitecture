//
//  NewsTableVC.m
//  Architecture
//
//  Created by ZM on 2016/10/19.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "NewsTableVC.h"

@interface NewsTableVC ()

@end

@implementation NewsTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    // UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, 250, 100)];
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"NewsTableVC";
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/



@end
