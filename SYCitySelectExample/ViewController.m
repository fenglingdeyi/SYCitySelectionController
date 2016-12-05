//
//  ViewController.m
//  SYCitySelectExample
//
//  Created by bcmac3 on 2016/11/22.
//  Copyright © 2016年 ShenYang. All rights reserved.
//

#import "ViewController.h"
#import "SYCitySelectionController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *locateBarButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

    _datas = @[@"Example01 - 基本样式", @"Example02 - 定制返回按钮, 添加当前位置", @"Example03 - 开启定位, 添加热门数据", @"Example04 - 自定义数据(Array)", @"Example05 - 自定义数据(Dict)"];
}

- (IBAction)citySelectionEvent:(UIBarButtonItem *)sender {
    SYCitySelectionController *city = [SYCitySelectionController new];
    city.selectCity = ^(NSString *city) {
        NSLog(@"%@", city);
        [self.locateBarButton setTitle:city];
    };
    city.hotCitys = @[@"上海市", @"上海市",@"上海市",@"上海市",@"上海市"];
    city.currentCityName = @"厦门市";
    city.openLocation = YES;

//    city.allCity = @[@"阿门", @"阿霞", @"厦门", @"背景", @"北京"];
    city.cityDict = @{@"A" : @[@"阿门", @"阿大"],
                      @"X" : @[@"厦门"]
                      };


    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:city];
    [self presentViewController:navi animated:YES completion:nil];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - Delegate
#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = _datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    SYCitySelectionController *city = [SYCitySelectionController new];
    city.selectCity = ^(NSString *city) {
        NSLog(@"%@", city);
        [self.locateBarButton setTitle:city];
    };

    switch (indexPath.row) {
        case 1:{
            city.currentCityName = @"厦门市";
            UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
            b.frame = CGRectMake(0, 0, 44, 44);
            [b setTitle:@"Click Me Back" forState:UIControlStateNormal];
            b.backgroundColor = [UIColor cyanColor];
            city.backView = b;
        }
            break;
        case 2:{
            city.currentCityName = @"厦门市";
            UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
            [b setTitle:@"Click Me Back" forState:UIControlStateNormal];
            [b sizeToFit];
            b.backgroundColor = [UIColor cyanColor];
            city.backView = b;
            city.openLocation = YES;
            city.hotCitys = @[@"上海市", @"天津市", @"北京市", @"杭州市", @"厦门市", @"广州市", @"深圳市"];
        }
            break;
        case 3:{
            city.citys = @[@"上海市", @"天津市", @"北京市", @"杭州市", @"厦门市", @"广州市", @"深圳市"];
        }
            break;
        case 4:{
            NSArray *citys = @[@[@"上海市", @"深圳市"], @[@"天津市"], @[@"北京市"], @[@"杭州市"], @[@"厦门市"], @[@"广州市"]];
            NSArray *index = @[@"S", @"T", @"B", @"H", @"X", @"G"];
            city.cityDict = [NSDictionary dictionaryWithObjects:citys forKeys:index];
        }
            break;
        default:
            break;
    }

    if (arc4random_uniform(2) == 0) {
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:city];
        [self presentViewController:navi animated:YES completion:nil];
        return;
    }
    [self.navigationController pushViewController:city animated:YES];






}

@end
