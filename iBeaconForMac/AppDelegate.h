//
//  AppDelegate.h
//  iBeaconForMac
//
//  Created by danny on 2014/4/3.
//  Copyright (c) 2014年 danny. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <IOBluetooth/IOBluetooth.h>
#import "MacBeaconAdvertisementData.h"


@interface AppDelegate : NSObject <NSApplicationDelegate, CBPeripheralManagerDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong, nonatomic) CBPeripheralManager *pManager;
@property (strong, nonatomic) CBPeripheral *pPeripheral;

- (IBAction)btnStart:(id)sender;
- (IBAction)btnStop:(id)sender;
@property (weak) IBOutlet NSTextField *textStatus;

@end
