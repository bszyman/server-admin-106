//
//  ServerModel.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/15/22.
//

#import "ServerModel.h"
#import "ServiceNavigationItem.h"

@implementation ServerModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.serverName = @"new-server.local";

        self.addressBookEnabled = YES;
        self.afpEnabled = YES;
        self.dhcpEnabled = YES;
        self.dnsEnabled = YES;
        self.firewallEnabled = YES;
        self.ftpEnabled = YES;
        self.iCalEnabled = YES;
        self.iChatEnabled = YES;
        self.mailEnabled = YES;
        self.mobileAccessEnabled = YES;
        self.mySqlEnabled = YES;
        self.natEnabled = YES;
        self.netBootEnabled = YES;
        self.nfsEnabled = YES;
        self.openDirectoryEnabled = YES;
        self.podcastProducerEnabled = YES;
        self.printEnabled = YES;
        self.pushNotificationEnabled = YES;
        self.quickTimeStreamingEnabled = YES;
        self.radiusEnabled = YES;
        self.smbEnabled = YES;
        self.softwareUpdateEnabled = YES;
        self.vpnEnabled = YES;
        self.webEnabled = YES;
        self.xgridEnabled = YES;
    }
    
    return self;
}

- (NSTreeNode *)sourceListStructure
{
    ServiceNavigationItem *serverItem = [[ServiceNavigationItem alloc] initWithTitle:self.serverName
                                                                          serverHost:self.serverName
                                                                        andServiceId:@"server-node"];
    NSTreeNode *serverNode = [NSTreeNode treeNodeWithRepresentedObject:serverItem];
    
    if (self.addressBookEnabled) {
        ServiceNavigationItem *addressBookService = [[ServiceNavigationItem alloc] initWithTitle:@"Address Book"
                                                                                      serverHost:self.serverName
                                                                                    andServiceId:@"address-book"];
        NSTreeNode *addressBookNode = [NSTreeNode treeNodeWithRepresentedObject:addressBookService];
        [serverNode.mutableChildNodes addObject:addressBookNode];
    }
    
    if (self.afpEnabled) {
        ServiceNavigationItem *afpService = [[ServiceNavigationItem alloc] initWithTitle:@"AFP"
                                                                              serverHost:self.serverName
                                                                            andServiceId:@"afp"];
        
        NSTreeNode *afpNode = [NSTreeNode treeNodeWithRepresentedObject:afpService];
        [serverNode.mutableChildNodes addObject:afpNode];
    }

    if (self.dhcpEnabled) {
        ServiceNavigationItem *dhcpService = [[ServiceNavigationItem alloc] initWithTitle:@"DHCP"
                                                                               serverHost:self.serverName
                                                                             andServiceId:@"dhcp"];
        
        NSTreeNode *dhcpNode = [NSTreeNode treeNodeWithRepresentedObject:dhcpService];
        [serverNode.mutableChildNodes addObject:dhcpNode];
    }

    if (self.dnsEnabled) {
        ServiceNavigationItem *dnsService = [[ServiceNavigationItem alloc] initWithTitle:@"DNS"
                                                                              serverHost:self.serverName
                                                                            andServiceId:@"dns"];
        
        NSTreeNode *dnsNode = [NSTreeNode treeNodeWithRepresentedObject:dnsService];
        [serverNode.mutableChildNodes addObject:dnsNode];
    }

    if (self.firewallEnabled) {
        ServiceNavigationItem *firewallService = [[ServiceNavigationItem alloc] initWithTitle:@"Firewall"
                                                                                   serverHost:self.serverName
                                                                                 andServiceId:@"firewall"];
        
        NSTreeNode *firewallNode = [NSTreeNode treeNodeWithRepresentedObject:firewallService];
        [serverNode.mutableChildNodes addObject:firewallNode];
    }

    if (self.ftpEnabled) {
        ServiceNavigationItem *ftpService = [[ServiceNavigationItem alloc] initWithTitle:@"FTP"
                                                                              serverHost:self.serverName
                                                                            andServiceId:@"ftp"];
        
        NSTreeNode *ftpNode = [NSTreeNode treeNodeWithRepresentedObject:ftpService];
        [serverNode.mutableChildNodes addObject:ftpNode];
    }

    if (self.iCalEnabled) {
        ServiceNavigationItem *iCalService = [[ServiceNavigationItem alloc] initWithTitle:@"iCal"
                                                                               serverHost:self.serverName
                                                                             andServiceId:@"ical"];
        
        NSTreeNode *iCalNode = [NSTreeNode treeNodeWithRepresentedObject:iCalService];
        [serverNode.mutableChildNodes addObject:iCalNode];
    }

    if (self.iChatEnabled) {
        ServiceNavigationItem *iChatService = [[ServiceNavigationItem alloc] initWithTitle:@"iChat"
                                                                                serverHost:self.serverName
                                                                              andServiceId:@"ichat"];
        
        NSTreeNode *iChatNode = [NSTreeNode treeNodeWithRepresentedObject:iChatService];
        [serverNode.mutableChildNodes addObject:iChatNode];
    }

    if (self.mailEnabled) {
        ServiceNavigationItem *mailService = [[ServiceNavigationItem alloc] initWithTitle:@"Mail"
                                                                               serverHost:self.serverName
                                                                             andServiceId:@"mail"];
        
        NSTreeNode *mailNode = [NSTreeNode treeNodeWithRepresentedObject:mailService];
        [serverNode.mutableChildNodes addObject:mailNode];
    }

    if (self.mobileAccessEnabled) {
        ServiceNavigationItem *mobileAccessService = [[ServiceNavigationItem alloc] initWithTitle:@"Mobile Access"
                                                                                       serverHost:self.serverName
                                                                                     andServiceId:@"mobile-access"];
        
        NSTreeNode *mobileAccessNode = [NSTreeNode treeNodeWithRepresentedObject:mobileAccessService];
        [serverNode.mutableChildNodes addObject:mobileAccessNode];
    }

    if (self.mySqlEnabled) {
        ServiceNavigationItem *mySqlService = [[ServiceNavigationItem alloc] initWithTitle:@"MySQL"
                                                                                serverHost:self.serverName
                                                                              andServiceId:@"mysql"];
        
        NSTreeNode *mySqlNode = [NSTreeNode treeNodeWithRepresentedObject:mySqlService];
        [serverNode.mutableChildNodes addObject:mySqlNode];
    }

    if (self.natEnabled) {
        ServiceNavigationItem *natService = [[ServiceNavigationItem alloc] initWithTitle:@"NAT"
                                                                              serverHost:self.serverName
                                                                            andServiceId:@"nat"];
        
        NSTreeNode *natNode = [NSTreeNode treeNodeWithRepresentedObject:natService];
        [serverNode.mutableChildNodes addObject:natNode];
    }

    if (self.netBootEnabled) {
        ServiceNavigationItem *netBootService = [[ServiceNavigationItem alloc] initWithTitle:@"NetBoot"
                                                                                  serverHost:self.serverName
                                                                                andServiceId:@"netboot"];
        
        NSTreeNode *netBootNode = [NSTreeNode treeNodeWithRepresentedObject:netBootService];
        [serverNode.mutableChildNodes addObject:netBootNode];
    }

    if (self.nfsEnabled) {
        ServiceNavigationItem *nfsService = [[ServiceNavigationItem alloc] initWithTitle:@"NFS"
                                                                              serverHost:self.serverName
                                                                            andServiceId:@"nfs"];
        
        NSTreeNode *nfsNode = [NSTreeNode treeNodeWithRepresentedObject:nfsService];
        [serverNode.mutableChildNodes addObject:nfsNode];
    }

    if (self.openDirectoryEnabled) {
        ServiceNavigationItem *openDirectoryService = [[ServiceNavigationItem alloc] initWithTitle:@"OpenDirectory"
                                                                                        serverHost:self.serverName
                                                                                      andServiceId:@"opendirectory"];
        
        NSTreeNode *openDirectoryNode = [NSTreeNode treeNodeWithRepresentedObject:openDirectoryService];
        [serverNode.mutableChildNodes addObject:openDirectoryNode];
    }

    if (self.podcastProducerEnabled) {
        ServiceNavigationItem *podcastProducerService = [[ServiceNavigationItem alloc] initWithTitle:@"Podcast Producer"
                                                                                          serverHost:self.serverName
                                                                                        andServiceId:@"podcast-producer"];
        
        NSTreeNode *podcastProducerNode = [NSTreeNode treeNodeWithRepresentedObject:podcastProducerService];
        [serverNode.mutableChildNodes addObject:podcastProducerNode];
    }

    if (self.printEnabled) {
        ServiceNavigationItem *printService = [[ServiceNavigationItem alloc] initWithTitle:@"Print"
                                                                                serverHost:self.serverName
                                                                              andServiceId:@"print"];
        
        NSTreeNode *printNode = [NSTreeNode treeNodeWithRepresentedObject:printService];
        [serverNode.mutableChildNodes addObject:printNode];
    }

    if (self.pushNotificationEnabled) {
        ServiceNavigationItem *pushNotificationService = [[ServiceNavigationItem alloc] initWithTitle:@"Push Notification"
                                                                                           serverHost:self.serverName
                                                                                         andServiceId:@"push-notification"];
        
        NSTreeNode *pushNotificationNode = [NSTreeNode treeNodeWithRepresentedObject:pushNotificationService];
        [serverNode.mutableChildNodes addObject:pushNotificationNode];
    }

    if (self.quickTimeStreamingEnabled) {
        ServiceNavigationItem *quickTimeStreamingService = [[ServiceNavigationItem alloc] initWithTitle:@"QuickTime Streaming"
                                                                                           serverHost:self.serverName
                                                                                         andServiceId:@"quicktime-streaming"];
        
        NSTreeNode *quickTimeStreamingNode = [NSTreeNode treeNodeWithRepresentedObject:quickTimeStreamingService];
        [serverNode.mutableChildNodes addObject:quickTimeStreamingNode];
    }

    if (self.radiusEnabled) {
        ServiceNavigationItem *radiusService = [[ServiceNavigationItem alloc] initWithTitle:@"RADIUS"
                                                                                 serverHost:self.serverName
                                                                               andServiceId:@"radius"];
        
        NSTreeNode *radiusNode = [NSTreeNode treeNodeWithRepresentedObject:radiusService];
        [serverNode.mutableChildNodes addObject:radiusNode];
    }

    if (self.smbEnabled) {
        ServiceNavigationItem *smbService = [[ServiceNavigationItem alloc] initWithTitle:@"SMB"
                                                                              serverHost:self.serverName
                                                                            andServiceId:@"smb"];
        
        NSTreeNode *smbNode = [NSTreeNode treeNodeWithRepresentedObject:smbService];
        [serverNode.mutableChildNodes addObject:smbNode];
    }

    if (self.softwareUpdateEnabled) {
        ServiceNavigationItem *softwareUpdateService = [[ServiceNavigationItem alloc] initWithTitle:@"Software Update"
                                                                                         serverHost:self.serverName
                                                                                       andServiceId:@"software-update"];
        
        NSTreeNode *softwareUpdateNode = [NSTreeNode treeNodeWithRepresentedObject:softwareUpdateService];
        [serverNode.mutableChildNodes addObject:softwareUpdateNode];
    }

    if (self.vpnEnabled) {
        ServiceNavigationItem *vpnService = [[ServiceNavigationItem alloc] initWithTitle:@"VPN"
                                                                              serverHost:self.serverName
                                                                            andServiceId:@"vpn"];
        
        NSTreeNode *vpnNode = [NSTreeNode treeNodeWithRepresentedObject:vpnService];
        [serverNode.mutableChildNodes addObject:vpnNode];
    }

    if (self.webEnabled) {
        ServiceNavigationItem *webService = [[ServiceNavigationItem alloc] initWithTitle:@"Web"
                                                                              serverHost:self.serverName
                                                                            andServiceId:@"web"];
        
        NSTreeNode *webNode = [NSTreeNode treeNodeWithRepresentedObject:webService];
        [serverNode.mutableChildNodes addObject:webNode];
    }

    if (self.xgridEnabled) {
        ServiceNavigationItem *xgridService = [[ServiceNavigationItem alloc] initWithTitle:@"Xgrid"
                                                                                serverHost:self.serverName
                                                                              andServiceId:@"xgrid"];
        
        NSTreeNode *xgridNode = [NSTreeNode treeNodeWithRepresentedObject:xgridService];
        [serverNode.mutableChildNodes addObject:xgridNode];
    }
    
    return serverNode;
}

@end
