# tempdir

A simple crystal language shard providing on-the-fly temporary directories
that are automatically deleted via an `at_exit` hook.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  tempdir:
    github: sam0x17/tempdir
```

## Usage

Simply call the constructor on the `TempDir` class and a temporary directory will be created.
You can pass a string argument to the constructor and this will be used as a prefix to the
directory that gets created. The suffix is populated with a 16-diit random number. When
the current crystal program exits, any directories created by TempDir will be deleted
automatically.

```crystal
require "tempdir"

dir = TempDir.new "my-prefix"
puts dir.to_s # prints "/tmp/my-prefix-7135891628311294"
```

Also available is a block-based invocation style, which will create a temporary directory
that will exist for the lifetime of the block that is passed (when the block ends, the
directory is deleted).

```crystal
require "tempdir"

TempDir.create do |path|
  # do stuff with path
end
```

As with the class-based invocation style, you can also pass a prefix:

```crystal
require "tempdir"

TempDir.create("my-prefix") do |path|
  # do stuff with path
end
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/tempdir/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [sam0x17](https://github.com/sam0x17) Sam Johnson - creator, maintainer
