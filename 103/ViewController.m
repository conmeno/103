//
//  ViewController.m
//  103
//
//  Created by Phuong Nguyen on 4/9/14.
//  Copyright (c) 2014 Phuong Nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lable1;
-(IBAction)buttonclick:(id)sender
{
    lable1.text=@"phuong nguyen";
   
    NSURL *URL = [NSURL URLWithString:@"http://itmeshop.com/test.txt"];

    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:URL
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    
    
    
    lable1.text=stringFromFileAtURL;
if(stringFromFileAtURL==nil)
    lable1.text=@"load ko dc";
    
    NSArray *allLines = [stringFromFileAtURL componentsSeparatedByString: @"\n"];
    
    NSString *temp=@"";
    for (int i=0; i<3;i++)
    {
        NSLog([allLines objectAtIndex:i]);
        temp =[temp stringByAppendingString:[allLines objectAtIndex:i]];//[allLines objectAtIndex:2];
    }
    //NSString *thirdLine = [allLines objectAtIndex:2];

    
    lable1.text=temp;
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
