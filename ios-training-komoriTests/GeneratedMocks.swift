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
    

    

    

    
    
    
    
     func fetch(area: String, date: Date, completion: @escaping (Result<Weather, Error>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    fetch(area: String, date: Date, completion: @escaping (Result<Weather, Error>) -> Void)
    """,
            parameters: (area, date, completion),
            escapingParameters: (area, date, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetch(area: area, date: date, completion: completion))
        
    }
    
    
    
    
    
     func fetchWithOptionalClosure(area: String, date: Date, completion: ((Result<Weather, Error>) -> Void)?)  {
        
    return cuckoo_manager.call(
    """
    fetchWithOptionalClosure(area: String, date: Date, completion: ((Result<Weather, Error>) -> Void)?)
    """,
            parameters: (area, date, completion),
            escapingParameters: (area, date, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchWithOptionalClosure(area: area, date: date, completion: completion))
        
    }
    
    

     struct __StubbingProxy_WeatherProvider: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(area: M1, date: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, Date, (Result<Weather, Error>) -> Void)> where M1.MatchedType == String, M2.MatchedType == Date, M3.MatchedType == (Result<Weather, Error>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date, (Result<Weather, Error>) -> Void)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockWeatherProvider.self, method:
    """
    fetch(area: String, date: Date, completion: @escaping (Result<Weather, Error>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func fetchWithOptionalClosure<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(area: M1, date: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, Date, ((Result<Weather, Error>) -> Void)?)> where M1.MatchedType == String, M2.MatchedType == Date, M3.OptionalMatchedType == ((Result<Weather, Error>) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date, ((Result<Weather, Error>) -> Void)?)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockWeatherProvider.self, method:
    """
    fetchWithOptionalClosure(area: String, date: Date, completion: ((Result<Weather, Error>) -> Void)?)
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
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(area: M1, date: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, Date, (Result<Weather, Error>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == Date, M3.MatchedType == (Result<Weather, Error>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date, (Result<Weather, Error>) -> Void)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    fetch(area: String, date: Date, completion: @escaping (Result<Weather, Error>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func fetchWithOptionalClosure<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(area: M1, date: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, Date, ((Result<Weather, Error>) -> Void)?), Void> where M1.MatchedType == String, M2.MatchedType == Date, M3.OptionalMatchedType == ((Result<Weather, Error>) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date, ((Result<Weather, Error>) -> Void)?)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    fetchWithOptionalClosure(area: String, date: Date, completion: ((Result<Weather, Error>) -> Void)?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class WeatherProviderStub: WeatherProvider {
    

    

    
    
    
    
     func fetch(area: String, date: Date, completion: @escaping (Result<Weather, Error>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func fetchWithOptionalClosure(area: String, date: Date, completion: ((Result<Weather, Error>) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




