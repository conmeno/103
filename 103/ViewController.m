//
//  ViewController.m
//  103
//
//  Created by Phuong Nguyen on 4/9/14.
//  Copyright (c) 2014 Phuong Nguyen. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"//;
//#import "FGalleryViewController.h";
@interface ViewController ()
@property (nonatomic) NSArray *allLines;
@end

@implementation ViewController
@synthesize lable1;
@synthesize tableView;
@synthesize tablecell1;


//FGalleryViewController *networkGallery;
//NSArray *networkImages;
NSArray *networkCaptions;

-(IBAction)buttonclick:(id)sender
{
    lable1.text=@"phuong nguyen";
   
  
    
    NSString *temp=@"";
    for (int i=0; i<3;i++)
    {
         temp =[temp stringByAppendingString:[self.allLines objectAtIndex:i]];//[allLines objectAtIndex:2];
    }
    
    lable1.text=temp;
    DetailViewController    *detail=[[DetailViewController alloc] init];
    
    [self.navigationController pushViewController:detail animated:YES];

}

- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section {
	// Return the number of time zone names.
	return [self.allLines count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *MyIdentifier = @"MyIdentifier"; 	UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:MyIdentifier];
    
	// Set up the cell.
   //[self loadData];
	NSString *rowValue = [self.allLines objectAtIndex:indexPath.row];
    NSArray *arrayTitle=[rowValue componentsSeparatedByString: @"|||"];
	cell.textLabel.text = [arrayTitle objectAtIndex:1];;
    //cell.imageView.image= [UIImage imageNamed:@"ss.png"];
    //cell.textLabel.textColor=[UIColor redColor];
    	return cell;
}
- (void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      [self loadData];
    NSString *MainURL=@"http://fataco.com/truyen/truyena/";
    NSString *rowValue = [self.allLines objectAtIndex:indexPath.row];
    NSArray *arrayTitle=[rowValue componentsSeparatedByString: @"|||"];
    NSString *FullURL = [MainURL stringByAppendingString: [arrayTitle objectAtIndex:0]];

    DetailViewController    *detail=[[DetailViewController alloc] init];
    detail.MainURL=[FullURL stringByReplacingOccurrencesOfString:@"\r"
                                                               withString:@""];
    //load array of images for detail
    NSURL *URL = [NSURL URLWithString:detail.MainURL];
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:URL
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    NSArray *allLines2 = [stringFromFileAtURL componentsSeparatedByString: @"\n"];
    detail.allLines=allLines2;
    detail.CurrentIndex=0;
    [self.navigationController pushViewController:detail animated:YES];
  
}
-(void)loadData
{
    NSString *MainURL=@"http://fataco.com/truyen/truyena/";
    NSURL *URL = [NSURL URLWithString:[MainURL stringByAppendingString:@"episodes.txt" ]];
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:URL
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    self.allLines = [stringFromFileAtURL componentsSeparatedByString: @"\n"];
}
- (void)viewDidLoad
{
     
    [super viewDidLoad];
    [self loadData];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
@end
