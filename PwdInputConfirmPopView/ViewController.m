//
//  ViewController.m
//  PwdInputConfirmPopView
//
//  Created by Mac on 15/12/24.
//  Copyright © 2015年 zhanglei. All rights reserved.
//

#import "ViewController.h"
#import "ConfirmPayPopView.h"
@interface ViewController ()
{
    ConfirmPayPopView * payPop;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btn setTitle:@"支付" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(showConfirmPopView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)showConfirmPopView:(id)sender{
    payPop = [[ConfirmPayPopView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [payPop setAlpha:1];
    [payPop.lblConfirmTip setText:@"￥138"];
    [payPop.lblPayText setText:[NSString stringWithFormat:@"订单号:%@",@"oid11234991238"]];
    payPop.delegate = self;
    [self.view addSubview:payPop];
    [self.view bringSubviewToFront:payPop];
    if (iPhone4s||iPhone5) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        payPop.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5f, 0.5f);
        [UIView commitAnimations];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        payPop.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        [UIView commitAnimations];
    }else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.01];
        payPop.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5f, 0.5f);
        [UIView commitAnimations];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        payPop.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        [UIView commitAnimations];
    }
    [payPop.utf1 becomeFirstResponder];
}

-(void)clickConfirmButton:(ConfirmPayPopView *)confirm{
    UIAlertController * controller  =[UIAlertController alertControllerWithTitle:@"提示" message:@"进行点击确认之后的处理" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    [controller addAction:ok];
    [controller addAction:cancel];
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}

-(void)clickCancelButton:(ConfirmPayPopView *)confirm{
    UIAlertController * controller  =[UIAlertController alertControllerWithTitle:@"提示" message:@"进行点击取消之后的处理" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    [controller addAction:ok];
    [controller addAction:cancel];
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
