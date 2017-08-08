//
//  SearchBarView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "SearchBarView.h"

#import "UISearchBar+ZMAdd.h"
#import "UIView+ZMFrame.h"

#define UIColorRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]

@interface SearchBarView()<UISearchBarDelegate>

@end


@implementation SearchBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"--> alloc init to create");
     
        [self setSearchBar];
    }
    return self;
}

- (void)setSearchBar {
    
    _mySearchBar = [[UISearchBar alloc] initWithFrame:self.bounds];
    _mySearchBar.backgroundColor = [UIColor yellowColor];
    _mySearchBar.text = @"111111";
    _mySearchBar.placeholder = @"请输入查询信息";
    _mySearchBar.delegate = self;
    [self addSubview:_mySearchBar];
    
    //1. 设置背景颜色
    //设置背景图是为了去掉上下黑线
    self.mySearchBar.backgroundImage = [[UIImage alloc] init];
    // 设置SearchBar的颜色主题为白色
    self.mySearchBar.barTintColor = [UIColor whiteColor];
    
    //2. 设置圆角和边框颜色
    UITextField *searchField = [self.mySearchBar valueForKey:@"searchField"];
    if (searchField) {
        [searchField setBackgroundColor:[UIColor whiteColor]];
        searchField.layer.cornerRadius = 5.0f;
        searchField.layer.borderColor = UIColorRGB(247,75,31).CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
//        searchField.frame = CGRectMake(0, 0, self.width, self.height);
//        [searchField setFrame:CGRectMake(0, 0, self.width, self.height)];
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


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"--> called when text starts editing ");//开始编辑
    [searchBar setShowsCancelButton:YES animated:YES];
    
    self.searchBarBlock(searchBar,nil, @"DidBeginEditing");
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"--> called when text ends editing ");//结束编辑
    self.searchBarBlock(searchBar,nil, @"DidEndEditing");

}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"--> called when text changes (including clear) ");//正在编辑
    self.searchBarBlock(searchBar, searchText, @"textDidChange");

}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"--> called when keyboard search button pressed"); //点击搜索
    NSLog(@"--> searchBar.text = %@ \n ", searchBar.text);
    self.searchBarBlock(searchBar,nil, @"SearchButtonClicked");
    
}
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"--> called when bookmark button pressed ");
    self.searchBarBlock(searchBar,nil, @"BookmarkButtonClicked");

}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"--> called when cancel button pressed "); //点击取消
    searchBar.text = @"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar endEditing:YES];
    self.searchBarBlock(searchBar,nil, @"CancelButtonClicked");
    
}
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"---> called when search results button pressed");
    self.searchBarBlock(searchBar,nil, @"ResultsListButtonClicked");

}
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    NSLog(@"--> selectedScopeButtonIndexDidChange");
}


@end
