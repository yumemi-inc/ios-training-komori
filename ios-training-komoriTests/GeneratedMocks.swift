// MARK: - Mocks generated from file: ios-training-komori/Model/WeatherModel.swift
//
//  WeatherModel.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/
import Cuckoo
@testable import ios_training_komori

import Combine
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
    

    
    
    
    
     var weatherPublisher: AnyPublisher<Weather?, Never> {
        get {
            return cuckoo_manager.getter("weatherPublisher",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.weatherPublisher)
        }
        
    }
    
    
    
    
    
     var errorPublisher: AnyPublisher<Error, Never> {
        get {
            return cuckoo_manager.getter("errorPublisher",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.errorPublisher)
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
        
        
        
        var weatherPublisher: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockWeatherProvider, AnyPublisher<Weather?, Never>> {
            return .init(manager: cuckoo_manager, name: "weatherPublisher")
        }
        
        
        
        
        var errorPublisher: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockWeatherProvider, AnyPublisher<Error, Never>> {
            return .init(manager: cuckoo_manager, name: "errorPublisher")
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
    
        
        
        
        var weatherPublisher: Cuckoo.VerifyReadOnlyProperty<AnyPublisher<Weather?, Never>> {
            return .init(manager: cuckoo_manager, name: "weatherPublisher", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var errorPublisher: Cuckoo.VerifyReadOnlyProperty<AnyPublisher<Error, Never>> {
            return .init(manager: cuckoo_manager, name: "errorPublisher", callMatcher: callMatcher, sourceLocation: sourceLocation)
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
    
    
    
    
     var weatherPublisher: AnyPublisher<Weather?, Never> {
        get {
            return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Weather?, Never>).self)
        }
        
    }
    
    
    
    
    
     var errorPublisher: AnyPublisher<Error, Never> {
        get {
            return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Error, Never>).self)
        }
        
    }
    
    

    

    
    
    
    
     func fetch(area: String, date: Date)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockWeatherModel: WeatherModel, Cuckoo.ClassMock {
    
     typealias MocksType = WeatherModel
    
     typealias Stubbing = __StubbingProxy_WeatherModel
     typealias Verification = __VerificationProxy_WeatherModel

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: WeatherModel?

     func enableDefaultImplementation(_ stub: WeatherModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var weather: Weather? {
        get {
            return cuckoo_manager.getter("weather",
                superclassCall:
                    
                                    super.weather
                    ,
                defaultCall:  __defaultImplStub!.weather)
        }
        
    }
    
    
    
    
    
     override var weatherPublisher: AnyPublisher<Weather?, Never> {
        get {
            return cuckoo_manager.getter("weatherPublisher",
                superclassCall:
                    
                                    super.weatherPublisher
                    ,
                defaultCall:  __defaultImplStub!.weatherPublisher)
        }
        
    }
    
    
    
    
    
     override var errorPublisher: AnyPublisher<Error, Never> {
        get {
            return cuckoo_manager.getter("errorPublisher",
                superclassCall:
                    
                                    super.errorPublisher
                    ,
                defaultCall:  __defaultImplStub!.errorPublisher)
        }
        
    }
    
    

    

    
    
    
    
     override func fetch(area: String, date: Date)  {
        
    return cuckoo_manager.call(
    """
    fetch(area: String, date: Date)
    """,
            parameters: (area, date),
            escapingParameters: (area, date),
            superclassCall:
                
                super.fetch(area: area, date: date)
                ,
            defaultCall: __defaultImplStub!.fetch(area: area, date: date))
        
    }
    
    

     struct __StubbingProxy_WeatherModel: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var weather: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockWeatherModel, Weather?> {
            return .init(manager: cuckoo_manager, name: "weather")
        }
        
        
        
        
        var weatherPublisher: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockWeatherModel, AnyPublisher<Weather?, Never>> {
            return .init(manager: cuckoo_manager, name: "weatherPublisher")
        }
        
        
        
        
        var errorPublisher: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockWeatherModel, AnyPublisher<Error, Never>> {
            return .init(manager: cuckoo_manager, name: "errorPublisher")
        }
        
        
        
        
        
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(area: M1, date: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, Date)> where M1.MatchedType == String, M2.MatchedType == Date {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date)>] = [wrap(matchable: area) { $0.0 }, wrap(matchable: date) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockWeatherModel.self, method:
    """
    fetch(area: String, date: Date)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_WeatherModel: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var weather: Cuckoo.VerifyReadOnlyProperty<Weather?> {
            return .init(manager: cuckoo_manager, name: "weather", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var weatherPublisher: Cuckoo.VerifyReadOnlyProperty<AnyPublisher<Weather?, Never>> {
            return .init(manager: cuckoo_manager, name: "weatherPublisher", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var errorPublisher: Cuckoo.VerifyReadOnlyProperty<AnyPublisher<Error, Never>> {
            return .init(manager: cuckoo_manager, name: "errorPublisher", callMatcher: callMatcher, sourceLocation: sourceLocation)
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


 class WeatherModelStub: WeatherModel {
    
    
    
    
     override var weather: Weather? {
        get {
            return DefaultValueRegistry.defaultValue(for: (Weather?).self)
        }
        
    }
    
    
    
    
    
     override var weatherPublisher: AnyPublisher<Weather?, Never> {
        get {
            return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Weather?, Never>).self)
        }
        
    }
    
    
    
    
    
     override var errorPublisher: AnyPublisher<Error, Never> {
        get {
            return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Error, Never>).self)
        }
        
    }
    
    

    

    
    
    
    
     override func fetch(area: String, date: Date)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




