//
//  ZJTextFieldViewController.m
//  ZJUsefulPickerView
//
//  Created by ZeroJ on 16/10/30.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJTextFieldViewController.h"
#import "ZJUsefulPickerView/ZJUsefulPickerView.h"
@interface ZJTextFieldViewController ()
@property (weak, nonatomic) IBOutlet ZJSelectedTextField *singleDataTextField;
@property (weak, nonatomic) IBOutlet ZJSelectedTextField *mutipleDataTextField;
@property (weak, nonatomic) IBOutlet ZJSelectedTextField *mutipleAssociatedDataTextField;
@property (weak, nonatomic) IBOutlet ZJSelectedTextField *cityDataTextField;
@property (weak, nonatomic) IBOutlet ZJSelectedTextField *dateDataTextField;
@property (weak, nonatomic) IBOutlet ZJSelectedTextField *timeDataTextField;

@end

@implementation ZJTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 单例
    {
        [_singleDataTextField showSingleColPickerWithToolBarText:@"单列数据" withData:@[@"objective-C", @"swift", @"iOS", @"iPad", @"iPod", @"mac", @"java", @"php", @"JavaScript"] withDefaultIndex:3 withCancelHandler:^{
            NSLog(@"quxiaole -----");
            
        } withDoneHandler:^(UITextField *textField, NSInteger selectedIndex, NSString *selectedValue) {
            NSLog(@"%@---%ld"  , selectedValue, selectedIndex);
            
        }];
    }
    
    // 多列不关联
    {
        

        NSArray *data = @[@[@"1天", @"2天", @"3天", @"4天", @"5天", @"6天", @"7天"],@[@"1小时", @"2小时", @"3小时", @"4小时", @"5小时"],  @[@"1分钟",@"2分钟",@"3分钟",@"4分钟",@"5分钟",@"6分钟",@"7分钟",@"8分钟",@"9分钟",@"10分钟"]];
        [_mutipleDataTextField showMultipleColPickerWithToolBarText:@"多列数据" withDefaultIndexs:@[@1, @2, @1] withData:data withCancelHandler:^{
            NSLog(@"quxiaole -----");
            
        } withDoneHandler:^(UITextField *textField, NSArray *selectedIndexs, NSArray *selectedValues) {
            NSLog(@"%@---%@", selectedValues, selectedIndexs);
            textField.text = [NSString stringWithFormat:@"%@", selectedValues];
        }];
    }
    
    // 多列关联
    {
        NSArray *multipleAssociatedData = @[// 数组
                                            @[@"交通工具", @"食品", @"游戏"], //这是第一列  --- 数组
                                            
                                            @{   /*key- 第一列中的   value(数组) --> 对应的第二类的数据 */
                                                @"交通工具": @[@"陆地", @"空中", @"水上"],//字典
                                                @"食品": @[@"健康食品", @"垃圾食品"],
                                                @"游戏": @[@"益智游戏", @"角色游戏"]
                                                
                                                },
                                            
                                            @{ /*key- 第二列中的   value(数组) --> 对应的第三类的数据 */
                                                @"陆地": @[@"公交车", @"小轿车", @"自行车"],
                                                @"空中": @[@"飞机"],
                                                @"水上": @[@"轮船"],
                                                @"健康食品": @[@"蔬菜", @"水果"],
                                                @"垃圾食品": @[@"辣条", @"不健康小吃"],
                                                @"益智游戏": @[@"消消乐", @"消灭星星"],
                                                @"角色游戏": @[@"lol", @"cf"]
                                                
                                                }
                                            // .......
                                            
                                            ];
        [_mutipleAssociatedDataTextField showMultipleAssociatedColPickerWithToolBarText:@"多列关联数据-- 注意格式" withDefaultValues:@[@"交通工具", @"空中"] withData:multipleAssociatedData withCancelHandler:^{
            NSLog(@"quxiaole -----");
            
        } withDoneHandler:^(UITextField *textField, NSArray *selectedValues) {
            NSLog(@"%@---", selectedValues);
        }];
    }
    
    // 省市区
    {
        
        // 不要自动设置选中的值
        _cityDataTextField.autoSetSelectedText = NO;
        [_cityDataTextField showCitiesPickerWithToolBarText:@"chengshi" withDefaultSelectedValues:@[@"四川", @"成都", @"郫县"] withCancelHandler:nil withDoneHandler:^(UITextField *textField, NSArray *selectedValues) {
            textField.text = [NSString stringWithFormat:@"%@------", selectedValues];
            
        }];
    }
    
    // 日期
    {
        [_dateDataTextField showDatePickerWithToolBarText:@"日期选择" withStyle:nil withCancelHandler:^{
            NSLog(@"quxiaole -----");
            
        } withDoneHandler:^(UITextField *textField, NSDate *selectedDate) {
            NSLog(@"%@---", selectedDate);
            
        }];
    }
    
    // 时间
    {
        ZJDatePickerStyle *style = [ZJDatePickerStyle new];
        style.datePickerMode = UIDatePickerModeTime;
        [_timeDataTextField showDatePickerWithToolBarText:@"日期选择" withStyle:style withCancelHandler:^{
            NSLog(@"quxiaole -----");
            
        } withDoneHandler:^(UITextField *textField, NSDate *selectedDate) {
            NSLog(@"%@---", selectedDate);
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
