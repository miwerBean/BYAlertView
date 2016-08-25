//
//  AlertView.m
//  MyAlertView
//
//  Created by miwer on 16/8/1.
//  Copyright © 2016年 miwer. All rights reserved.
//

#import "AlertView.h"
#import "MyContentView.h"

@interface AlertView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alertWidthContraint;

@end

@implementation AlertView

-(void)awakeFromNib{
    [super awakeFromNib];
     self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4];
    
    self.alertWidthContraint.constant = BYScaleWidth(240);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    if (!CGRectContainsPoint(self.alert.frame,touchPoint)) {
        [self hideView];
    }
}

- (IBAction)cancel:(id)sender {
    [self hideView];
    
}
- (IBAction)sure:(id)sender {
    if (self.sureBlock) {
        self.sureBlock();
    }
    [self hideView];
}

+(AlertView *)viewFromNibWithTitle:(NSString *)title message:(NSString *)message{
    
    AlertView * alert = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
    alert.titleLabel.text = title;
//    alert.messageLabel.text = message;
    
    [alert show];
    
    return alert;
}

- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.frame = [UIScreen mainScreen].bounds;
    [self shakeToShow:self.alert];
}

-(void)hideView{
    [UIView animateWithDuration:0.2 animations:^{
        self.alert.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void) shakeToShow:(UIView*)aView{
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.3;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
    
}

@end
