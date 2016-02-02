import KsApi
import Models
import ReactiveCocoa

/**
 A collection of **all** global variables and singletons that the app wants access to.
*/
struct Environment {
  let apiService: ServiceType
  let currentUser: CurrentUserType
  let language: Language
  let locale: NSLocale
  let timeZone: NSTimeZone
  let countryCode: String
  let launchedCountries: LaunchedCountries
  let debounceScheduler: DateSchedulerType

  init(
    apiService: ServiceType = Service.shared,
    currentUser: CurrentUserType = CurrentUser.shared,
    language: Language = .en,
    locale: NSLocale = .currentLocale(),
    timeZone: NSTimeZone = .localTimeZone(),
    countryCode: String = "US",
    launchedCountries: LaunchedCountries = .init(),
    debounceScheduler: DateSchedulerType = QueueScheduler.mainQueueScheduler) {

      self.apiService = apiService
      self.currentUser = currentUser
      self.language = language
      self.locale = locale
      self.timeZone = timeZone
      self.countryCode = countryCode
      self.launchedCountries = launchedCountries
      self.debounceScheduler = debounceScheduler
  }
}

extension Environment : CustomStringConvertible, CustomDebugStringConvertible {

  var description: String {
    return "(apiService: \(self.apiService), currentUser: \(self.currentUser), language: \(language), locale: \(self.locale.localeIdentifier), timeZone: \(self.timeZone), countryCode: \(self.countryCode), launchedCountries: \(self.launchedCountries))"
  }

  var debugDescription: String {
    return self.description
  }
}