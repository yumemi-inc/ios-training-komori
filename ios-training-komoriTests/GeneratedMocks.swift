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
    

    
    
    
    
     var delegate: WeatherProviderDelegate? {
        get {
            return cuckoo_manager.getter("delegate",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.delegate)
        }
        
        set {
            cuckoo_manager.setter("delegate",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.delegate = newValue)
        }
        
    }
    
    

    

    
    
    
    
     func fetch(area: String, date: Date)  {
        
    return cuckoo_manager.call(
    """
    fetch(area: String, date: Date)
    """,
            parameters: (area, date),
            escapingParameters: (area, date),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetch(area: area, date: date))
        
    }
    
    

     struct __StubbingProxy_WeatherProvider: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var delegate: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockWeatherProvider, WeatherProviderDelegate> {
            return .init(manager: cuckoo_manager, name: "delegate")
        }
        
        
        
        
        
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(area: M1, date: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, Date)> where M1.MatchedType == String, M2.MatchedType == Date {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockWeatherProvider.self, method:
    """
    fetch(area: String, date: Date)
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
    
        
        
        
        var delegate: Cuckoo.VerifyOptionalProperty<WeatherProviderDelegate> {
            return .init(manager: cuckoo_manager, name: "delegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(area: M1, date: M2) -> Cuckoo.__DoNotUse<(String, Date), Void> where M1.MatchedType == String, M2.MatchedType == Date {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }]
            return cuckoo_manager.verify(
    """
    fetch(area: String, date: Date)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class WeatherProviderStub: WeatherProvider {
    
    
    
    
     var delegate: WeatherProviderDelegate? {
        get {
            return DefaultValueRegistry.defaultValue(for: (WeatherProviderDelegate?).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     func fetch(area: String, date: Date)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockWeatherProviderDelegate: WeatherProviderDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = WeatherProviderDelegate
    
     typealias Stubbing = __StubbingProxy_WeatherProviderDelegate
     typealias Verification = __VerificationProxy_WeatherProviderDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: WeatherProviderDelegate?

     func enableDefaultImplementation(_ stub: WeatherProviderDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func weatherProvider(_ weatherProvider: WeatherProvider, didUpdateWeather weather: Weather)  {
        
    return cuckoo_manager.call(
    """
    weatherProvider(_: WeatherProvider, didUpdateWeather: Weather)
    """,
            parameters: (weatherProvider, weather),
            escapingParameters: (weatherProvider, weather),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.weatherProvider(weatherProvider, didUpdateWeather: weather))
        
    }
    
    
    
    
    
     func weatherProvider(_ weatherProvider: WeatherProvider, didReceiveError error: Error)  {
        
    return cuckoo_manager.call(
    """
    weatherProvider(_: WeatherProvider, didReceiveError: Error)
    """,
            parameters: (weatherProvider, error),
            escapingParameters: (weatherProvider, error),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.weatherProvider(weatherProvider, didReceiveError: error))
        
    }
    
    

     struct __StubbingProxy_WeatherProviderDelegate: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func weatherProvider<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ weatherProvider: M1, didUpdateWeather weather: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(WeatherProvider, Weather)> where M1.MatchedType == WeatherProvider, M2.MatchedType == Weather {
            let matchers: [Cuckoo.ParameterMatcher<(WeatherProvider, Weather)>] = [wrap(matchable: weatherProvider) { $0.0 }, wrap(matchable: weather) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockWeatherProviderDelegate.self, method:
    """
    weatherProvider(_: WeatherProvider, didUpdateWeather: Weather)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func weatherProvider<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ weatherProvider: M1, didReceiveError error: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(WeatherProvider, Error)> where M1.MatchedType == WeatherProvider, M2.MatchedType == Error {
            let matchers: [Cuckoo.ParameterMatcher<(WeatherProvider, Error)>] = [wrap(matchable: weatherProvider) { $0.0 }, wrap(matchable: error) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockWeatherProviderDelegate.self, method:
    """
    weatherProvider(_: WeatherProvider, didReceiveError: Error)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_WeatherProviderDelegate: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func weatherProvider<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ weatherProvider: M1, didUpdateWeather weather: M2) -> Cuckoo.__DoNotUse<(WeatherProvider, Weather), Void> where M1.MatchedType == WeatherProvider, M2.MatchedType == Weather {
            let matchers: [Cuckoo.ParameterMatcher<(WeatherProvider, Weather)>] = [wrap(matchable: weatherProvider) { $0.0 }, wrap(matchable: weather) { $0.1 }]
            return cuckoo_manager.verify(
    """
    weatherProvider(_: WeatherProvider, didUpdateWeather: Weather)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func weatherProvider<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ weatherProvider: M1, didReceiveError error: M2) -> Cuckoo.__DoNotUse<(WeatherProvider, Error), Void> where M1.MatchedType == WeatherProvider, M2.MatchedType == Error {
            let matchers: [Cuckoo.ParameterMatcher<(WeatherProvider, Error)>] = [wrap(matchable: weatherProvider) { $0.0 }, wrap(matchable: error) { $0.1 }]
            return cuckoo_manager.verify(
    """
    weatherProvider(_: WeatherProvider, didReceiveError: Error)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class WeatherProviderDelegateStub: WeatherProviderDelegate {
    

    

    
    
    
    
     func weatherProvider(_ weatherProvider: WeatherProvider, didUpdateWeather weather: Weather)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func weatherProvider(_ weatherProvider: WeatherProvider, didReceiveError error: Error)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




