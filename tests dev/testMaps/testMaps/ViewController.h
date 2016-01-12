//
//  ViewController.h
//  testMaps
//
//  Created by Lanusse Baptiste on 11/01/2016.
//  Copyright © 2016 Baptiste Lanusse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)openMaps:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *addressField;

@end

