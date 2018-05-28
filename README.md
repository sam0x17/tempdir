# tempdir

A simple crystal language library providing on-the-fly temporary directories
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
directory that gets created. The suffix is populated with a 16-diit random number.

```crystal
require "tempdir"

dir = TempDir.new "my-prefix"
puts dir.to_s # prints "/tmp/my-prefix-7135891628311294"
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/tempdir/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [sam0x17](https://github.com/sam0x17) Sam Johnson - creator, maintainer
