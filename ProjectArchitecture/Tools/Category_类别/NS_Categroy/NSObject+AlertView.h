//
//  NSObject+AlertView.h
//  Architecture
//
//  Created by ZM on 16/6/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^click) (NSInteger index);
typedef void (^configuration) (UITextField *field, NSInteger index);
typedef void (^clickHaveField)(NSArray<UITextField *> *fields, NSInteger index);

static NSMutableArray *fields = nil;

@interface NSObject (AlertView)
{
    
}
/**
 *  AlertController
 *
 *  @return 提示view
 */
#pragma mark - AlertController

- (void)showAlertTitle:(NSString *)titlet
               message:(NSString *)message
               okTitle:(NSString *)okTitle
           cancelTitle:(NSString *)cancelTitle
              okAction:(void (^)(void))okActe
          cancelAction:(void (^)(void))cancelActe
            completion:(void (^)(void))complete;



- (void)AlertTitle:(NSString *)titlet
           message:(NSString *)message
         andOthers:(NSArray<NSString *> *)others
          animated:(BOOL)animated
            action:(click)click;


- (void)ActionSheetWithTitle:(NSString *)title
                     message:(NSString *)message
                 destructive:(NSString *)destructive
                   andOthers:(NSArray <NSString *> *)others
                    animated:(BOOL )animated
                      action:(click )click;


- (void)AlertTextFieldWithTitle:(NSString *)title
                        message:(NSString *)message
                         others:(NSArray<NSString *> *)others
                textFieldNumber:(NSInteger )number
                  configuration:(configuration )configuration
                       animated:(BOOL )animated
                         action:(clickHaveField )click;

@end

