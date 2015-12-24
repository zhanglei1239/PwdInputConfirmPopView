//
//  ConfirmPayPopView.m
//  促利汇_门户
//
//  Created by zhanglei on 15/7/13.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import "ConfirmPayPopView.h"
#import "AppDelegate.h"
@implementation ConfirmPayPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    UIButton * btnBg = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [btnBg setBackgroundColor:[UIColor blackColor]];
    [btnBg setAlpha:.5];
    [self addSubview:btnBg];
    
    float offy = 0;
    if (iPhone4s) {
        offy = 30;
    }else{
        offy = 100;
    }
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, offy, UI_SCREEN_WIDTH-20, 240)];
    [view.layer setMasksToBounds:YES];
    [view.layer setCornerRadius:4];
    [view setBackgroundColor:RGBACOLOR(238, 238, 238, 1)];
    [self addSubview:view];
    
    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, offy, UI_SCREEN_WIDTH-20, 50)];
    [self.lblTitle setText:@"确认支付"];
    [self.lblTitle setFont:[UIFont fontWithName:TEXT_FONT_NAME size:18]];
    [self.lblTitle setTextAlignment:NSTextAlignmentCenter];
    [self.lblTitle setTextColor:[UIColor darkGrayColor]];
    [self addSubview:self.lblTitle];
    
    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, offy+49, UI_SCREEN_WIDTH, .5)];
    [line1 setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:line1];
    
    self.lblConfirmTip = [[UILabel alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2, offy+58, 240, 20)];
    [self.lblConfirmTip setText:@""];
    [self.lblConfirmTip setNumberOfLines:2];
    [self.lblConfirmTip setFont:[UIFont fontWithName:TEXT_FONT_NAME size:12]];
    [self.lblConfirmTip setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:self.lblConfirmTip];
    
    self.lblPayText = [[UILabel alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2, offy+80, 240, 20)];
    [self.lblPayText setText:@""];
    [self.lblPayText setTextAlignment:NSTextAlignmentLeft];
    [self.lblPayText setFont:[UIFont fontWithName:TEXT_FONT_NAME size:12]];
    [self addSubview:self.lblPayText];
    
    self.utf1 = [[ZLTextFiled alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2, offy+110, 240, 40)];
    [self.utf1 setFont:[UIFont fontWithName:TEXT_FONT_NAME size:20]];
    [self.utf1 setTextColor:[UIColor blackColor]];
    [self.utf1 setTextAlignment:NSTextAlignmentCenter];
    self.utf1.keyboardType = UIKeyboardTypeNumberPad;
    self.utf1.secureTextEntry = YES;
    self.utf1.delegate = self;
    [self addSubview:self.utf1];
    
    UIView * pwdBg = [[UIView alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2, offy+110, 240, 40)];
    [pwdBg setBackgroundColor:[UIColor whiteColor]];
    [pwdBg.layer setBorderWidth:.2];
    [pwdBg.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [pwdBg.layer setMasksToBounds:YES];
    [pwdBg.layer setCornerRadius:5];
    [pwdBg setUserInteractionEnabled:YES];
    [self addSubview:pwdBg];
    
    self.lbl1 = [[UILabel alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+1, offy+111, 38, 38)];
    [self.lbl1 setFont:[UIFont fontWithName:TEXT_FONT_NAME size:20]];
    [self.lbl1 setTextColor:[UIColor blackColor]];
    [self.lbl1 setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.lbl1];
    
    UIView * lineH1 = [[UIView alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+39.5, offy+110, .5, 40)];
    [lineH1 setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:lineH1];
    
    self.lbl2 = [[UILabel alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+40+1, offy+111, 38, 38)];
    [self.lbl2 setFont:[UIFont fontWithName:TEXT_FONT_NAME size:20]];
    [self.lbl2 setTextColor:[UIColor blackColor]];
    [self.lbl2 setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.lbl2];
    
    UIView * lineH2 = [[UIView alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+79.5, offy+110, .5, 40)];
    [lineH2 setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:lineH2];
    
    self.lbl3 = [[UILabel alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+80+1, offy+111, 38, 38)];
    [self.lbl3 setFont:[UIFont fontWithName:TEXT_FONT_NAME size:20]];
    [self.lbl3 setTextColor:[UIColor blackColor]];
    [self.lbl3 setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.lbl3];
    
    UIView * lineH3 = [[UIView alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+119.5, offy+110, .5, 40)];
    [lineH3 setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:lineH3];
    
    self.lbl4 = [[UILabel alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+120+1, offy+111, 38, 38)];
    [self.lbl4 setFont:[UIFont fontWithName:TEXT_FONT_NAME size:20]];
    [self.lbl4 setTextColor:[UIColor blackColor]];
    [self.lbl4 setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.lbl4];
    
    UIView * lineH4 = [[UIView alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+159.5, offy+110, .5, 40)];
    [lineH4 setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:lineH4];
    
    self.lbl5 = [[UILabel alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+160+1, offy+111, 38, 38)];
    [self.lbl5 setFont:[UIFont fontWithName:TEXT_FONT_NAME size:20]];
    [self.lbl5 setTextColor:[UIColor blackColor]];
    [self.lbl5 setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.lbl5];
    
    UIView * lineH5 = [[UIView alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+199.5, offy+110, .5, 40)];
    [lineH5 setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:lineH5];
    
    self.lbl6 = [[UILabel alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2+200+1, offy+111, 38, 38)];
    [self.lbl6 setFont:[UIFont fontWithName:TEXT_FONT_NAME size:20]];
    [self.lbl6 setTextColor:[UIColor blackColor]];
    [self.lbl6 setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.lbl6];
    
    self.btnForgetPwd = [[UIButton alloc] initWithFrame:CGRectMake((UI_SCREEN_WIDTH-240)/2, offy+152, 240, 30)];
    [self.btnForgetPwd setTitleEdgeInsets:UIEdgeInsetsMake(0, -160, 0, 0)];
    [self.btnForgetPwd.titleLabel setFont:[UIFont fontWithName:TEXT_FONT_NAME size:12]];
    [self.btnForgetPwd setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.btnForgetPwd setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.btnForgetPwd setTitle:@"忘记支付密码?" forState:UIControlStateNormal];
    [self.btnForgetPwd addTarget:self action:@selector(showRetriveOrderPwd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.btnForgetPwd];
    
    UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake(0, offy+185, UI_SCREEN_WIDTH, .5)];
    [line2 setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:line2];
    
    self.btnConfirm = [[UIButton alloc] initWithFrame:CGRectMake(UI_SCREEN_WIDTH/2+10, offy+192, UI_SCREEN_WIDTH/2-30, 40)];
    [self.btnConfirm setBackgroundColor:[UIColor whiteColor]];
    [self.btnConfirm.layer setMasksToBounds:YES];
    [self.btnConfirm.layer setCornerRadius:4];
    [self.btnConfirm setTitle:@"确定" forState:UIControlStateNormal];
    [self.btnConfirm setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.btnConfirm setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.btnConfirm addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnConfirm];
    
    self.btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(20, offy+192, UI_SCREEN_WIDTH/2-30, 40)];
    [self.btnCancel setBackgroundColor:[UIColor whiteColor]];
    [self.btnCancel.layer setMasksToBounds:YES];
    [self.btnCancel.layer setCornerRadius:4];
    [self.btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [self.btnCancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnCancel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self.btnCancel addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnCancel];
}

