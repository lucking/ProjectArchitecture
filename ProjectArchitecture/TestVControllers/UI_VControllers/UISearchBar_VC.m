//
//  UISearchBar_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/7.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UISearchBar_VC.h"
#import "UISearchBar+ZMAdd.h"
#import "UIView+ZMFrame.h"
#import "SearchBarView.h"

#define UIColorRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]


@interface UISearchBar_VC ()<UISearchBarDelegate>
{
    
}
@property (strong, nonatomic) UISearchBar *mySearchBar;
@property (strong, nonatomic) SearchBarView *searchBarView;
@end

@implementation UISearchBar_VC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    NSLogline(@"---> title= %@", self.title);
    
    
//    [self baseTest];
    
//    [self customSearchBar];
    
    _searchBarView = [[SearchBarView alloc]initWithFrame:CGRectMake(20, 300, 260, 40)];
    [self.view addSubview:_searchBarView];
    
    _searchBarView.searchBarBlock = ^(UISearchBar *searchBar, NSString *didChangetext ,NSString *responseType) {
        
        NSLog(@"---> didChangetext= %@",didChangetext);
        NSLog(@"---> responseType= %@ \n ",responseType);

    };

}


- (void)customSearchBar {
    
    _mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, 300, 260, 40)];
    _mySearchBar.backgroundColor = [UIColor yellowColor];
    _mySearchBar.text = @"111111";
    _mySearchBar.placeholder = @"请输入查询信息";
    _mySearchBar.delegate = self;
    [self.view addSubview:_mySearchBar];
    
    //1. 设置背景颜色
    //设置背景图是为了去掉上下黑线
    self.mySearchBar.backgroundImage = [[UIImage alloc] init];
    // 设置SearchBar的颜色主题为白色
    self.mySearchBar.barTintColor = [UIColor whiteColor];
    
    //2. 设置圆角和边框颜色
    UITextField *searchField = [self.mySearchBar valueForKey:@"searchField"];
    if (searchField) {
        [searchField setBackgroundColor:[UIColor whiteColor]];
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = UIColorRGB(247,75,31).CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
    }
    //3. 设置按钮文字和颜色
    [self.mySearchBar zm_setCancelButtonTitle:@"取消"];
    self.mySearchBar.tintColor = UIColorRGB(86,179,11);
    //设置取消按钮字体
    [self.mySearchBar zm_setCancelButtonFont:[UIFont systemFontOfSize:18]];
    //修正光标颜色
    [searchField setTintColor:[UIColor blackColor]];
    
    //4. 设置输入框文字颜色和字体
    [self.mySearchBar zm_setTextColor:[UIColor blackColor]];
    [self.mySearchBar zm_setTextFont:[UIFont systemFontOfSize:14]];
    
    //5. 设置搜索Icon
    [self.mySearchBar setImage:[UIImage imageNamed:@"Search_Icon"]
              forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
}

- (void)baseTest {
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, 100, 260, 80)];
    searchBar.backgroundColor = [UIColor clearColor];
    searchBar.prompt = @"搜索框";
    searchBar.text = @"111111";
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    //    UITextField *searchField = [[UITextField alloc] init];
    //    searchField.frame = CGRectMake(0, 0, 260, 50);
    //    [self.mySearchBar setValue:searchField forKey:@"searchField"];
}

#pragma mark  UISearchBarDelegate
//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
//    NSLog(@"--> return NO to not become first responder ");
//    return YES;
//}
//- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
//    NSLog(@"--> return NO to not resign first responder ");
//    return YES;
//}
//- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//     NSLog(@"--> called before text changes");
//    return YES;
//}


//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
//{
//    NSLog(@"--> called when text starts editing ");
//    [searchBar setShowsCancelButton:YES animated:YES];
//
//}
//
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
//{
//     NSLog(@"--> called when text ends editing ");
//}
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//     NSLog(@"--> called when text changes (including clear) ");
//}
//
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
//{
//    NSLog(@"--> called when keyboard search button pressed");
//    NSLog(@"--> searchBar.text = %@ \n ", searchBar.text);
//    
//}
//- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
//{
//     NSLog(@"--> called when bookmark button pressed ");
//}
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
//{
//     NSLog(@"--> called when cancel button pressed ");
//    searchBar.text = @"";
//    [searchBar setShowsCancelButton:NO animated:YES];
//    [searchBar endEditing:YES];
//    
//}
//- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
//{
//    NSLog(@"---> called when search results button pressed");
//}
//- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
//{
//     NSLog(@"--> ");
//}


@end
