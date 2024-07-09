// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
public enum DateFormat: String {
    case MMMM_dd = "MMMM dd"
    case MMMM_dd_HH_mm = "MMMM dd HH:mm"
    case ddMMHHmm = "dd/MM HH:mm"
    case dd_MMM = "dd MMM"
    case HH_mm = "HH:mm"
    case MMMM_dd_yyyy = "MMMM dd yyyy"
    case MMMM_yyyy = "MMMM yyyy"
    case MMMM_dd_yyyy_HH_mm = "MMMM dd yyyy HH:mm"
    case dd_MM_yyyy = "dd/MM/yyyy"
    case h_mm_a_dd_MMM_yyyy = "h:mma dd MMM yyyy"
    case dd_MM_yyyy_HH_mm = "dd/MM/yyyy HH:mm"
    case dd_MM_yyyy_HH_mm_a = "dd/MM/yyyy h:mm a"
    case MMM_d_yyyy = "MMM d, yyyy"
    case dd_MM_yyyy_hh_mm_a = "dd/MM/yy h:mm a"
    case dd_MM = "dd/MM"
    case yyyy_mm_dd = "yyyy-MM-dd"
    case yyyy_mm_dd_HH_mm = "yyyy-MM-dd HH:mm"
    case yyyymmdd_HH_mm = "yyyyMMdd HH:mm"
    case hh_mm_a_EEEE = "h:mm a, EEEE"
    case hh_mm_a = "h:mm a"
    case EEEE = "EEEE"
    case EEE = "EEE"
    case MMM_dd = "MMM dd"
    case MMM_yyyy = "MMM yyyy"
    case EEE_MMM_dd_yyyy = "EEE MMM dd yyyy"
    case dd_MM_yy = "dd/MM/yy"
    case dd_MMM_yyyy = "dd MMM yyyy"
    case dd_MMMM_yyyy = "dd MMMM yyyy"
    case yyyy_MM_dd_T_HH_mm_ssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
}

public class SparkleDateFormatter {
    
    private let dateFormatter: DateFormatter
    
    public init(){
        dateFormatter = DateFormatter()
    }
    
    public func dateFromString(_ string: String, dateFormat: DateFormat) -> String {
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let theDate =  dateFormatter.date(from: string) ?? Date()
        return stringFromDate(theDate, dateFormat: dateFormat)
    }
    
    private func stringFromDate(_ date: Date, dateFormat: DateFormat = .MMMM_dd) -> String {
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.string(from: date)
    }
    
    
}
