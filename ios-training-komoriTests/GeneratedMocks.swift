// MARK: - Mocks generated from file: ios-training-komori/Model/WeatherModel.swift
//
//  WeatherModel.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/
import Cuckoo
@testable import ios_training_komori

import Foundation
import YumemiWeather






 class MockWeatherProvider: WeatherProvider, Cuckoo.ProtocolMock {
    
     typealias MocksType = WeatherProvider
    
     typealias Stubbing = __StubbingProxy_WeatherProvider
     typealias Verification = __VerificationProxy_WeatherProvider

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: WeatherProvider?

     func enableDefaultImplementation(_ stub: WeatherProvider) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func fetch(area: String, date: Date) async -> Result<Weather, Error> {
        
    return await cuckoo_manager.call(
    """
    fetch(area: String, date: Date) async -> Result<Weather, Error>
    """,
            parameters: (area, date),
            escapingParameters: (area, date),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: await __defaultImplStub!.fetch(area: area, date: date))
        
    }
    
    

     struct __StubbingProxy_WeatherProvider: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(area: M1, date: M2) -> Cuckoo.ProtocolStubFunction<(String, Date), Result<Weather, Error>> where M1.MatchedType == String, M2.MatchedType == Date {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockWeatherProvider.self, method:
    """
    fetch(area: String, date: Date) async -> Result<Weather, Error>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_WeatherProvider: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(area: M1, date: M2) -> Cuckoo.__DoNotUse<(String, Date), Result<Weather, Error>> where M1.MatchedType == String, M2.MatchedType == Date {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }]
            return cuckoo_manager.verify(
    """
    fetch(area: String, date: Date) async -> Result<Weather, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class WeatherProviderStub: WeatherProvider {
    

    

    
    
    
    
     func fetch(area: String, date: Date) async -> Result<Weather, Error>  {
        return DefaultValueRegistry.defaultValue(for: (Result<Weather, Error>).self)
    }
    
    
}




