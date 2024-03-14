//
//  MimeType.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-03-26.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import UniformTypeIdentifiers

/**
 This enum represents a set of different MIME and file types.
 
 Note that some types may be expected to be a different type,
 but are instead an `.application` type. For instance, `json`
 is a text format, but the mime type is `application/json`.
 */
public enum MimeType: Identifiable {
    
    case
        application(Application),
        audio(Audio),
        image(Image),
        text(Text),
        video(Video)
    
    public var identifier: String { id }
    
    public var id: String {
        switch self {
        case .audio(let type): return "audio/\(type.id)"
        case .application(let type): return "application/\(type.id)"
        case .image(let type): return "image/\(type.id)"
        case .text(let type): return "text/\(type.id)"
        case .video(let type): return "video/\(type.id)"
        }
    }
    
    
    public enum Application: CaseIterable, Identifiable {
        case
            ai, atom, bin, crt, cco, deb, der, dll, dmg, doc,
            docx, ear, eot, eps, exe, hqx, img, iso, jar,
            jardiff, jnlp, js, json, kml, kmz, m3u8, msi, msm,
            msp, pdb, pdf, pem, pl, pm, ppt, pptx, prc, ps,
            rar, rpm, rss, rtf, run, sea, sit, swf, war, tcl,
            wmlc, woff, x7z, xhtml, xls, xlsx, xpi, xspf, zip
        
        public var id: String {
            switch self {
            case .jar, .war, .ear: return "java-archive"
            case .bin, .exe, .dll, .deb, .dmg, .iso, .img, .msi, .msp, .msm: return "octet-stream"
            case .pl, .pm: return "x-perl"
            case .pdb, .prc: return "x-pilot"
            case .crt, .der, .pem: return "x-x509-ca-cert"
                
            case .ai: return "postscript"
            case .atom: return "atom+xml"
            case .cco: return "x-cocoa"
            case .doc: return "msword"
            case .docx: return "vnd.openxmlformats-officedocument.wordprocessingml.document"
            case .eot: return "vnd.ms-fontobject"
            case .eps: return "postscript"
            case .hqx: return "mac-binhex40"
            case .jardiff: return "x-java-archive-diff"
            case .jnlp: return "x-java-jnlp-file"
            case .js: return "javascript"
            case .json: return "json"
            case .kml: return "vnd.google-earth.kml+xml"
            case .kmz: return "vnd.google-earth.kmz"
            case .m3u8: return "vnd.apple.mpegurl"
            case .pdf: return "pdf"
            case .ppt: return "vnd.ms-powerpoint"
            case .pptx: return "vnd.openxmlformats-officedocument.presentationml.presentation"
            case .ps: return "postscript"
            case .rar: return "x-rar-compressed"
            case .rpm: return "x-redhat-package-manager"
            case .rss: return "rss+xml"
            case .rtf: return "rtf"
            case .run: return "x-makeself"
            case .sea: return "x-sea"
            case .sit: return "x-stuffit"
            case .swf: return "x-shockwave-flash"
            case .tcl: return "x-tcl"
            case .woff: return "font-woff"
            case .wmlc: return "vnd.wap.wmlc"
            case .x7z: return "x-7z-compressed"
            case .xhtml: return "xhtml+xml"
            case .xls: return "vnd.ms-excel"
            case .xlsx: return "vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            case .xpi: return "x-xpinstall"
            case .xspf: return "xspf+xml"
            case .zip: return "zip"
            }
        }
    }
    
    public enum Audio: String, CaseIterable, Identifiable {
        case kar, m4a, midi, mp3, ogg, ra
        
        public var id: String {
            switch self {
            case .midi, .ogg: return rawValue
            case .kar: return "midi"
            case .m4a: return "x-m4a"
            case .mp3: return "mpeg"
            case .ra: return "x-realaudio"
            }
        }
    }
    
    public enum Image: String, CaseIterable, Identifiable {
        case bmp, gif, ico, jpeg, jng, png, svg, tiff, wbmp, webp
        
        public var id: String {
            switch self {
            case .gif, .jpeg, .png, .tiff, .webp: return rawValue
            case .bmp: return "x-ms-bmp"
            case .ico: return "x-icon"
            case .jng: return "x-jng"
            case .svg: return "svg+xml"
            case .wbmp: return "vnd.wap.wbmp"
            }
        }
    }
    
    public enum Text: String, CaseIterable, Identifiable {
        case plain, css, htc, html, jad, mathml, xml, wml
        
        public var id: String {
            switch self {
            case .plain, .css, .html, .mathml, .xml: return rawValue
            case .jad: return "vnd.sun.j2me.app-descriptor"
            case .wml: return "vnd.wap.wml"
            case .htc: return "x-component"
            }
        }
    }
    
    public enum Video: String, CaseIterable, Identifiable {
        case asf, asx, avi, flv, m4v, mng, mp4, mpeg, mov, ts, video3gpp, webm, wmv
        
        public var id: String {
            switch self {
            case .mp4, .mpeg: return rawValue
            case .asf: return "x-ms-asf"
            case .asx: return "x-ms-asf"
            case .avi: return "x-msvideo"
            case .flv: return "x-flv"
            case .m4v: return "x-m4v"
            case .mng: return "x-mng"
            case .mov: return "quicktime"
            case .ts: return "mp2t"
            case .video3gpp: return "3gpp"
            case .webm: return "webm"
            case .wmv: return "x-ms-wmv"
            }
        }
    }
}
