//
//  FacebookUser.h
//  Tweasy
//
//  Created by Pedro Silva on 25/02/13.
//  Copyright (c) 2013 Tweasy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>


@interface FacebookUser : NSObject


@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * location;
@property (nonatomic, strong) NSString * url_cover_photo;

@end
