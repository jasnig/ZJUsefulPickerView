# ZJUsefulPickerView
一个很有用的pickerView, 能够快速方便的弹出单列, 多列不关联, 多列关联数据的pickerView, 同时提供省市区联动的pickerView, 日期选择pickerView. 


![pickerView.gif](http://upload-images.jianshu.io/upload_images/1271831-0ce97c5e45557934.gif?imageMogr2/auto-orient/strip)

```
          [ZJUsefulPickerView showSingleColPickerWithToolBarText:@"单列数据" withData:@[@"objective-C", @"swift", @"iOS", @"iPad", @"iPod", @"mac", @"java", @"php", @"JavaScript"] withDefaultIndex:3 withCancelHandler:^{
                NSLog(@"quxiaole -----");
                
            } withDoneHandler:^(NSInteger selectedIndex, NSString *selectedValue) {
                NSLog(@"%@---%ld", selectedValue, selectedIndex);
                
            }];
            
            // 省市区选择
            [ZJUsefulPickerView showCitiesPickerWithToolBarText:@"省市区选择" withDefaultSelectedValues:@[@"四川", @"成都", @"郫县"] withCancelHandler:^{
                NSLog(@"quxiaole -----");

            } withDoneHandler:^(NSArray *selectedValues) {
                NSLog(@"%@---", selectedValues);

            }];
```

* 多列关联数据的显示, 注意数据的格式.

```
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
```


> 这是我写的<iOS自定义控件剖析>这本书籍中的一个demo, 如果你希望知道具体的实现过程和其他的一些常用效果的实现, 那么你应该能轻易在网上下载到免费的盗版书籍. 

> 当然作为本书的写作者, 还是希望有人能支持正版书籍. 如果你有意购买书籍, 在[这篇文章中](http://www.jianshu.com/p/510500f3aebd), 介绍了书籍中所有的内容和书籍适合阅读的人群, 和一些试读章节, 以及购买链接. 在你准备[购买](http://www.qingdan.us/product/13)之前, 请一定读一读里面的说明. 否则, 如果不适合你阅读, 虽然书籍售价35不是很贵, 但是也是一笔损失.


> 如果你希望联系到我, 可以通过[简书](http://www.jianshu.com/users/fb31a3d1ec30/latest_articles)联系到我
