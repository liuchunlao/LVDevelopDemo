//
//  LVBlueToothViewController.m
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/5/14.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVBlueToothViewController.h"
#import "LVInfoViewController.h"

@interface LVBlueToothViewController () <CBCentralManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) CBCentralManager *manager;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *scanBtn;

/**
 *  外设数组
 */
@property (nonatomic, strong) NSMutableArray *peripherals;

- (IBAction)scan:(UIButton *)sender;

@end

@implementation LVBlueToothViewController

- (NSMutableArray *)peripherals {
    if (!_peripherals) {
        _peripherals = [NSMutableArray array];
    }
    return _peripherals;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scanBtn.layer.cornerRadius = 20;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    CBCentralManager *manager = [[CBCentralManager alloc] initWithDelegate:self queue:queue];
    self.manager = manager;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (IBAction)scan:(UIButton *)sender {
    
    [self.peripherals removeAllObjects];
    [self.tableView reloadData];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], CBCentralManagerScanOptionAllowDuplicatesKey, nil];
        
//    [self.manager retrieveConnectedPeripherals]; // 5.0 - 7.0

    [self.manager scanForPeripheralsWithServices:nil options:dict];
}

#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.peripherals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    CBPeripheral *peripheral = self.peripherals[indexPath.row];
    cell.textLabel.text = peripheral.name;
    cell.detailTextLabel.text = peripheral.identifier.UUIDString;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 连接外设
    CBPeripheral *peripheral = self.peripherals[indexPath.row];
    NSDictionary *option = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:CBConnectPeripheralOptionNotifyOnConnectionKey];
    [self.manager connectPeripheral:peripheral options:option];
}

#pragma mark - CBCentralManagerDelegate
/**
 *  中央管理器的状态改变了 代开蓝牙显示 CBCentralManagerStatePoweredOn 关闭蓝牙状态 CBCentralManagerStatePoweredOff
 */
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"1更新状态  === %zd", central.state);
}



- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary *)dict {
    NSLog(@"2 恢复状态 === %@", dict);
}


- (void)centralManager:(CBCentralManager *)central didRetrievePeripherals:(NSArray *)peripherals {
    NSLog(@"3 检索到设备=== %@", peripherals);
}


- (void)centralManager:(CBCentralManager *)central didRetrieveConnectedPeripherals:(NSArray *)peripherals {
    NSLog(@"4检索到已经连接的设备 === %@", peripherals);
    dispatch_async(dispatch_get_main_queue(), ^{

        for (CBPeripheral *peripheral in peripherals) {
            [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@为已连接设备", peripheral.name]];
        }
        [self.peripherals addObjectsFromArray:peripherals];
        [self.tableView reloadData];
    });
}


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
//    NSLog(@"5 === %@", peripheral);
    
    if (![self.peripherals containsObject:peripheral]) {
        [self.peripherals addObject:peripheral];
        
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    }
}


- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
    // 连接外设成功跳转显示设备信息控制器
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showSuccess:@"连接成功"];
        LVInfoViewController *infoVc = [[LVInfoViewController alloc] init];
        infoVc.peripheral = peripheral;
        infoVc.manager = self.manager;
        infoVc.title = peripheral.name;
        [self.navigationController pushViewController:infoVc animated:YES];
    });
}


- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    if (error) {
       
        NSLog(@"%@", error);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showError:@"连接失败"];
        });
        
    }else {
        NSLog(@"连接成功");
    }
}


- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"7 ===失去连接 %@", peripheral);
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [MBProgressHUD showError:@"断开连接"];
    });
    
}


@end
