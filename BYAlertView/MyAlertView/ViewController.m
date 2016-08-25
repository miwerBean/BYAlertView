//
//  ViewController.m
//  MyAlertView
//
//  Created by miwer on 16/8/1.
//  Copyright © 2016年 miwer. All rights reserved.
//

#import "ViewController.h"
#import "XFDialogBuilder.h"
#import "XFComboxListController.h"
//#import "XFRegion.h"
#import "XFDropdownMenu.h"
#import "UIView+DialogMeasure.h"
#import "XFDialogMacro.h"
#import "XFDialogAnimationUtil.h"


#import "AlertView.h"
#import "MyContentView.h"

#import "EBForeNotification.h"
#import "SVProgressHUD.h"

#import "BYAlertView.h"


@interface ViewController ()

@property (nonatomic, weak) XFDialogFrame *dialogView;


@end

@implementation ViewController

-(void)aaaaaa{
    [EBForeNotification handleRemoteNotification:@{@"aps":@{@"alert":@"皮卡丘: Hi 小智，一起去冒险吧! 住在森林中的它们通常以树果为食。它们用小小的电击把树果从树上打下来，这样就不必爬树，还可以顺带将其烤熟。作为宠物，它可以用各种各样的加工食物来喂养。此外，与大多数神奇宝贝一样，皮卡丘可以忍受大多数人造的食品，有时还会喜欢它们胜过自然的食品，如果这些人造食品是针对它的口味设计的话。一个很好的例子就是小智的皮卡丘特别喜欢番茄酱。皮卡丘偶尔也会吃苹果。"}} soundID:1312 isIos10:NO];
}

- (IBAction)pullDownNoti:(id)sender {
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(aaaaaa) userInfo:nil repeats:YES];

}


- (IBAction)test:(id)sender {
    
//    BYAlertView * alert = [BYAlertView viewFromNibWithTitle:@"ghjkl;'b,.bnm,."];
//    [alert setSureBlock:^{
//        NSLog(@"test");
//    }];
    
    AlertView * alert = [AlertView viewFromNibWithTitle:@"hello" message:@"设备重启"];
    
    alert.alertHeightContraint.constant = 150;
    [alert.alert layoutIfNeeded];
    
    CGFloat width = alert.contentView.frame.size.width;
    CGFloat height = alert.contentView.frame.size.height;
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width - 20, 30)];
    textField.center = CGPointMake(width / 2, height / 2);
    textField.backgroundColor = [UIColor redColor];
    [alert.contentView addSubview:textField];
    
    
    alert.alertHeightContraint.constant = 150 + 90;
    [alert layoutIfNeeded];
    MyContentView * content = [MyContentView contentView];
    content.frame = CGRectMake(0, 0, alert.contentView.frame.size.width, alert.contentView.frame.size.height);
    content.titleLabel.text = @"确定设备重启";
    
    [content setContentBlock:^{
        NSLog(@"contentBlock");
    }];
    
    [alert.contentView addSubview:content];
//
////    NSLog(@"%@",alert.contentView.subviews);
//    
//    [alert setSureBlock:^{
//        NSLog(@"sure");
//    }];
    
    
//    [SVProgressHUD showErrorWithStatus:@"网络错误"];
    
}

- (IBAction)alertTextField:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    
    self.dialogView =
    [[XFDialogInput dialogWithTitle:@"登录"
                              attrs:@{
                                      XFDialogTitleViewBackgroundColor : [UIColor blueColor],
                                      XFDialogTitleColor: [UIColor whiteColor],
                                      XFDialogLineColor: [UIColor blueColor],
                                      XFDialogInputFields:@[
                                              @{
                                                  XFDialogInputPlaceholderKey : @"输入用户名",
                                                  XFDialogInputTypeKey : @(UIKeyboardTypePhonePad),
                                                  }
                                              ],
                                      XFDialogInputHintColor : [UIColor purpleColor],
                                      XFDialogInputTextColor: [UIColor orangeColor],
                                      XFDialogCommitButtonTitleColor: [UIColor blueColor],
                                      XFDialogCancelButtonTitleColor: [UIColor blueColor],
                                      XFDialogMultiValidatorMatchers: @[
                                              @{
                                                  ValidatorConditionKey: ^(NSArray<UITextField *> *textfields){
        
        return textfields[0].text.length < 6;
    },ValidatorErrorKey: @"用户名小于6位！"
                                                  }]
                                      }
                     commitCallBack:^(NSString *inputText) {
                         
                         NSLog(@"%@",inputText);
                         
                         [weakSelf.dialogView hideWithAnimationBlock:nil];
                     } errorCallBack:^(NSString *errorMessage) {
                         NSLog(@"error -- %@",errorMessage);
                     }] showWithAnimationBlock:nil];
    
}
- (IBAction)cancelAndSure:(id)sender {
    __weak typeof(self) weakSelf = self;
    self.dialogView =
    [[XFDialogNotice dialogWithTitle:nil
                               attrs:@{
                                       XFDialogMaskViewBackgroundColor:[UIColor redColor],
                                       XFDialogMaskViewAlpha:@(0.5f),
                                       XFDialogSize:[NSValue valueWithCGSize:CGSizeMake(240, 180)],
                                       XFDialogTitleViewBackgroundColor : [UIColor redColor],
                                       XFDialogLineColor: [UIColor redColor],
                                       XFDialogLineWidth: @(0.5f),
                                       XFDialogCancelButtonTitle:@"否",
                                       XFDialogCommitButtonTitle:@"是",
                                       XFDialogNoticeTypeSet : @(XFDialogNoticeTypeIconWithTextVertical),
                                       XFDialogNoticeText: @"你确定要退出吗?",
                                       XFDialogNoticeContentItemSpacing:@(20.f),
                                       XFDialogNoticeTextColor: [UIColor redColor],
//                                       XFDialogNoticeIcon: [UIImage imageNamed:@"warn"],
                                       XFDialogNoticeIconSize:[NSValue valueWithCGSize:CGSizeMake(36, 36)],
                                       XFDialogCommitButtonMiddleLineDisable:@YES
                                       }
                      commitCallBack:^(NSString *inputText) {
                          [weakSelf.dialogView hideWithAnimationBlock:[XFDialogAnimationUtil centerToTop]];
                      }] showWithAnimationBlock:[XFDialogAnimationUtil topToCenter]];
    // 使用自定义动画引擎后要设置取消动画
    self.dialogView.cancelAnimationEngineBlock = [XFDialogAnimationUtil centerToTop];
}
- (IBAction)notice:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    self.dialogView =
    [[XFDialogNotice dialogWithTitle:@"提示"
                               attrs:@{
                                       XFDialogMaskViewBackgroundColor:UIColorFromRGB(0xcccccc),
                                       XFDialogMaskViewAlpha:@(0.5f),
                                       XFDialogTitleViewBackgroundColor :[UIColor blueColor],
                                       XFDialogLineColor: UIColorFromRGB(0x066f9f),
                                       XFDialogTitleColor: [UIColor whiteColor],
                                       XFDialogNoticeText: @"确定要设备重启吗？",
                                       XFDialogNoticeTextColor: [UIColor blueColor],
                                       XFDialogCommitButtonTitleColor: [UIColor blueColor],
                                       XFDialogCancelButtonTitleColor: [UIColor blueColor]
                                       
                                       }
                      commitCallBack:^(NSString *inputText) {
                          [weakSelf.dialogView hideWithAnimationBlock:nil];
                          
                          NSLog(@"sure");
                      }] showWithAnimationBlock:nil];
}





@end
