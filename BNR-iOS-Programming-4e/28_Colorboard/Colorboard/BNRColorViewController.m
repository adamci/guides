//
//  BNRColorViewController.m
//  Colorboard
//
//  Created by Adam Cimpeanu on 7/16/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRColorViewController.h"

@interface BNRColorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;


@end

@implementation BNRColorViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Remove the 'Done' buton if this is an existing color
    if (self.existingColor) {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *color = self.colorDescription.color;
    
    // Get the RGB values out of the UIColor object
    float red, green, blue;
    [color getRed:&red
            green:&green
             blue:&blue
            alpha:nil];
    
    // Set the initial slider values
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    
    // Set the background color and text field value
    self.view.backgroundColor = color;
    self.textField.text = self.colorDescription.name;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.colorDescription.name = self.textField.text;
    self.colorDescription.color = self.view.backgroundColor;
}

- (IBAction)dismiss:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}

- (IBAction)changeColor:(id)sender
{
    float red = self.redSlider.value;
    float green = self.greenSlider.value;
    float blue = self.blueSlider.value;
    UIColor *newColor = [UIColor colorWithRed:red
                                        green:green
                                         blue:blue
                                        alpha:1.0];
    self.view.backgroundColor = newColor;
}

@end
