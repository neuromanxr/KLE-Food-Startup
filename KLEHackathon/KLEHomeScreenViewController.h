//
//  KLEHomeScreenViewController.h
//  KLEHackathon
//
//  Created by Kelvin Lee on 10/11/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import <Foundation/Foundation.h>

@interface KLEHomeScreenViewController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *loginView;
@property (strong, nonatomic) IBOutlet UIButton *emailLogin;

@end
