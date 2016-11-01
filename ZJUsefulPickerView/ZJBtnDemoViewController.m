//
//  ZJBtnDemoViewController.m
//  ZJUsefulPickerView
//
//  Created by ZeroJ on 16/10/30.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJBtnDemoViewController.h"
#import "ZJUsefulPickerView.h"
typedef NS_ENUM(NSInteger, ZJPickerViewType) {
    ZJPickerViewTypeSingle,
    ZJPickerViewTypeMultiple,
    ZJPickerViewTypeMultipleAssociated,
    ZJPickerViewTypeCities,
    ZJPickerViewTypeDate,
    ZJPickerViewTypeTime
};

@interface ZJBtnDemoViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<NSString *> *data;
@end

@implementation ZJBtnDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _data = @[@"单列数据选择", @"多列不关联数据选择", @"多列关联数据选择", @"省市区选择", @"日期选择", @"时间选择"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const kCellID = @"kCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
    }
    cell.textLabel.text = _data[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZJPickerViewType type = indexPath.row;
    switch (type) {
        case ZJPickerViewTypeSingle: {
            
            [ZJUsefulPickerView showSingleColPickerWithToolBarText:@"单列数据" withData:@[@"objective-C", @"swift", @"iOS", @"iPad", @"iPod", @"mac", @"java", @"php", @"JavaScript"] withDefaultIndex:3 withCancelHandler:^{
                NSLog(@"quxiaole -----");

            } withDoneHandler:^(NSInteger selectedIndex, NSString *selectedValue) {
                NSLog(@"%@---%ld", selectedValue, selectedIndex);

            }];
        }
            break;
            
        case ZJPickerViewTypeMultiple:{
            /// 测试数据
            NSArray *data = @[@[@"1天", @"2天", @"3天", @"4天", @"5天", @"6天", @"7天"],@[@"1小时", @"2小时", @"3小时", @"4小时", @"5小时"],  @[@"1分钟",@"2分钟",@"3分钟",@"4分钟",@"5分钟",@"6分钟",@"7分钟",@"8分钟",@"9分钟",@"10分钟"]];
            [ZJUsefulPickerView showMultipleColPickerWithToolBarText:@"多列数据" withDefaultIndexs:@[@1, @2, @1] withData:data withCancelHandler:^{
                NSLog(@"quxiaole -----");
                
            } withDoneHandler:^(NSArray *selectedIndexs, NSArray *selectedValues) {
                NSLog(@"%@---%@", selectedValues, selectedIndexs);
                
            }];
        }
            break;
        case ZJPickerViewTypeMultipleAssociated: {
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
            [ZJUsefulPickerView showMultipleAssociatedColPickerWithToolBarText:@"多列关联数据-- 注意格式" withDefaultValues:@[@"交通工具", @"空中"] withData:multipleAssociatedData withCancelHandler:^{
                NSLog(@"quxiaole -----");

            } withDoneHandler:^(NSArray *selectedValues) {
                NSLog(@"%@---", selectedValues);
            }];
            
        }
            break;
        case ZJPickerViewTypeCities:
            
            
            [ZJUsefulPickerView showCitiesPickerWithToolBarText:@"省市区选择" withDefaultSelectedValues:@[@"四川", @"成都", @"郫县"] withCancelHandler:^{
                NSLog(@"quxiaole -----");

            } withDoneHandler:^(NSArray *selectedValues) {
                NSLog(@"%@---", selectedValues);

            }];
            
            break;
        case ZJPickerViewTypeDate: {
            [ZJUsefulPickerView showDatePickerWithToolBarText:@"日期选择" withStyle:nil withCancelHandler:^{
                NSLog(@"quxiaole -----");

            } withDoneHandler:^(NSDate *selectedDate) {
                NSLog(@"%@---", selectedDate);

            }];
        }
            break;
        case ZJPickerViewTypeTime: {
            ZJDatePickerStyle *style = [ZJDatePickerStyle new];
            style.datePickerMode = UIDatePickerModeTime;
            [ZJUsefulPickerView showDatePickerWithToolBarText:@"日期选择" withStyle:style withCancelHandler:^{
                NSLog(@"quxiaole -----");
                
            } withDoneHandler:^(NSDate *selectedDate) {
                NSLog(@"%@---", selectedDate);
                
            }];
        }
            break;
            
        default:
            break;
    }

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
