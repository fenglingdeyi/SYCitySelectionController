//
//  ViewController.m
//  SYCitySelectExample
//
//  Created by bcmac3 on 2016/11/22.
//  Copyright © 2016年 ShenYang. All rights reserved.
//

#import "ViewController.h"
#import "SYCitySelectionController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *locateBarButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
