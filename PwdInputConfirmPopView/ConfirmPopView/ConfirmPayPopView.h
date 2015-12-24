//
//  ConfirmPayPopView.h
//  促利汇_门户
//
//  Created by zhanglei on 15/7/28.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLTextFiled.h"
@interface ConfirmPayPopView : UIView<UITextFieldDelegate>
@property (nonatomic,strong) UILabel * lblTitle;
@property (nonatomic,strong) UILabel * lblConfirmTip;
@property (nonatomic,strong) UILabel * lblPayText; 
@property (nonatomic,strong) UIButton * btnConfirm;
@property (nonatomic,strong) UIButton * btnCancel;
@property (nonatomic,strong) ZLTextFiled * utf1;
@property (nonatomic,strong) UILabel * lbl1;
@property (nonatomic,strong) UILabel * lbl2;
@property (nonatomic,strong) UILabel * lbl3;
@property (nonatomic,strong) UILabel * lbl4;
@property (nonatomic,strong) UILabel * lbl5;
@property (nonatomic,strong) UILabel * lbl6;
@property (nonatomic,strong) NSString * password;
@property (nonatomic,strong) NSString * orderId;
@property (nonatomic,strong) UIImageView * imageIcon;
@property (nonatomic,strong) UIButton * btnForgetPwd;
@property (assign,nonatomic) id delegate;
-(void)showRetriveOrderPwd:(id)sender;
-(void)showSettingOrderPwd:(id)sender;
@end
@protocol confirmDelegate <NSObject>

-(void)clickConfirmButton:(ConfirmPayPopView *)confirm;

-(void)retrivePwdButton:(ConfirmPayPopView *)confirm;

-(void)settingPwdButton:(ConfirmPayPopView *)confirm;

-(void)clickCancelButton:(ConfirmPayPopView *)confirm;
@end 
