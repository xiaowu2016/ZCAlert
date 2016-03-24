//
//  ZCTableViewController.m
//  21321312312
//
//  Created by zhangchao on 16/3/11.
//  Copyright © 2016年 zhangchao. All rights reserved.
//

#import "ZCTableViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ZCTableViewController ()

@end

@implementation ZCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark 实现方法

//创建只有一个按钮的弹框，并在点击时做某些事情
- (void)showAlertOneButtonWithTitle:(nullable NSString *)title
                         AndMessage:(nullable NSString *)message
                     AndAlertStyle :(UIAlertControllerStyle)style
                  AndOneButtonTitle:(nonnull NSString *)oneTitle
                           AndBlock:(__nullable BLOCK)block
{
    UIAlertController *ZCAlert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *oneAction = [UIAlertAction actionWithTitle:oneTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(block)
        {
            block();
        }
    }];
    [ZCAlert addAction:oneAction];
    [self presentViewController:ZCAlert animated:YES completion:nil];
}


//创建有两个按钮的弹框，两个按钮都自定义,并在点击这两个按钮时做某些事情
- (void)showAlertTwoButtonWithTitle:(nullable NSString *)title
                         AndMessage:(nullable NSString *)message
                     AndAlertStyle :(UIAlertControllerStyle)style
                  AndOneButtonTitle:(nonnull NSString *)oneTitle
                  AndTwoButtonTitle:(nonnull NSString *)twoTitle
                        AndOneBlock:(__nullable BLOCK)oneBlock
                        AndTwoBlock:(__nullable BLOCK)twoBlock
{
    UIAlertController *ZCAlert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *oneAction = [UIAlertAction actionWithTitle:oneTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(oneBlock)
        {
            oneBlock();
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:twoTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if(twoBlock)
        {
            twoBlock();
        }
    }];
    [ZCAlert addAction:oneAction];
    [ZCAlert addAction:cancelAction];
    [self presentViewController:ZCAlert animated:YES completion:nil];
}


//创建有三个按钮的弹框，三个按钮都自定义,并在点击这些按钮时做某些事情
- (void)showAlertThreeButtonWithTitle:(nullable NSString *)title
                           AndMessage:(nullable NSString *)message
                       AndAlertStyle :(UIAlertControllerStyle)style
                    AndOneButtonTitle:(nonnull NSString *)oneTitle
                    AndTwoButtonTitle:(nonnull NSString *)twoTitle
                  AndThreeButtonTitle:(nonnull NSString *)threeTitle
                          AndOneBlock:(__nullable BLOCK)oneBlock
                          AndTwoBlock:(__nullable BLOCK)twoBlock
                        AndThreeBlock:(__nullable BLOCK)threeBlock
{
    UIAlertController *ZCAlert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *oneAction = [UIAlertAction actionWithTitle:oneTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(oneBlock)
        {
            oneBlock();
        }
    }];
    UIAlertAction *twoAction = [UIAlertAction actionWithTitle:twoTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(twoBlock)
        {
            twoBlock();
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:threeTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if(threeBlock)
        {
            threeBlock();
        }
    }];
    [ZCAlert addAction:oneAction];
    [ZCAlert addAction:twoAction];
    [ZCAlert addAction:cancelAction];
    [self presentViewController:ZCAlert animated:YES completion:nil];
}

//创建一个弹框，可以自行定义有多少个按钮，但是需要传入按钮的title，并且每个按钮都可以定义一个BLOCK放到BLOCK数组中，在BLOCK中做自己想做的事
- (void)showAlertWithWithTitle:(nullable NSString *)title
                    AndMessage:(nullable NSString *)message
                AndAlertStyle :(UIAlertControllerStyle)style
               AndButtonString:(nonnull NSArray *)array
                 AndBlockArray:(nonnull NSArray<BLOCK> *)blockArray
{
    UIAlertController *ZCAlert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    for(int i = 0; i < array.count; i++)
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:array[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if(blockArray[i])
            {
                blockArray[i]();
            }
        }];
        [ZCAlert addAction:action];
    }
    [self presentViewController:ZCAlert animated:YES completion:nil];
}



//在视图上显示一个自定义的Label,并使它停留一断时间
- (void)showLabelWithString:(nonnull NSString *)string
                   AndBlock:(__nullable BLOCK)block
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth * 0.3, kHeight * 0.5, kWidth * 0.4, 50)];
    label.backgroundColor = [UIColor colorWithRed:0.286 green:0.280 blue:0.298 alpha:1.000];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.alpha = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.3 animations:^{
        label.text = string;
        label.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:1.5 options:UIViewAnimationOptionCurveEaseIn  animations:^{
            label.alpha = 0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
            if(block)
            {
                block();
            }
        }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
