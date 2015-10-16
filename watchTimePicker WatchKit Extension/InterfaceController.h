//
//  InterfaceController.h
//  watchTimePicker WatchKit Extension
//
//  Created by Vinod Ramanathan on 16/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfacePicker *Hours;

@property (strong, nonatomic) IBOutlet WKInterfacePicker *Minutes;

@property (strong, nonatomic) IBOutlet WKInterfacePicker *ampm;

- (IBAction)HoursAction:(NSInteger)value;

- (IBAction)MinAction:(NSInteger)value;

- (IBAction)ampmAction:(NSInteger)value;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *HoursLabel;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *MinutesLabel;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *ampmLable;

@property (strong, nonatomic) IBOutlet WKInterfaceButton *TimeButton;

- (IBAction)TimeAction;

@end
