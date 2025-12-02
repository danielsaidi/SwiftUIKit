# String Catalog Public Key Builder

This command-line tool can generate public key wrappers for
a string catalog's internal auto-generated keys.


## Why is this needed?

When you manually add localized strings to a string catalog, 
Xcode will automatically generate keys that you can use to
translate these keys. These keys are however internal, and
can not be accessed from other targets.

This script will auto-generate public key wrappers for all
internal keys. These public keys can be used from any other
target, and will use the `.module` bundle to ensure that a
string is properly localised from anywhere. 

This script will also parse string namespaces into a nested
string hierarchy, to allow you to group strings together.


## Usage

Run `swift run l10n-gen --help` for help and usage examples.

This command can parse a `from` catalog and write keys to a
`to` target file path, or parse any `package` module string
catalog at the package-relative `catalogPath` and write it
to a package-relative `targetPath`.


## Terminal command

The `/scripts/l10n-gen.script` can be used as a convenience.


## Namespaces

You can add dots to a key to apply namespaces. For instance,
`Experiments.DebugScreen.Title` would generate:

```
.l10n.experiments.debugScreen.title
```

You can customize the `l10n` root namespace name, to wrap a
key collection in a specific root namespace. This is needed
if you parse many different string catalogs, to avoid that
the generated keys collide.

Using namespaces also reduces the risk of merge conflicts.
