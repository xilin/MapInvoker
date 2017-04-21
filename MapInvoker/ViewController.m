//
//  ViewController.m
//  MapInvoker
//
//  Created by LinXi on 20/04/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "MTAMapInvoker.h"
#import "MTAppleMapInvoker.h"
#import "MTBaiduMapInvoker.h"
#import "MapInvokeParamModel.h"
#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray<NSString *> *mapArray;

@property(nonatomic, strong) MapInvokeParamModel *paramModel;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

  self.paramModel = [MapInvokeParamModel new];
  self.paramModel.fromCoordinate2D =
      CLLocationCoordinate2DMake(39.954453, 116.403838);
  self.paramModel.toCoordinate2D =
      CLLocationCoordinate2DMake(38.977177, 116.046815);
  self.paramModel.fromName = @"天安门";
  self.paramModel.toName = @"目的地";
  self.paramModel.fromCity = @"北京";
  self.paramModel.toCity = @"河北雄县";

  self.mapArray = @[ @"Apple Map", @"AMap", @"Baidu Map", @"QQ Map" ];

  CGRect tableFrame = self.view.bounds;
  tableFrame.origin.y = 60;
  UITableView *tableView =
      [[UITableView alloc] initWithFrame:tableFrame
                                   style:UITableViewStylePlain];
  tableView.delegate = self;
  tableView.dataSource = self;
  [tableView registerClass:[UITableViewCell class]
      forCellReuseIdentifier:@"UITableViewCell"];
  [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.mapArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                      forIndexPath:indexPath];
  cell.textLabel.text = self.mapArray[indexPath.row];
  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSArray<NSString *> *classArray = @[
    @"MTAppleMapInvoker",
    @"MTAMapInvoker",
    @"MTBaiduMapInvoker",
    @"MTQQMapInvoker"
  ];
  Class class = NSClassFromString(classArray[indexPath.row]);
  if ([class conformsToProtocol:@protocol(MTMapInvokerProtocol)]) {
    [class performSelector:@selector(openNaviWithParma:)
                withObject:self.paramModel];
  }
}

@end
