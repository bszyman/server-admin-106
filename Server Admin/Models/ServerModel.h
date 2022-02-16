//
//  ServerModel.h
//  Server Admin
//
//  Created by Ben Szymanski on 2/15/22.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServerModel : NSObject

@property (copy) NSString *serverName;

@property (assign) BOOL addressBookEnabled;
@property (assign) BOOL afpEnabled;
@property (assign) BOOL dhcpEnabled;
@property (assign) BOOL dnsEnabled;
@property (assign) BOOL firewallEnabled;
@property (assign) BOOL ftpEnabled;
@property (assign) BOOL iCalEnabled;
@property (assign) BOOL iChatEnabled;
@property (assign) BOOL mailEnabled;
@property (assign) BOOL mobileAccessEnabled;
@property (assign) BOOL mySqlEnabled;
@property (assign) BOOL natEnabled;
@property (assign) BOOL netBootEnabled;
@property (assign) BOOL nfsEnabled;
@property (assign) BOOL openDirectoryEnabled;
@property (assign) BOOL podcastProducerEnabled;
@property (assign) BOOL printEnabled;
@property (assign) BOOL pushNotificationEnabled;
@property (assign) BOOL quickTimeStreamingEnabled;
@property (assign) BOOL radiusEnabled;
@property (assign) BOOL smbEnabled;
@property (assign) BOOL softwareUpdateEnabled;
@property (assign) BOOL vpnEnabled;
@property (assign) BOOL webEnabled;
@property (assign) BOOL xgridEnabled;

- (NSTreeNode *)sourceListStructure;

@end

NS_ASSUME_NONNULL_END
