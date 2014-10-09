//
//  ThirdViewController.m
//  testing
//
//  Created by Viswa Gopisetty on 28/08/14.
//  Copyright (c) 2014 Viswa Gopisetty. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    simpleTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    simpleTableView.delegate = self;
    simpleTableView.dataSource = self;
    [simpleTableView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:simpleTableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"tableView"];
    UILabel *insideCell;
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView"];
        insideCell = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        [insideCell setTag:1];
        [insideCell setBackgroundColor:[UIColor cyanColor]];
        [insideCell setTextColor:[UIColor blackColor]];
        [cell.contentView addSubview:insideCell];
    }
    
    if(!insideCell) {
        insideCell = (UILabel *)[cell.contentView viewWithTag:1];
    }
    
    insideCell.text = [NSString stringWithFormat:@"%d",indexPath.section];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.section];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
