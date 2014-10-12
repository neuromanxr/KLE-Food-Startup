//
//  KLEHomeScreenViewController.m
//  KLEHackathon
//
//  Created by Kelvin Lee on 10/11/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "KLEHomeScreenViewController.h"
#import "KLEProfileViewController.h"

@interface KLEHomeScreenViewController ()

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation KLEHomeScreenViewController

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    self.profilePictureView.profileID = [user objectID];
    self.nameLabel.text = user.name;
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    self.statusLabel.text = @"You're logged in as";
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.profilePictureView.profileID = nil;
    self.nameLabel.text = @"";
    self.statusLabel.text = @"You're not logged in!";
}

- (void)loggedIn
{
    NSLog(@"logged in");
    KLEProfileViewController *pvc = [[KLEProfileViewController alloc] init];
    
    [self.navigationController pushViewController:pvc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.emailLogin addTarget:self action:@selector(loggedIn) forControlEvents:UIControlEventTouchUpInside];

    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
}

@end
