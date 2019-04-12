//
//  DIYSelectTimeView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYSelectTimeView.h"

@interface DIYSelectTimeView ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSMutableArray *monthArray;
    NSMutableArray *yearArray;
}
@property (weak, nonatomic) IBOutlet UIPickerView *timePickerView;
@property (nonatomic, assign) NSInteger selectRow;
@property (nonatomic, assign) NSInteger selectYearRow;

@end

@implementation DIYSelectTimeView

-(instancetype)init{
    if (self = [super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYSelectTimeView" owner:nil options:nil].lastObject;
        self.frame = CGRectMake(0, kScreenSizeHeight, kScreenSizeWidth, 250);
        self.animateType = BOTTOM_ANIMATE;
        [self fixPickerView];
    }
    return self;
}

-(void)fixPickerView{
    self.timePickerView.delegate = self;
    self.timePickerView.dataSource = self;
    
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *currentDateComponents = [calendar components:calendarUnit fromDate:currentDate];
    //初始化当前时间。
    NSInteger currentYear = [currentDateComponents year];
    NSInteger currentMonth = [currentDateComponents month];
    
    self.selectRow = currentMonth - 1;
    
    yearArray = [NSMutableArray new];
    monthArray = [[NSMutableArray alloc]init];
    
    //初始化月份数组(1-12)。
    NSArray *monthArr = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12"];
    
    for (int i = 0; i < currentMonth; i ++) {
        [monthArray addObject:monthArr[i]];
    }
    for (int i = 2016; i <= currentYear; i++) {
        [yearArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    self.selectYearRow = yearArray.count - 1;
//    [self.timePickerView reloadAllComponents];
    [self.timePickerView selectRow:self.selectYearRow inComponent:0 animated:NO];
    [self.timePickerView selectRow:self.selectRow inComponent:1 animated:NO];
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return yearArray.count;
    }
    
    return monthArray.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        return [NSString stringWithFormat:@"%@年", yearArray[row]];
    }
    
    return [NSString stringWithFormat:@"%@月", monthArray[row]];
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //    self.selectRow = row;
    //
    //    [self.timePickerView reloadAllComponents];
    switch (component) {
        case 0:{
            self.selectYearRow = row;
            if (self.selectYearRow != yearArray.count - 1) {
                monthArray = [NSMutableArray arrayWithArray: @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12"]];
                [pickerView reloadAllComponents];
            }else{
                NSDate *currentDate = [NSDate date];
                NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
                NSDateComponents *currentDateComponents = [calendar components:calendarUnit fromDate:currentDate];
                //初始化当前时间。
                NSInteger currentMonth = [currentDateComponents month];
                //初始化月份数组(1-12)。
                NSArray *monthArr = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12"];
                monthArray = [NSMutableArray new];
                for (int i = 0; i < currentMonth; i ++) {
                    [monthArray addObject:monthArr[i]];
                }
                self.selectRow = self.selectRow > monthArray.count - 1 ? monthArray.count - 1 : self.selectRow;
                [pickerView reloadAllComponents];
            }
        }
            break;
        case 1:{
            self.selectRow = row;
            [pickerView reloadAllComponents];
        }
            break;
        default:
            break;
    }
    
}
- (IBAction)commitAction:(UIButton *)sender {
    if (self.selectAction) {
        self.selectAction( [NSString stringWithFormat:@"%@-%@", yearArray[self.selectYearRow], monthArray[self.selectRow]], [NSString stringWithFormat:@"%@年%@月", yearArray[self.selectYearRow], monthArray[self.selectRow]]);
    }
    [self hiddenView];
}
- (IBAction)cancleAction:(UIButton *)sender {
    [self hiddenView];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
