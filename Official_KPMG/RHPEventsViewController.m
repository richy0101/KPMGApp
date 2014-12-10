//
//  RHPEventsViewController.m
//  KPMG
//
//  Created by Richard Phillips on 12/2/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import "RHPEventsViewController.h"
#import "RHPEventsViewCell.h"
#import "RHPEventDetailViewController.h"

@interface RHPEventsViewController ()

@end

@implementation RHPEventsViewController

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
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    RHPEventsViewCell *cell;
    
    // Hard coded events for presentation purposes for KPMG
    switch(row)
    {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EventsCell1" forIndexPath:indexPath];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EventsCell2" forIndexPath:indexPath];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EventsCell3" forIndexPath:indexPath];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EventsCell4" forIndexPath:indexPath];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EventsCell5" forIndexPath:indexPath];
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EventsCell6" forIndexPath:indexPath];
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Event1ToDetail"]){
        
        //NSArray *indexPaths = [self.tableView indexPathsForSelectedRows];
        //NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        
        RHPEventDetailViewController *detailController = (RHPEventDetailViewController *)[segue destinationViewController];
        detailController.url = @"http://careers.usc.edu/eventcalendar/index.php?eID=2588";
        detailController.title = @"USC: KPMG at Career Fair";
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
