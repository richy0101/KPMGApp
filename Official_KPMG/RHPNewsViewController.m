//
//  RHPNewsViewController.m
//  KPMG
//
//  Created by Richard Phillips on 12/1/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import "RHPNewsViewController.h"
#import "RHPDataModel.h"
#import "RHPNewsViewCell.h"
#import "RHPNewsDetailViewController.h"

@interface RHPNewsViewController ()

@property (strong,nonatomic) RHPDataModel *model;

@end

@implementation RHPNewsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.model = [RHPDataModel sharedModel];
    self.tableView.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:73.0/255.0 blue:94.0/255.0 alpha:1.0];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.model numberOfNews];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RHPNewsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *cellText = [self.model newsAtIndex:indexPath.row];
    NSString *cellDate = [self.model dateAtIndex:indexPath.row];
    cell.headline.text = cellText;
    cell.date.text = cellDate;
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NewsToDetail"]){
        
        NSArray *indexPaths = [self.tableView indexPathsForSelectedRows];
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        
        RHPNewsDetailViewController *detailController = (RHPNewsDetailViewController *)[segue destinationViewController];
        detailController.url = [self.model urlAtIndex:indexPath.row];
        detailController.title = [self.model newsAtIndex:indexPath.row];
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.model removeAnswerAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}*/


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
