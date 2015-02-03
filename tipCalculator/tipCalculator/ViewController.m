//
//  ViewController.m
//  tipCalculator
//
//  Created by Manmada Reddy Nallagonda on 2/2/15.
//  Copyright (c) 2015 Manmada Reddy Nallagonda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentage;
@property (weak, nonatomic) IBOutlet UILabel *totalBillAmount;
- (IBAction)onTapEvent:(id)sender;
- (void) updateValues;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [self.billTextField becomeFirstResponder];
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapEvent:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues{
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipPercentage = @[@(0.1),@(0.15),@(0.2)];
    float tipValue = billAmount * [tipPercentage[self.tipPercentage.selectedSegmentIndex] floatValue];
    float totalAmount = tipValue + billAmount;
    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f",tipValue];
    self.totalBillAmount.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}
@end
