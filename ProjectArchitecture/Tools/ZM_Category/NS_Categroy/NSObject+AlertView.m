//
//  NSObject+AlertView.m
//  Architecture
//
//  Created by ZM on 16/6/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "NSObject+AlertView.h"
#import "UIWindow+ZMAdd.h"

@implementation NSObject (AlertView)



#pragma mark - AlertController
- (void)showAlertTitle:(NSString *)titlet
               message:(NSString *)message
               okTitle:(NSString *)okTitle
           cancelTitle:(NSString *)cancelTitle
              okAction:(void (^)(void))okActe
          cancelAction:(void (^)(void))cancelActe
            completion:(void (^)(void))complete
{
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:titlet message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // okAction
    if ((okTitle != nil) && ![okTitle isEqualToString:@""] && okActe != nil) {
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            okActe();//有回调
        }];
        [alertVC addAction:okAction];
    }
    
    // cancelAction
    if ((cancelTitle != nil) && ![cancelTitle isEqualToString:@""] && cancelActe != nil) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelActe();//有回调
        }];
        [alertVC addAction:cancelAction];
    }
    
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (complete != nil) {
        [window.rootViewController presentViewController:alertVC animated:NO completion:^{
            complete();//有回调
        }];
    }else{
        [window.rootViewController presentViewController:alertVC animated:NO completion:nil];
    }
    
    //    UIViewController *vc =[self getCurrentVC];
    //
    //    [vc presentViewController:alertVC animated:NO completion:^{
    //        complete();//有回调
    //    }];
    
}


//获取当前屏幕显示的_viewController
- (UIViewController *)getCurrentVC {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIViewController *currentVC = [window visibleViewController];
    //NSLog(@"------> common_currentVC = %@ \n ",currentVC);
    
    return currentVC;
}

/**
 *  type：UIAlertControllerStyleAlert
 *
 *  @param titlet       标题
 *  @param message     信息简介
 *  @param others      其他标题
 *  @param animated    是否有动画
 *  @param click    点击响应事件
 *  响应结束后回调
 */
- (void)AlertTitle:(NSString *)titlet
           message:(NSString *)message
         andOthers:(NSArray<NSString *> *)others
          animated:(BOOL)animated
            action:(click)click
{
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:titlet message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [others enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx == (others.count-1) )
        {   // StyleCancel
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                if (action){    click((others.count-1));
                }
            }]];
        }else{
            // StyleDefault
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if (action){    click(idx);
                }
            }]];
        }
    }];
    
    //    UIViewController *currentVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    //    if (currentVC.presentedViewController) {
    //        [currentVC.presentedViewController presentViewController:alertVC animated:YES completion:nil];
    //    } else {
    //        [currentVC presentViewController:alertVC animated:YES completion:nil];
    //    }

    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    [window.rootViewController presentViewController:alertVC animated:animated completion:nil];
}


/**
 *  type：UIAlertControllerStyleActionSheet
 *
 *  @param destructive 警报动作的破坏性的行动发生
 *  @param click       点击响应事件
 *  响应结束后回调
 */
- (void)ActionSheetWithTitle:(NSString *)title
                     message:(NSString *)message
                 destructive:(NSString *)destructive
                   andOthers:(NSArray <NSString *> *)others
                    animated:(BOOL )animated
                      action:(click )click
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    [others enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == (others.count-1))
        {   // StyleCancel
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                if (action){    click((others.count-1));
                }
            }]];
        }else{
            // StyleDefault
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if (action){    click(idx);
                }
            }]];
        }
    }];
    
    if ((destructive != nil) && ![destructive isEqualToString:@""]) {
        // StyleDestructive
        [alertVC addAction:[UIAlertAction actionWithTitle:destructive style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (action){
                click(-1000);
            }
        }]];
    }
    
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    [window.rootViewController presentViewController:alertVC animated:animated completion:nil];
}


#pragma mark - *****  AlertTextField
/**
 *  type：UIAlertControllerStyleAlert 添加 AlertTextField
 *
 *  @param number        TextField 的数量
 *  @param configuration <#configuration description#>
 *  @param animated      <#animated description#>
 *  @param click         <#click description#>
 */
- (void)AlertTextFieldWithTitle:(NSString *)title
                        message:(NSString *)message
                         others:(NSArray<NSString *> *)others
                textFieldNumber:(NSInteger )number
                  configuration:(configuration )configuration
                       animated:(BOOL )animated
                         action:(clickHaveField )click
{
    if (fields == nil){
        fields = [NSMutableArray array];
    }else{
        [fields removeAllObjects];
    }
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    // textfield
    for (NSInteger i = 0; i < number; i++)
    {
        [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
            [fields addObject:textField];
            configuration(textField,i);
        }];
    }
    // button
    [others enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == (others.count-1))
        {
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                if (action){
                    click(fields,(others.count-1));
                }
            }]];
        }else{
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (action){
                    click(fields,idx);
                }
            }]];
        }
    }];
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    [window.rootViewController presentViewController:alertVC animated:animated completion:nil];
}


@end
