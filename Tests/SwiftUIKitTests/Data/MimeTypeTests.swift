//
//  MimeTypeTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-03-29.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

class MimeTypeTests: XCTestCase {
    
    func testAllTypesHaveValidPrefix() {
        MimeType.Application.allCases.forEach {
            let result = MimeType.application($0).id
            let hasValidPrefix = result.hasPrefix("application/")
            XCTAssertTrue(hasValidPrefix)
        }
    }
    
    func id(forAudio type: MimeType.Audio) -> String {
        MimeType.audio(type).id
    }
    
    func testIdIsValidForAllAudioTypes() {
        XCTAssertEqual(id(forAudio: .kar), "audio/midi")
        XCTAssertEqual(id(forAudio: .m4a), "audio/x-m4a")
        XCTAssertEqual(id(forAudio: .midi), "audio/midi")
        XCTAssertEqual(id(forAudio: .mp3), "audio/mpeg")
        XCTAssertEqual(id(forAudio: .ogg), "audio/ogg")
        XCTAssertEqual(id(forAudio: .ra), "audio/x-realaudio")
    }
    
    func id(forImage type: MimeType.Image) -> String {
        MimeType.image(type).id
    }
    
    func testIdIsValidForAllImageTypes() {
        XCTAssertEqual(id(forImage: .bmp), "image/x-ms-bmp")
        XCTAssertEqual(id(forImage: .gif), "image/gif")
        XCTAssertEqual(id(forImage: .ico), "image/x-icon")
        XCTAssertEqual(id(forImage: .jpeg), "image/jpeg")
        XCTAssertEqual(id(forImage: .jng), "image/x-jng")
        XCTAssertEqual(id(forImage: .png), "image/png")
        XCTAssertEqual(id(forImage: .svg), "image/svg+xml")
        XCTAssertEqual(id(forImage: .tiff), "image/tiff")
        XCTAssertEqual(id(forImage: .webp), "image/webp")
        XCTAssertEqual(id(forImage: .wbmp), "image/vnd.wap.wbmp")
    }
    
    func id(forText type: MimeType.Text) -> String {
        MimeType.text(type).id
    }
    
    func testIdIsValidForAllTextTypes() {
        XCTAssertEqual(id(forText: .plain), "text/plain")
        XCTAssertEqual(id(forText: .css), "text/css")
        XCTAssertEqual(id(forText: .html), "text/html")
        XCTAssertEqual(id(forText: .mathml), "text/mathml")
        XCTAssertEqual(id(forText: .xml), "text/xml")
        
        XCTAssertEqual(id(forText: .jad), "text/vnd.sun.j2me.app-descriptor")
        XCTAssertEqual(id(forText: .wml), "text/vnd.wap.wml")
        XCTAssertEqual(id(forText: .htc), "text/x-component")
    }
    
    func id(forVideo type: MimeType.Video) -> String {
        MimeType.video(type).id
    }
    
    func testIdIsValidForAllVideoTypes() {
        XCTAssertEqual(id(forVideo: .asf), "video/x-ms-asf")
        XCTAssertEqual(id(forVideo: .asx), "video/x-ms-asf")
        XCTAssertEqual(id(forVideo: .avi), "video/x-msvideo")
        XCTAssertEqual(id(forVideo: .flv), "video/x-flv")
        XCTAssertEqual(id(forVideo: .m4v), "video/x-m4v")
        XCTAssertEqual(id(forVideo: .mng), "video/x-mng")
        XCTAssertEqual(id(forVideo: .mp4), "video/mp4")
        XCTAssertEqual(id(forVideo: .mpeg), "video/mpeg")
        XCTAssertEqual(id(forVideo: .mov), "video/quicktime")
        XCTAssertEqual(id(forVideo: .ts), "video/mp2t")
        XCTAssertEqual(id(forVideo: .video3gpp), "video/3gpp")
        XCTAssertEqual(id(forVideo: .webm), "video/webm")
        XCTAssertEqual(id(forVideo: .wmv), "video/x-ms-wmv")
    }
}
