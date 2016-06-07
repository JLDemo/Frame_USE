//
//  BaseChatViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/6.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "BaseChatViewController.h"
#import "NSUserDefaults+DemoSettings.h"


@interface BaseChatViewController ()

@end

@implementation BaseChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JSQMessages";
    
    self.senderId = kJSQDemoAvatarIdSquires;
    self.senderDisplayName = kJSQDemoAvatarDisplayNameSquires;
    self.demoData = [[DemoModelData alloc] init];
    
    
//    UIBarButtonItem *typing = [[UIBarButtonItem alloc] initWithImage:[UIImage jsq_defaultTypingIndicatorImage]
//                                                               style:UIBarButtonItemStyleBordered
//                                                              target:self
//                                                              action:@selector(receiveMessagePressed:)];
//    
//    UIBarButtonItem *indicator = [[UIBarButtonItem alloc] initWithTitle:@"indicator" style:UIBarButtonItemStyleBordered target:self action:@selector(indicator)];
//    self.navigationItem.rightBarButtonItems = @[typing, indicator];
    

}


#pragma -mark JSQMessagesCollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.demoData.messages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    JSQMessage *message = self.demoData.messages[indexPath.item];
    if ( !message.isMediaMessage ) {
        if ( [message.senderId isEqualToString:self.senderId] ) {
            cell.textView.textColor = [UIColor blackColor];
        }
        else {
            cell.textView.textColor = [UIColor whiteColor];
        }
        cell.textView.linkTextAttributes = @{ NSForegroundColorAttributeName : cell.textView.textColor,
                                              NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
    }
    
    return cell;
}

- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.demoData.messages[indexPath.item];
}

/**
 *  Notifies the data source that the item at indexPath has been deleted.
 *  Implementations of this method should remove the item from the data source.
 *
 *  @param collectionView The collection view requesting this information.
 *  @param indexPath      The index path that specifies the location of the item.
 */
- (void)collectionView:(JSQMessagesCollectionView *)collectionView didDeleteMessageAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessage *message = self.demoData.messages[indexPath.item];
    
    if ( [message.senderId isEqualToString:self.senderId] ) {
        return self.demoData.outgoingBubbleImageData;
    }else {
        return self.demoData.incomingBubbleImageData;
    }
}

- (id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessage *message = self.demoData.messages[indexPath.item];
    
    if ( [message.senderId isEqualToString:self.senderId] ) {
        return self.demoData.avatars[self.senderId];
    }else {
        return self.demoData.avatars[message.senderId];
    }
}

//@optional
- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


@end