-(void)confirm:(id)sender{
    self.password = self.utf1.text;
    if (_delegate && [_delegate respondsToSelector:@selector(clickConfirmButton:)]) {
        [_delegate clickConfirmButton:self];
    }
}

-(void)cancel:(id)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(clickCancelButton:)]) {
        [_delegate clickCancelButton:self];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //删除操作
    if ([string isEqualToString:@""]) {
        if ([textField.text length] == 0) {
        }else if([textField.text length] == 1){
            self.lbl1.text = @"";
        }else if([textField.text length] == 2){
            self.lbl2.text = @"";
        }else if([textField.text length] == 3){
            self.lbl3.text = @"";
        }else if([textField.text length] == 4){
            self.lbl4.text = @"";
        }else if([textField.text length] == 5){
            self.lbl5.text = @"";
        }else if([textField.text length] == 6){
            self.lbl6.text = @"";
        }
        return YES;
    }
    //输入操作
    else{
        if ([textField.text length]>=6) {
            return NO;
        }
        if ([textField.text length] == 0) {
            self.lbl1.text = @"●";
        }else if([textField.text length] == 1){
            self.lbl2.text = @"●";
        }else if([textField.text length] == 2){
            self.lbl3.text = @"●";
        }else if([textField.text length] == 3){
            self.lbl4.text = @"●";
        }else if([textField.text length] == 4){
            self.lbl5.text = @"●";
        }else if([textField.text length] == 5){
            self.lbl6.text = @"●";
        }
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return NO;
}
-(void)showRetriveOrderPwd:(id)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(retrivePwdButton:)]) {
        [_delegate retrivePwdButton:self];
    }
}

-(void)showSettingOrderPwd:(id)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(settingPwdButton:)]) {
        [_delegate settingPwdButton:self];
    }
}
@end
