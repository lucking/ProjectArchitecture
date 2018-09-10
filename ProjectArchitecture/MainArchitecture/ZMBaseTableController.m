//
//  ZMBaseTableViewController.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZMBaseTableController.h"

@interface ZMBaseTableController ()

@end

@implementation ZMBaseTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//导航标题 navTitle
-(void)setTitle:(NSString*)title TitleColor:(UIColor*)color
{
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.frame= CGRectMake(0, 0, 100, 30);
    titleLab.textColor = color;
    [titleLab setText:title];
    titleLab.text = title;
    titleLab.textAlignment= NSTextAlignmentCenter;
    titleLab.font= [UIFont boldSystemFontOfSize:20];
    self.titleNavLab = titleLab;
    self.navigationItem.titleView = self.titleNavLab;
}
- (void)setTitleCustom:(NSString *)titleCustom {
    _titleCustom = titleCustom;
    _titleNavLab.text = titleCustom;
}

//使用系统的 BarButtonSystemItem
- (void)addBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action
                     tintColor:(UIColor *)tintColor
                   isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
        
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
        
    }
}
//添加带标题的 BarButtonItemTitle
- (void)addBarButtonItemTitle:(NSString *)title
                    itemStyle:(UIBarButtonItemStyle)itemStyle
                       target:(id)target
                       action:(SEL)action
                         font:(UIFont *)font
                    tintColor:(UIColor *)tintColor
                  isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:itemStyle target:target action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] forState:UIControlStateNormal];
    }else {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:itemStyle target:target action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
        [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] forState:UIControlStateNormal];
    }
}

//添加带图片的 BarButtonItem
- (void)addBarButtonItemImgName:(NSString *)imgName 
                         action:(SEL)action
                      tintColor:(UIColor *)tintColor
                    isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:self action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:self action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
    }
}


// 清除UITableView底部多余的分割线
- (void)clearTableViewLine:(UITableView *)tabelView {
    UIView *View= [UIView new];
    View.backgroundColor= [UIColor clearColor];
    [tabelView setTableHeaderView:View];
    [tabelView setTableFooterView:View];
}
// 菊花停止
- (void)hudHidden {
    [HHudProgress hudHidden];
}
// 等待：提示信息
- (void)hudShowLoading:(NSString *)message afterDelay:(NSTimeInterval)delay
{
    [HHudProgress hudShowLoadingMsg:message afterDelay:delay addSubview:nil];
}
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [HHudProgress hudShowLoadingMsg:message afterDelay:delay addSubview:nil];
}
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [HHudProgress hudShowSucceedMsg:message afterDelay:delay addSubview:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
