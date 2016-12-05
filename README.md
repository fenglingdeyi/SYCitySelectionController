# SYCitySelectionController
快速搭建一个城市选择控制器
感兴趣的给个Star吧...

# CocoaPods:
```
pod 'SYCitySelectionController', '~> 0.0.4'
```

# Usage:
导入头文件
```
#import "SYCitySelectionController.h"
```

```
SYCitySelectionController *city = [SYCitySelectionController new];
```

选择城市后回调
```
 city.selectCity = ^(NSString *city) {
        NSLog(@"%@", city);
        [self.locateBarButton setTitle:city];
    };
```
当前位置
```
city.currentCityName = @"厦门市";
```
开启定位(上面设置无效,请真机调试)
```
city.openLocation = YES;
```
返回按钮
```
city.currentCityName = @"厦门市";
UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
[b setTitle:@"Click Me Back" forState:UIControlStateNormal];
[b sizeToFit];
b.backgroundColor = [UIColor cyanColor];
city.backView = b;
```
热门城市
```
city.hotCitys = @[@"上海市", @"天津市", @"北京市", @"杭州市", @"厦门市", @"广州市", @"深圳市"];
```
所有城市
```
city.citys = @[@"上海市", @"天津市", @"北京市", @"杭州市", @"厦门市", @"广州市", @"深圳市"];
```
自己的城市Dict
```
NSArray *citys = @[@[@"上海市", @"深圳市"], @[@"天津市"], @[@"北京市"], @[@"杭州市"], @[@"厦门市"], @[@"广州市"]];
NSArray *index = @[@"S", @"T", @"B", @"H", @"X", @"G"];
city.cityDict = [NSDictionary dictionaryWithObjects:citys forKeys:index];
```


# 效果图
![](http://7xsuaf.com1.z0.glb.clouddn.com/ThreePart/City.gif)


# iteration:
0.0.4 - 发布第一个版本


# Other: 
使用中有任何问题，请将问题发送给我，谢谢大家帮忙完善!
Email: kellenyang@163.com

