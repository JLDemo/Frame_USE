//
//  Book.h
//  Frame_USE
//
//  Created by kfz on 16/6/6.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Realm/Realm.h>

@interface Book : RLMObject

@property (assign, nonatomic) NSInteger bookId;

@property (assign, nonatomic) NSInteger count;

@end
