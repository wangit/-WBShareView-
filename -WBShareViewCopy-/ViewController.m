//
//  ViewController.m
//  -WBShareViewCopy-
//
//  Created by lifesea on 2018/9/4.
//  Copyright © 2018年 lifesea. All rights reserved.
//

#import "ViewController.h"
#import "WBShareView.h"
#define IMG(NAME) [UIImage imageNamed:(@NAME)]

@interface ViewController ()<WBShareViewDelegate,WBShareViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showView:(id)sender {

    WBShareView *view = [[WBShareView alloc]initWithHigh:300];
    //[self.view addSubview:view];
    //view.lineNumber = 3;
    view.imgUnderlySize = CGSizeMake(44, 44);
    view.cancelCor = [UIColor whiteColor];
    view.rowAdaption = YES;
    view.delegate = self;
    view.dataSource = self;
    view.lineIconText = @[@[@"张三",@"李老四"],@[@"q",@"w",@"e",@"r",@"r",@"r",@"r",@"r",@"r",@"r"],@[@"撒",@"下订单",@"放",@"放"]];
    view.lineIconImg = @[@[IMG("copy"),IMG("copy")],@[IMG("copy"),IMG("copy"),IMG("copy"),IMG("copy"),IMG("copy"),IMG("copy"),IMG("copy"),IMG("copy"),IMG("copy"),IMG("copy")],@[IMG("copy"),IMG("download"),IMG("edit"),IMG("enclosure")]];
    [view showInView:self.view];
}

- (NSInteger)numberOfSectionsInWBShareView:(UIView *)wbShareView{
    return 3;
}
- (CGFloat)wbShareView:(UIView *)wbShareViewheightForRow{
    return 100;
}
- (BOOL)wbShareViewLable:(UILabel *)lable hideCaptionForRowAtIndexPath:(int)indexPath{
    
    if (indexPath == 0) {
        lable.font = [UIFont systemFontOfSize:12];
        return NO;
    }
    return YES;
}

- (BOOL)wbShareViewlineView:(UIView *)lineView hideCaptionForRowAtIndexPath:(int)indexPath{
    lineView.backgroundColor = [UIColor purpleColor];
    if (indexPath == 2) {
        return YES;
    }
    
    return NO;
}
- (NSString *)wbShareViewLableTitle:(UILabel *)lable titleForRowAtIndexPath:(int)indexPath{
    return @"分享给";
}

- (UIColor *)wbShareViewContentView:(UIView *)contentView colorForRowAtIndexPath:(int)indexPath{
    return [UIColor colorWithRed:188/255.0 green:192/255.0 blue:192/255.0 alpha:0.4];
}
- (void)wbShareView:(UIView *)wbShareView didSelectRowAtIndexPath:(long)indexPath ColumnAtIndexPath:(long)indexColumn{
    NSLog(@"%@--%ld--%ld",wbShareView,indexPath,indexColumn);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
