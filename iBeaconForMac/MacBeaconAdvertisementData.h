//
//  MacBeaconAdvertisementData.h
//  iBeaconForMac
//
//  Created by danny on 2014/4/3.
//  Copyright (c) 2014年 danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MacBeaconAdvertisementData : NSObject

@property (strong,nonatomic) NSUUID *proximityUUID;
@property (assign,nonatomic) uint16_t major;
@property (assign,nonatomic) uint16_t minor;
@property (assign,nonatomic) int8_t measuredPower;

- (id)initWithProximityUUID:(NSUUID *)proximityUUID
                      major:(uint16_t)major
                      minor:(uint16_t)minor
              measuredPower:(int8_t)power;


- (NSDictionary *)beaconAdvertisement;

@end
