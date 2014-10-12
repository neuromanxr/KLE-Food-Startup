//
//  KLEProfileViewController.m
//  KLEHackathon
//
//  Created by Kelvin Lee on 10/11/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "KLEProfileViewController.h"

@interface KLEProfileViewController ()

@property (nonatomic, strong) NSMutableArray *profile;

@end

@implementation KLEProfileViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Profile";
        
        // button to edit routine
        UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
        
        // set bar button to toggle editing mode
        editButton = self.editButtonItem;
        
        // set the button to be the right nav button of the nav item
        navItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:editButton, nil];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
    sectionHeaderView.backgroundColor = [UIColor grayColor];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, sectionHeaderView.frame.size.width, 25.0)];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [headerLabel setFont:[UIFont fontWithName:@"Verdana" size:20.0]];
    [sectionHeaderView addSubview:headerLabel];
    
    switch (section) {
        case 0:
            headerLabel.text = @"Bio";
            return sectionHeaderView;
            break;
        case 1:
            headerLabel.text = @"Goals";
            return sectionHeaderView;
            break;
        default:
            break;
    }
    return sectionHeaderView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    
    footerView.backgroundColor = [UIColor cyanColor];
    
    return footerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.profile count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *group = self.profile[section];
    
    return [group count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSArray *attributesArray = self.profile[indexPath.section];
    NSString *attributes = attributesArray[indexPath.row];
    cell.textLabel.text = attributes;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.profile = [[NSMutableArray alloc] init];
    
    NSArray *bio = @[@"Name", @"Gender", @"Age", @"Height", @"Weight"];
    NSArray *goals = @[@"Lose weight", @"Gain weight"];
    
    [self.profile addObject:bio];
    [self.profile addObject:goals];
    
}
@end
