//
//  ViewController.m
//  103
//
//  Created by Phuong Nguyen on 4/9/14.
//  Copyright (c) 2014 Phuong Nguyen. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"//;
#import "FGalleryViewController.h";
@interface ViewController ()

@end

@implementation ViewController
@synthesize lable1;
@synthesize tableView;
@synthesize tablecell1;

NSArray *allLines;
FGalleryViewController *networkGallery;
//NSArray *networkImages;
NSArray *networkCaptions;

-(IBAction)buttonclick:(id)sender
{
    lable1.text=@"phuong nguyen";
   
  
    
    NSString *temp=@"";
    for (int i=0; i<3;i++)
    {
         temp =[temp stringByAppendingString:[allLines objectAtIndex:i]];//[allLines objectAtIndex:2];
    }
    //NSString *thirdLine = [allLines objectAtIndex:2];

    
    lable1.text=temp;
    DetailViewController    *detail=[[DetailViewController alloc] init];
    
    [self.navigationController pushViewController:detail animated:YES];

}

- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section {
	// Return the number of time zone names.
	return [allLines count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *MyIdentifier = @"MyIdentifier";
    NSLog(@"abc_");
	/*
     Retrieve a cell with the given identifier from the table view.
     The cell is defined in the main storyboard: its identifier is MyIdentifier, and  its selection style is set to None.
     */
	UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:MyIdentifier];
    
	// Set up the cell.
	NSString *timeZoneName = [allLines objectAtIndex:indexPath.row];
	cell.textLabel.text = timeZoneName;
    cell.imageView.image= [UIImage imageNamed:@"1.jpg"];
	return cell;
}
- (void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailViewController    *detail=[[DetailViewController alloc] init];
    detail.MainURL=[allLines objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
    
    
    NSURL *URL = [NSURL URLWithString:@"http://itmeshop.com/img/test.txt"];
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:URL
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    allLines = [stringFromFileAtURL componentsSeparatedByString: @"\n"];
    
    
    
    //networkImages =allLines;// [[NSArray alloc] initWithObjects:@"http://farm6.static.flickr.com/5042/5323996646_9c11e1b2f6_b.jpg", @"http://farm6.static.flickr.com/5007/5311573633_3cae940638.jpg",nil];
   // networkCaptions = [[NSArray alloc] initWithObjects:@"Happy New Year!",@"Frosty Web",@"3",@"34",@"35",@"36",@"3",@"3",@"38",@"9",nil];

    
    
    
   // networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
   // [self.navigationController pushViewController:networkGallery animated:YES];
  //  [networkGallery release];
    
  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *URL = [NSURL URLWithString:@"http://itmeshop.com/img/test.txt"];
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:URL
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    allLines = [stringFromFileAtURL componentsSeparatedByString: @"\n"];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - FGalleryViewControllerDelegate Methods


- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController *)gallery
{
    return 10;
    int num;
    
        num = [allLines count];
   
	return num;
}


- (FGalleryPhotoSourceType)photoGallery:(FGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index
{
	 
	  return FGalleryPhotoSourceTypeNetwork;
}


- (NSString*)photoGallery:(FGalleryViewController *)gallery captionForPhotoAtIndex:(NSUInteger)index
{
    NSString *caption;
    
        caption = [networkCaptions objectAtIndex:index];
    
	return caption;
}


//- (NSString*)photoGallery:(FGalleryViewController*)gallery filePathForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
 //   return [localImages objectAtIndex:index];
//}

- (NSString*)photoGallery:(FGalleryViewController *)gallery urlForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return [allLines objectAtIndex:index];
}

- (void)handleTrashButtonTouch:(id)sender {
    // here we could remove images from our local array storage and tell the gallery to remove that image
    // ex:
    //[localGallery removeImageAtIndex:[localGallery currentIndex]];
}


- (void)handleEditCaptionButtonTouch:(id)sender {
    // here we could implement some code to change the caption for a stored image
}

@end
