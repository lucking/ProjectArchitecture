//
//  CollectDealView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/10.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CollectDealView.h"
#import "UIView+ZMFrame.h"

@interface CollectDealView()
{
    float myWidth;
    float myHeight;
}
@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, strong) UIButton *deleteBtn;
@end

@implementation CollectDealView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        myWidth=	frame.size.width;
        myHeight=	frame.size.height;
        
        [self addSubview:self.selectBtn];
        [self addSubview:self.deleteBtn];
        _selectBtn.frame = CGRectMake(0, 0, myWidth/2, myHeight);
        _deleteBtn.frame = CGRectMake(_selectBtn.right, 0, myWidth/2, myHeight);
        
        [_selectBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    }
    return self;
}

//列表数
- (void)setAllNum:(NSInteger)allNum {
    _allNum = allNum;
    
    _allSelect = NO;
    _selectBtn.selected = NO;
    [_selectBtn setTitle:@"全选" forState:UIControlStateNormal];
    [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    
}
//选择数
- (void)setSelectNum:(NSInteger)selectNum {
    _selectNum = selectNum;
    //    NSLog(@"--> selectNum = %ld", (long)selectNum);
    //    NSLog(@"--> _allNum = %ld", (long)_allNum);
    NSString *title = @"删除";
    if (_selectNum > 0) {
        title = [NSString stringWithFormat:@"删除(%ld)项",_selectNum];
        if (_selectNum ==_allNum) {
            _allSelect = YES;
            _selectBtn.selected = YES;
            [_selectBtn setTitle:@"取消全选" forState:UIControlStateNormal];
        }else{
            _allSelect = NO;
            _selectBtn.selected = NO;
            [_selectBtn setTitle:@"全选" forState:UIControlStateNormal];
        }
    }else{
        _allSelect = NO;
        _selectBtn.selected = NO;
        [_selectBtn setTitle:@"全选" forState:UIControlStateNormal];
    }
    [_deleteBtn setTitle:title forState:UIControlStateNormal];
}

#pragma mark ---------"  action  "-----------

- (void)BtnClick:(UIButton *)Btn {
    
    if (self.collectSelectBlock) {
        
        if (Btn.tag==SelectAction) {
            NSLog(@"--> _selectBtn.selected_11 = %d",_selectBtn.selected);
            if (!_selectBtn.selected) {
                //全选
                _allSelect = YES;
            }else{
                //取消全选
                _allSelect = NO;
            }
            _selectBtn.selected = !_selectBtn.selected;
            NSLog(@"--> _selectBtn.selected_22 = %d",_selectBtn.selected);
            
            self.collectSelectBlock(self,SelectAction);
        }else{
            self.collectSelectBlock(self,DeleteAction);
        }
    }
}

#pragma mark =========" set get  "============


- (void)setSelectText:(NSString *)selectText {
    _selectText = selectText;
    [_selectBtn setTitle:_selectText forState:UIControlStateNormal];
}
- (void)setDeleteText:(NSString *)deleteText {
    _deleteText = deleteText;
    [_deleteBtn setTitle:_deleteText forState:UIControlStateNormal];
    
}
- (void)setAllSelect:(BOOL)allSelect {
    _allSelect = allSelect;
    
    //NSLog(@"--> _selectBtn.selected = %d",_selectBtn.selected);
    if (!_selectBtn.selected) {
        //全选
        _allSelect = YES;
    }else{
        //取消全选
        _allSelect = NO;
    }
    _selectBtn.selected = !_selectBtn.selected;
}

- (UIButton *)selectBtn {
    if (_selectBtn==nil) {
        _selectBtn = [[UIButton alloc] init];
        [_selectBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_selectBtn setTitleColor:Blue_2599FA forState:UIControlStateNormal];
        [_selectBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _selectBtn.tag = SelectAction;
    }
    return _selectBtn;
}
- (UIButton *)deleteBtn {
    if (_deleteBtn==nil) {
        _deleteBtn = [[UIButton alloc] init];
        [_deleteBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_deleteBtn setTitleColor:Blue_2599FA forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _deleteBtn.tag = DeleteAction;
    }
    return _deleteBtn;
}

@end
