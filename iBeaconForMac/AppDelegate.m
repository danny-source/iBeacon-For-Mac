//
//  AppDelegate.m
//  iBeaconForMac
//
//  Created by danny on 2014/4/3.
//  Copyright (c) 2014年 danny. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.pManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
}




- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    //
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        self.textStatus.stringValue = @"請確定藍牙是否支援4.0";
    }
    
    switch (peripheral.state) {
        case CBPeripheralManagerStatePoweredOn:
            self.textStatus.stringValue = @"藍牙已準備完成";
            break;
        case CBPeripheralManagerStatePoweredOff:
            self.textStatus.stringValue = @"請確定藍牙是否支援4.0";
            break;
        case CBPeripheralManagerStateUnsupported:
            self.textStatus.stringValue = @"請確定藍牙是否支援4.0";
            break;
            
            
        default:
            break;
    }
}


- (IBAction)btnStart:(id)sender {

    
    if (self.pManager.state != CBPeripheralManagerStatePoweredOn){
        self.textStatus.stringValue = @"請確定藍牙是否支援4.0";
        return;
    }
    
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:@"e2c56db5-dffb-48d2-b060-d0f5a71096e0"];
    //UUID:e2c56db5 dffb48d2 b060d0f5 a71096e0
    //MAJOR:0001
    //MINOR:0001
    //POWER:c6
    MacBeaconAdvertisementData *beaconData = [[MacBeaconAdvertisementData alloc] initWithProximityUUID:proximityUUID major:1 minor:1 measuredPower:-58];
    [self.pManager startAdvertising:beaconData.beaconAdvertisement];
    self.textStatus.stringValue = @"開始廣播iBeacon封包";
    
    
}

- (IBAction)btnStop:(id)sender {
    
    [self.pManager stopAdvertising];
    self.textStatus.stringValue = @"已停止iBeacon封包";
    
}
@end
