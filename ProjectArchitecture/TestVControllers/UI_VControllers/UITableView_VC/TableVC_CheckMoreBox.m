//
//  TableVC_CheckMoreBox.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/14.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TableVC_CheckMoreBox.h"
static NSString * const reuseId = @"UDCell";

@interface TableVC_CheckMoreBox ()
{
    UITableViewCellEditingStyle *currentEditingStyle;
}
@end

@implementation TableVC_CheckMoreBox

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseId];
    
    self.navigationItem.rightBarButtonItem= self.editButtonItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];

    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:self.editButtonItem target:target action:action];
//    self.navigationItem.leftBarButtonItem.tintColor = tintColor;
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    cell.textLabel.text= [NSString stringWithFormat:@"%ld", indexPath.row];
    
    // Configure the cell...
    
    return cell;
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
    
    //改为如下：会发现，多选按钮不见了。你可以自己添加自定义多选按钮！
//    return UITableViewCellEditingStyleDelete & UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath
{
//    if(currentEditingStyle != (UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert)) {
//        return;
//    }
    
    //multiple action
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

@end
