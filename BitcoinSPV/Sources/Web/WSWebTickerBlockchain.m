//
//  WSWebTickerBlockchain.m
//  BitcoinSPV
//
//  Created by Davide De Rosa on 01/01/15.
//  Copyright (c) 2015 Davide De Rosa. All rights reserved.
//
//  https://github.com/keeshux
//
//  This file is part of BitcoinSPV.
//
//  BitcoinSPV is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  BitcoinSPV is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with BitcoinSPV.  If not, see <http://www.gnu.org/licenses/>.
//

#import "WSWebTickerBlockchain.h"
#import "WSJSONClient.h"
#import "WSLogging.h"
#import "WSErrors.h"
#import "WSMacrosCore.h"

static NSString *const          WSWebTickerBlockchainBaseURL            = @"https://blockchain.info/";

@implementation WSWebTickerBlockchain

#pragma mark WSWebTicker

- (NSString *)provider
{
    return WSWebTickerProviderBlockchain;
}

- (void)fetchRatesWithSuccess:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    WSExceptionCheckIllegal(success);
    WSExceptionCheckIllegal(failure);
    
    NSURL *baseURL = [NSURL URLWithString:WSWebTickerBlockchainBaseURL];
    NSString *path = @"ticker";
    
    [[WSJSONClient sharedInstance] asynchronousRequestWithBaseURL:baseURL path:path success:^(NSInteger statusCode, id object) {
        if (statusCode == 200) {
            NSDictionary *result = object;
            
            NSMutableDictionary *conversionRates = [[NSMutableDictionary alloc] initWithCapacity:result.count];
            for (NSString *currencyCode in [result allKeys]) {
                NSDictionary *currencyData = result[currencyCode];
                NSString *rateString = currencyData[@"last"];
                const double rate = [rateString doubleValue];
                
                if (rate > 0.0) {
                    conversionRates[currencyCode] = @(rate);
                }
                else {
                    DDLogWarn(@"Invalid BTC/%@ rate (%@)", currencyCode, rateString);
                }
            }
            success(conversionRates);
        }
        else {
            failure(WSErrorMake(WSErrorCodeWebService, @"Unexpected ticker status code (%d)", statusCode));
        }
    } failure:^(NSInteger statusCode, NSError *error) {
        failure(error);
    }];
}

@end
