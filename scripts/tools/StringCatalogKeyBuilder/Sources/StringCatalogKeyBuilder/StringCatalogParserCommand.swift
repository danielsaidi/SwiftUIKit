import ArgumentParser
import Foundation

/// This command can be used to parse a string catalog and generate
/// Swift code that allows other targets to access its internal keys.
struct StringCatalogParserCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "l10n-gen",
        abstract: "Generate Swift code for a string catalog in any package.",
        usage: """
    swift run l10n-gen --from /path/to/catalog.json --to /path/to/output.swift [--root <ROOT_NAMESPACE>]
    swift run l10n-gen --package /path/to/package/ --catalog package/relative/catalog/path --target package/relative/file/path [--root <ROOT_NAMESPACE>]
    """
    )

    @OptionGroup var packageOptions: PackageOptions
    @OptionGroup var pathOptions: PathOptions

    @Option var root: String = "l10n"

    func run() throws {
        print("\nGenerating code...\n")
        if try packageOptions.tryExecute(withRootNamespace: root) { return }
        if try pathOptions.tryExecute(withRootNamespace: root) { return }
        fatalError("No matching operation. Aborting.")
    }
}

/// These options are used when using the `--package` argument.
struct PackageOptions: ParsableArguments {
    @Option(name: .long, help: "A command-relative path to a Swift Package.")
    var package: String?

    @Option(name: .long, help: "A package-relative path to the string catalog.")
    var catalog: String?

    @Option(name: .long, help: "A package-relative path to the target output file.")
    var target: String?

    func tryExecute(
        withRootNamespace root: String
    ) throws -> Bool {
        guard let package, let catalog, let target else { return false }
        let catalogPath = (package + catalog).cleanPath()
        let filePath = (package + target).cleanPath()
        try generateCode(from: catalogPath, to: filePath, withRootNamespace: root)
        return true
    }
}

/// These options are used when using the `--from` and `--to` arguments.
struct PathOptions: ParsableArguments {
    @Option(name: .long, help: "A command-relative path to a source string catalog.")
    var from: String?

    @Option(name: .long, help: "A command-relative path to a target output file.")
    var to: String?

    func tryExecute(
        withRootNamespace root: String
    ) throws -> Bool {
        guard let from, let to else { return false }
        try generateCode(from: from, to: to, withRootNamespace: root)
        return true
    }
}

extension ParsableArguments {
    func generateCode(
        from catalogPath: String,
        to filePath: String,
        withRootNamespace root: String
    ) throws {
        // Generate wrappers
        print("Generating code from \"\(catalogPath)\" to \"\(filePath)\"...\n")
        let stringCatalog = try StringCatalog(path: catalogPath)
        let code = stringCatalog.generatePublicKeyWrappers(withRootNamespace: root)

        // Create parent directory if it doesn't exist
        let url = URL(fileURLWithPath: filePath)
        let directory = url.deletingLastPathComponent()
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)

        // Write code to file.
        try code.write(toFile: filePath, atomically: true, encoding: .utf8)
    }
}

private extension String {
    func cleanPath() -> String {
        replacingOccurrences(of: "//", with: "/")
    }
}
