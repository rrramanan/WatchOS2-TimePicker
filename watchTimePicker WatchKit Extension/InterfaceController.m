//
//  InterfaceController.m
//  watchTimePicker WatchKit Extension
//
//  Created by Vinod Ramanathan on 16/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController
NSMutableArray *HoursArray;
NSMutableArray *HoursLoadArray;
NSMutableArray *HoursFormatArray;
NSMutableArray *MinutesArray;
NSMutableArray *MinutesLoadArray;
NSMutableArray *ampmArray;
NSMutableArray *ampmLoadArray;

NSString *hhstr;
NSString *mmstr;
NSString *ampmstr;

NSString *totalTimeStr;

NSString *gethhstr   = @"01";
NSString *getmmstr   = @"00";
NSString *getampmstr = @"AM";


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    
    
HoursArray = [[NSMutableArray alloc]init];
    
HoursLoadArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
   
HoursFormatArray = [[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    
MinutesArray = [[NSMutableArray alloc]init];
    
MinutesLoadArray = [[NSMutableArray alloc]initWithObjects:@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",
    
@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52", @"53",@"54",@"55",@"56",@"57",@"58",@"59",nil];
    
ampmArray = [[NSMutableArray alloc]init];
    
ampmLoadArray = [[NSMutableArray alloc]initWithObjects:@"AM",@"PM", nil];

    
    for (int i=0; i < [HoursLoadArray count]; i++) {
        
        WKPickerItem *item = [[WKPickerItem alloc]init];
        
        NSString *getValue = [HoursLoadArray objectAtIndex:i];
        
        item.title = getValue;
        
        [HoursArray addObject:item];
        
    }
    
    
    for (int i=0; i < [MinutesLoadArray count]; i++) {
        
        WKPickerItem *item = [[WKPickerItem alloc]init];
        
        NSString *getValue = [MinutesLoadArray objectAtIndex:i];
        
        item.title = getValue;
        
        [MinutesArray addObject:item];
        
    }
    
    for (int i=0; i < [ampmLoadArray count]; i++) {
        
        WKPickerItem *item = [[WKPickerItem alloc]init];
        
        NSString *getValue = [ampmLoadArray objectAtIndex:i];
        
        item.title = getValue;
        
        [ampmArray addObject:item];
        
    }
    
    
    [_Hours setItems:HoursArray];
    [_Minutes setItems:MinutesArray];
    [_ampm setItems:ampmArray];
    
    
    //Set Current Time in Picker ***
    
    
    NSDate *today1 = [NSDate date];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    
    [dateFormat1 setDateFormat:@"hh:mm a"];
    NSString   *sample13 =[dateFormat1 stringFromDate:today1];
    NSLog(@"%@",sample13);
    
    [dateFormat1 setDateFormat:@"hh"];
    hhstr =[dateFormat1 stringFromDate:today1];
    NSLog(@"%@",hhstr);
    
    [dateFormat1 setDateFormat:@"mm"];
    mmstr =[dateFormat1 stringFromDate:today1];
    NSLog(@"%@",mmstr);
    
    [dateFormat1 setDateFormat:@"a"];
    ampmstr =[dateFormat1 stringFromDate:today1];
    NSLog(@"%@",ampmstr);
    
    
    for (int i=0; i < [HoursLoadArray count]; i++) {
        
        NSString *getval = [HoursFormatArray objectAtIndex:i];
        
        
        if ([hhstr isEqualToString:getval]) {
            
            int matchitem = i;
            
            NSLog(@"matchitem hh --- %d",i);
            
            if (matchitem == 0) {
                
                [_HoursLabel setText:@"01"];
                
            }
            
            [_Hours setSelectedItemIndex:matchitem];
            
        }
        
    }
    
    
    
    for (int i=0; i < [MinutesLoadArray count]; i++) {
        
        NSString *getval = [MinutesLoadArray objectAtIndex:i];
        
        
        if ([mmstr isEqualToString:getval]) {
            
            int matchitem1 = i;
            
            NSLog(@"matchitem mm --- %d",i);
            
            if (matchitem1 == 0) {
                
                [_MinutesLabel setText:@"00"];
                
            }
            
            [_Minutes setSelectedItemIndex:matchitem1];
            
        }
        
    }
    

    for (int i=0; i < [ampmLoadArray count]; i++) {
        
        NSString *getval = [ampmLoadArray objectAtIndex:i];
        
        
        if ([ampmstr isEqualToString:getval]) {
            
            int matchitem2 = i;
            
            NSLog(@"matchitem ampm --- %d",i);
            
            if (matchitem2 == 0) {
                
                [_ampmLable setText:@"AM"];
                
            }
            
            [_ampm setSelectedItemIndex:matchitem2];
            
        }
        
    }

    
    
    totalTimeStr = [NSString stringWithFormat:@"%@:%@  %@",hhstr,mmstr,ampmstr];
    
    NSLog(@"Output %@",totalTimeStr);
    
    [_TimeButton setTitle:totalTimeStr];
    
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)HoursAction:(NSInteger)value {
    
    //WKPickerItem *houritem = HoursArray[value];
    
    
    for(int i=0; i < [HoursFormatArray count]; i++) {
        
        NSString *getall = [HoursFormatArray objectAtIndex:i];
        
        if (value == i) {
            
            [_HoursLabel setText:getall];
            
            gethhstr = getall;
            
            totalTimeStr = [NSString stringWithFormat:@"%@:%@  %@",gethhstr,getmmstr,getampmstr];
    
            [_TimeButton setTitle:totalTimeStr];
            
        }
    }
    
    
  
    
    
}

- (IBAction)MinAction:(NSInteger)value {
    
    WKPickerItem *minitem = MinutesArray[value];
    
    [_MinutesLabel setText:minitem.title];
    
    getmmstr = minitem.title;
    
    totalTimeStr = [NSString stringWithFormat:@"%@:%@  %@",gethhstr,getmmstr,getampmstr];
    
    [_TimeButton setTitle:totalTimeStr];

    
}

- (IBAction)ampmAction:(NSInteger)value {
    
    WKPickerItem *ampmitem = ampmArray[value];
    
    [_ampmLable setText:ampmitem.title];
    
    getampmstr = ampmitem.title;
    
    totalTimeStr = [NSString stringWithFormat:@"%@:%@  %@",gethhstr,getmmstr,getampmstr];
    
    [_TimeButton setTitle:totalTimeStr];

    
}
- (IBAction)TimeAction {
    
    NSLog(@"Button %@",totalTimeStr);
    
}
@end



