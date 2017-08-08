//
//  SortingCell.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CALayer+ZMAdd.h"

@interface SortingCell : UICollectionViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) NSString* keyword;


- (CGSize)sizeForCell;
@end
